package com.ecomm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController
{
	@RequestMapping("/login")
	public String showLoginPage()
	{
		return "Login";
	}
	
	@RequestMapping("/register")
	public String showRegisterPage()
	{
		return "Register";
	}
	
	@RequestMapping("/aboutUs")
	public String showAboutUsPage()
	{
		return "AboutUs";
	}
	
	@RequestMapping("/contactUs")
	public String contactUs()
	{
		return "ContactUs";
	}
	

}
