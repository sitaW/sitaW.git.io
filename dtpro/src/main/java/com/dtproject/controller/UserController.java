package com.dtproject.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dtproject.model.Product;
import com.dtproject.model.User;
import com.dtproject.service.ProductService;
import com.dtproject.service.UserService;

@Controller
public class UserController 

{
	@Autowired
	UserService userService;
	
	@Autowired
	ProductService productService;
	
	@RequestMapping("/registerUser")
	public ModelAndView registerUser()
	{
		ModelAndView mv=new ModelAndView(); 
		User u= new User();
		mv.addObject("user",u);
		mv.setViewName("register");
		
		return mv;
	}
	@RequestMapping("/user/listProducts")
	public ModelAndView listProducts(ModelAndView m)
	{
		List<Product> product=productService.getAllProducts();
		m.addObject("prodList", product);
		m.setViewName("products");
		return m;
	}
	@RequestMapping(value="/saveUser", method=RequestMethod.POST)
	public String saveUser(@Valid @ModelAttribute("user")User user,BindingResult result)
	{
		if(result.hasErrors()) {
			System.out.println("binding result");
			return "redirect:/registerUser";
		}
		user.setEnabled(true);
		userService.saveUser(user);
		return "redirect:/home";
	}
	@RequestMapping(value="/login")
	public ModelAndView login(@RequestParam(value="error",required=false) String error,
			@RequestParam(value="logout",required=false) String logout)
	{
		System.out.println("login page");
		String message="";
		
		if(error!=null) {
			message="Login username or password is incorrect";
		}
		if(logout!=null) {
			message="You have been successufully logged out";
		}
		ModelAndView mv=new ModelAndView();
		mv.addObject("message",message);
		mv.setViewName("login");
		return mv;
	}
}