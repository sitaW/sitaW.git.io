package com.dtproject.dao.daoImpl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dtproject.dao.CartDao;
import com.dtproject.model.BillingAddress;
import com.dtproject.model.Cart;
import com.dtproject.model.CartItem;
import com.dtproject.model.Orders;
import com.dtproject.model.Product;
import com.dtproject.model.ShippingAddress;

@Repository
public class CartDaoImpl implements CartDao 
{
	
	@Autowired
	SessionFactory sf;

	@Override
	public Cart findCartByCartId(int cartId) 
	{
		Session session=sf.openSession();
		Cart cart=(Cart) session.get(Cart.class, cartId);
		return cart;
	}

	@Override
	public void saveOrder(Orders orders, int id) 
	{
		System.out.println(orders.getCartItem().getQuantity());
		Session session=sf.openSession();
		CartItem cartItem=orders.getCartItem();
			
		Cart cart=(Cart) session.get(Cart.class, id);
		if(cart!=null) {
			System.out.println("not null");
			cart.setGrandTotal(cart.getGrandTotal()+cartItem.getProductprice());
			cart.setTotalItems(cart.getTotalItems()+1);
		}
		
		Product product=(Product) session.get(Product.class, cartItem.getProductId());
		product.setpQuantity(product.getpQuantity()-cartItem.getQuantity());
		
		session.beginTransaction();		
		ShippingAddress sAdd=orders.getsAddress();
		BillingAddress bAdd=orders.getbAddress();
		session.saveOrUpdate(sAdd);
		session.saveOrUpdate(bAdd);
		
		cartItem.setBillingAddress(bAdd.getBillingId());
		cartItem.setShippingAddress(sAdd.getShippingId());
		orders.setCartItem(cartItem);
		orders.setbAddress(bAdd);
		orders.setsAddress(sAdd);
		
		session.saveOrUpdate(orders);
		session.update(product);
		session.update(cart);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public boolean deleteOrder(int cId) {
		Session session=sf.openSession();
		
		CartItem cartItem=(CartItem) session.get(CartItem.class,cId);
		Cart cart = (Cart) session.get(Cart.class,cartItem.getCartId());
		cart.setGrandTotal(cart.getGrandTotal()-cartItem.getProductprice());
		cart.setTotalItems(cart.getTotalItems()-1);
		Query query=session.createQuery("from Orders where CARTITEM_CARTITEM_ID=:cid");
		query.setParameter("cid", cId);
		Orders order=(Orders) query.list().get(0);
		try {
			session.beginTransaction();
			session.delete(order);
			session.update(cart);
			session.getTransaction().commit();
			return true;
			
		}catch(Exception e){
			session.getTransaction().rollback();
			e.printStackTrace();
			return false;
		}
	}

}
