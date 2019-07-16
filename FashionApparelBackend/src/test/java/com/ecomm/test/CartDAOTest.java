package com.ecomm.test;


import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.ecomm.dao.CartDAO;
import com.ecomm.model.Cart;



public class CartDAOTest {


	static CartDAO cartDAO;
	
	@BeforeClass
	public static void executeFirst() {
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		context.scan("com.ecomm");
		context.refresh();
		
		cartDAO=(CartDAO)context.getBean("cartDAO");
	}
	
	
	@Ignore
	@Test
	public void addCartItemTest()
	{
		Cart cartItem=new Cart();
		cartItem.setProductId(2);
		cartItem.setProductName("Jersey");
		cartItem.setQuantity(25);
		cartItem.setPrice(3000);
		cartItem.setStatus("NP");
		cartItem.setUsername("Subhajit");
		
		assertTrue("Problem in Adding CartItem to Cart:",cartDAO.addToCart(cartItem));
	}
	
	@Ignore
	@Test
	public void updateCartItemTest()
	{
		Cart cartItem=cartDAO.getCartItem(2);
		cartItem.setQuantity(5);
		
		assertTrue("Problem in Updating CartItem:",cartDAO.updateCartItem(cartItem));
		
	
	}
	@Ignore
	@Test
	public void listCartItemsTest()
	{
		List<Cart> listCartItems=cartDAO.listCartItems("Subhajit");
		
		assertTrue("Problem in Retrieving the Cart Items",listCartItems.size()>0);
		
		for(Cart cartItem:listCartItems)
		{
			System.out.print(cartItem.getProductId()+"::");
			System.out.print(cartItem.getProductName()+"::");
			System.out.print(cartItem.getQuantity()+"::");
			System.out.println(cartItem.getUsername()+"::");
		}
		
	}
	

}
