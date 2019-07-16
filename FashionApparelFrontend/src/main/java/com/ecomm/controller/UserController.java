package com.ecomm.controller;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ecomm.dao.ProductDAO;
import com.ecomm.dao.UserDAO;
import com.ecomm.model.Product;
import com.ecomm.model.UserDetail;

@Controller
public class UserController
{
	@Autowired
	UserDAO userDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	@RequestMapping(value="/registerUser",method=RequestMethod.POST)
	public String registerUser(@RequestParam("username")String username,@RequestParam("customerName")String customerName,@RequestParam("emailId")String emailId,@RequestParam("password")String password,@RequestParam("address")String address)
	
	{
		UserDetail user=new UserDetail();
		
		user.setUsername(username);
		user.setCustomerName(customerName);
		user.setEmailId(emailId);
		user.setPassword(password);
		user.setAddress(address);
		user.setEnabled(true);
		user.setRole("ROLE_USER");
		
		userDAO.registerUser(user);
		
		return "Register";
	}
	
	@RequestMapping(value="/perform_logout")
	public String loggingOut(HttpSession session)
	{
		session.invalidate();
		return "Login";
	}
	@RequestMapping(value="/login_success",method=RequestMethod.POST)
	public String loginCheck(HttpSession session,Model m)
	{

		List<Product> productList=productDAO.listProducts();
		m.addAttribute("productList",productList);
		String page="";
		boolean loggedIn=false;
		SecurityContext sContext=SecurityContextHolder.getContext();
		Authentication authentication=sContext.getAuthentication();
		
		String username=authentication.getName();
		Collection<GrantedAuthority> roles=(Collection<GrantedAuthority>)authentication.getAuthorities();
		
		for(GrantedAuthority role:roles)
		{
			
			session.setAttribute("role",role.getAuthority());
			
			if(role.getAuthority().equals("ROLE_ADMIN"))
			{
				loggedIn=true;
				page="AdminHome";
				session.setAttribute("loggedIn",loggedIn);
				session.setAttribute("username",username);
			}
			else
			{
				loggedIn=true;
				page="UserHome";
				session.setAttribute("loggedIn",loggedIn);
				session.setAttribute("username",username);
			    	
			}
		
	
	}
		return page;
	}
}


