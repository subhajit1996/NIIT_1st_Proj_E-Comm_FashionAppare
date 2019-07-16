package com.ecomm.test;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;


import com.ecomm.dao.UserDAO;
import com.ecomm.model.UserDetail;

public class UserDAOTest {


	static UserDAO userDAO;
	
	@BeforeClass
	public static void executeFirst() {
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		context.scan("com.ecomm");
		context.refresh();
		
		userDAO=(UserDAO)context.getBean("userDAO");
	}
	@Ignore
	@Test
	public void registerUserTest()
	{
		UserDetail user=new UserDetail();
		user.setUsername("Subhajit");
		user.setPassword("subha123");
		user.setEmailId("mantu201425@gmail.com");
		user.setAddress("Sonarpur ,South 24 PGS");
		user.setCustomerName("Subhajit Naskar");
		user.setEnabled(true);
		user.setRole("ROLE_ADMIN");
		
		
		assertTrue("Problem in Adding a User:",userDAO.registerUser(user));
		
		
	}
	
	@Ignore
	@Test
	public void updateUserTest()
	{
		UserDetail user=userDAO.getUser("Subhajit");
		
		user.setAddress("HNo:8-25/652,Bamanghata,Sonarpur,700150");
		assertTrue("Problem in Updating the UserDetail:",userDAO.updateUserDetail(user));
	}

		

}
