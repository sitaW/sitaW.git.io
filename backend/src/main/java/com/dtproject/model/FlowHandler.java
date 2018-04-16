package com.dtproject.model;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
/*import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;*/
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
/*import org.springframework.webflow.execution.RequestContext;*/
import org.springframework.webflow.execution.RequestContext;

import com.dtproject.service.BillingService;
import com.dtproject.service.CartItemService;
import com.dtproject.service.CartService;
import com.dtproject.service.ProductService;
import com.dtproject.service.ShippingService;
import com.dtproject.service.UserService;

@Component
public class FlowHandler 
{
	
	@Autowired
	private User user;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CartItemService cartItemService;
	
	@Autowired
	private ShippingService shippingService;
	
	@Autowired
	private BillingService billingService;
	
	@Autowired
	private CartService cartService;
	
	private List<ShippingAddress> addressList;
	
	public void initOrders()
	{
		System.out.println("Init orders");
		String username=SecurityContextHolder.getContext().getAuthentication().getName();
		user=userService.findUserByName(username);
	}
	
	public Orders addToCart(int pId, int pQuantity, Orders orders)
	{
		orders.setsAddress(new ShippingAddress());
		Product product=productService.findProductById(pId);
		orders.setProduct(product);
		
		List<CartItem> cartItems=cartItemService.findByCartId(user.getCartId());
		CartItem cart=new CartItem();
		int i=0;
		for(CartItem cartItem: cartItems)
		{
			if(cartItem.getProductId()==pId)
			{
				cart.setCartId(cartItem.getCartId());
				cart.setCartItem_id(cartItem.getCartItem_id());
				cart.setProductId(cartItem.getProductId());
				cart.setProductprice(cartItem.getProductprice()+(product.getpPrice()*pQuantity));
				cart.setQuantity(pQuantity);
				orders.setQ(cartItem.getQuantity());
				i=1;
			}
		}
		if(i==0)
		{
			cart.setCartId(user.getCartId());
			cart.setProductId(pId);
			cart.setQuantity(pQuantity);
			cart.setProductprice(product.getpPrice());
		}
		orders.setCartItem(cart);
		return orders;
	}
	
	public String checkShippingAddress()
	{
		List <ShippingAddress> shippingAddress=shippingService.getShippingAddressByUsername(user.getuName());
		if(shippingAddress.isEmpty())
		{
			System.out.println("Shipping address is empty");
			return "empty";
		}
		else
		{
			System.out.println("Available shipping address");
			addressList=shippingAddress;
			return "available";
		}	
	}
		
	public Orders setNewAddress(Orders orders, RequestContext context) {
		String s=context.getRequestParameters().get("billingAddress");
		ShippingAddress shipAdd=orders.getsAddress();
		shipAdd.setUsername(user.getuName());
		orders.setsAddress(shipAdd);
		if(!s.equals(null))
		{
			if(s.equals("on"))
			{
			orders=setBillingAddress(orders);
			}
		}
		
		addressList=new ArrayList<ShippingAddress>();
			
		addressList.add(shipAdd);
		orders=attachAddress(orders);
		System.out.println("address is completed");
		return orders;
	}
	
	public Orders setBillingAddress(Orders orders)
	{
		System.out.println("setting billing address");
		ShippingAddress shipAdd=orders.getsAddress();
		
		BillingAddress billAdd=new BillingAddress();
		billAdd.setAddress(shipAdd.getAddress());
		billAdd.setCity(shipAdd.getCity());
		billAdd.setPincode(shipAdd.getPincode());
		billAdd.setState(shipAdd.getState());
		billAdd.setUsername(user.getuName());
		orders.setbAddress(billAdd);
		return orders;
	}
	
	public Orders attachAddress(Orders orders)
	{
		orders.setShippingAddressList(addressList);
		return orders;
	}
	
	public Orders setSelectedAddress(Orders orders, RequestContext context)
	{
		
		String s=context.getRequestParameters().get("billingAddress");
		ShippingAddress shipAdd=orders.getsAddress();
		
		int sId=orders.getsAddress().getShippingId();
		for(ShippingAddress sAdd :orders.getShippingAddressList())
		{
			if(sAdd.getShippingId()==sId)
			{
				if(s!=null)
				{
					if(s.equals("on"))
					{
					BillingAddress bAdd=billingService.findAddressByUserName(user.getuName());
					orders.setbAddress(bAdd);
					}
				}
				orders.setsAddress(sAdd);
			}
		}
		return orders;
		
	}
	
	public Orders myPayment(Orders orders)
	{
		orders.setPayment(new Payment());
		return orders;
		
	}
	
	public String saveOrder(Orders orders)
	{
		try {
		cartService.saveOrder(orders, user.getCartId());
		String host="smtp.gmail.com";
		String from="s.wissenbach@gmail.com";
		String pass="sima99";
		
		MimeMessagePreparator messagePreparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				  
                MimeMessageHelper helper=new MimeMessageHelper(mimeMessage,true);
                helper.setFrom(from);
                helper.setTo(user.getEmail());
                helper.setSubject("Order Confirmation");
                helper.setText("<table style='width:100%;display:block;position:relative;border-collapse: collapse;font-family: sans-serif;'>" + 
                		"        <thead>" + 
                 		"                <tr>" + 
                 		"                        <th colspan='6'>"+
                 		"							<center> <img src='cid:mylogoid' style='height: 160px;width:220px;transform: scale(1,1);'></center>"+ 
                 		"						</th>" + 
                 		"                </tr>"+ 
                		"        </thead>" + 
                		"        <tbody>" + 
                		"<tr style='height:50px;background-color: #ff4259'>" + 
                		"                        <th colspan='6' style='color:white;font-size: 140%;text-align:centre;'>Your purchase has been confirmed</th>" + 
                		"                </tr>" +
                		"                <tr style='text-align: center;color:grey;'>" + 
                		"                        <td colspan='6' style='height:60px;padding-top:20px'>" + 
                		"                                <h3>Thank your <span style='color:#ff4259;'>"+user.getuName()+"</span> for shopping with us!</h3></td>" + 
                		"                </tr>" + 
                		"                <tr>" + 
                		"                        <td colspan='2'>"+ 
                									"<ul type='none'>\r\n" + 
                		"                                <li><b>Product Name : </b>"+orders.getProduct().getpName()+"</li>" + 
                		"                                <li><b>Description : </b>"+orders.getProduct().getpDescription()+"</li>" + 
                									"</ul>"
                		+ "</td>" + 
                		"                        <td colspan='4'>" + 
                		"                               <center> <img src='cid:mypic' style='height: 200px;width:200px;transform: scale(1,1);'>" + 
                		"                                </center>" + 
                		"                        </td>" + 
                		"                </tr>" + 
                		"                <tr style='height: 60px;width:100%;background-color: hsl(0, 0%, 96%);'>" + 
                		"                        <td colspan='6' style='text-align: center;'>Thank you for placing your order with <b>HouseProud</b>. This email is to confirm your order has been placed successfully, and will be processed & shipped to you soon.</td>" + 
                		"                </tr>" + 
                		"                <tr>" + 
                		"                        <td colspan='3' style='width: 50%'><b>Shipping Address</b></td>" + 
                		"                        <td colspan='3' style='width: 50%'><b>Billing Address</b></td>" + 
                		"                </tr>" + 
                		"                <tr>" + 
                		"                        <td colspan='3' style='width: 50%'>" + 
                		"                                <ul type='none'>" + 
                		"                                        <li><b>Address : </b>"+orders.getsAddress().getAddress()+"</li>" + 
                		"                                        <li><b>City : </b>"+orders.getsAddress().getCity()+"</li>" + 
                		"                                        <li><b>State : </b>"+orders.getsAddress().getState()+"</li>" + 
                		"                                        <li><b>Pincode : </b>"+orders.getsAddress().getPincode()+"</li>" + 
                		"                                </ul>" + 
                		"                        </td>" + 
                		"                        <td colspan='3' style='width: 50%'>" + 
                		"                                <ul type='none'>" + 
                		"                                    <li><b>Address : </b>"+orders.getbAddress().getAddress()+"</li>" + 
                		"                		             <li><b>City : </b>"+orders.getbAddress().getCity()+"</li>" + 
                		"                		             <li><b>State : </b>"+orders.getbAddress().getState()+"</li>" + 
                		"                		             <li><b>Pincode : </b>"+orders.getbAddress().getPincode()+"</li>" + 
                		"                                </ul>" + 
                		"                        </td>" + 
                		"                </tr>" + 
                		"                <tr style='background-color: hsl(0,0%,96%);height: 30px;'>" + 
                		"                        <td colspan='3'>Product Name</td>" + 
                		"                        <td>Supplier</td>" + 
                		"                        <td>Quantity</td>" + 
                		"                        <td>Price</td>" + 
                		"                </tr>" + 
                		"                <tr>" + 
                		"                        <td colspan='3'>"+orders.getProduct().getpName()+"</td>" +  
                		"                        <td>"+orders.getProduct().getSupplier().getsName()+"</td>" + 
                		"                        <td>"+orders.getProduct().getpQuantity()+"</td>" + 
                		"                        <td>"+orders.getProduct().getpPrice()+"</td>" + 
                		"                </tr>" + 
                		"                <tr>" + 
                		"                        <td colspan='5' style='text-align: right;padding-right: 15px;'>" + 
                		"                                <br>" + 
                		"                                <b>SubTotal </b>" + 
                		"                        </td>" + 
                		"                        <td colspan='1' style='text-align: right;padding-right: 15px;'>"+orders.getProduct().getpPrice()+"</td>" + 
                		"                </tr>" + 
                		"                <tr>" + 
                		"                        <td colspan='5' style='text-align: right;padding-right: 15px;'>" +  
                		"                                <b>Shipping Charges </b>" + 
                		"                        </td>" + 
                		"                        <td colspan='1' style='text-align: right;padding-right: 15px;'>"+((orders.getProduct().getpPrice()*3)/100)+"</td>" + 
                		"                </tr>" + 
                		"                <tr>" + 
                		"                        <td colspan='5' style='text-align: right;padding-right: 15px;'>" + 
                		"                                <b>Grand Total </b>" + 
                		"                        </td>" + 
                		"                        <td colspan='1' style='text-align: right;padding-right: 15px;'>"+((orders.getProduct().getpPrice()*103)/100)+"</td>" + 
                		"                </tr>" + 
                		"        </tbody>" + 
                		"</table>",true);
                
                FileSystemResource file = new FileSystemResource(new File("C:\\Users\\Sita Wissenbach\\dt1\\dtpro\\src\\main\\webapp\\WEB-INF\\Resources\\images"+File.separator+orders.getProduct().getpImg()));
                FileSystemResource logo = new FileSystemResource(new File("C:\\Users\\Sita Wissenbach\\dt1\\dtpro\\src\\main\\webapp\\WEB-INF\\Resources\\scroll\\Logo.jpg"));
                helper.addInline("mylogoid", logo);
                helper.addInline("mypic", file);
                
			}
		};
		mailSender.send(messagePreparator);
		
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return "success";
	}
	
	public String showCart()
	{
		
		return "";
	}	
}