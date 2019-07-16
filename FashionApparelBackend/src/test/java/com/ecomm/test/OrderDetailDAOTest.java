package com.ecomm.test;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;


import com.ecomm.dao.OrderDAO;
import com.ecomm.model.OrderDetail;

public class OrderDetailDAOTest
{

    static OrderDAO orderDAO;
	
	@BeforeClass
	public static void executeFirst() {
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		context.scan("com.ecomm");
		context.refresh();
		
		orderDAO=(OrderDAO)context.getBean("orderDAO");
	}
	
	@Test
	public void testPayment()
	{
		OrderDetail order=new OrderDetail();
		order.setTotalShoppingAmount(2500);
		order.setPmode("CC");
		order.setUsername("Subhajit");
		order.setOrderDate(new java.util.Date());
		
	
		
		orderDAO.payment(order);
		assertTrue("Problem in Updating Cart",orderDAO.updateCartItemStatus("Subhajit", order.getOrderId()));
		
	}

}
