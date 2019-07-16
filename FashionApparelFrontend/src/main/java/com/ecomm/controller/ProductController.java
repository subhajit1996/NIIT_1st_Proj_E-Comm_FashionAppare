package com.ecomm.controller;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ecomm.dao.CategoryDAO;
import com.ecomm.dao.ProductDAO;
import com.ecomm.model.Category;
import com.ecomm.model.Product;

@Controller
public class ProductController
{
	@Autowired
	ProductDAO productDAO;
	@Autowired
	CategoryDAO categoryDAO;
	
	@RequestMapping(value="/product")
	public String ShowProductPage(Model m)
	{
		Product product=new Product();
		m.addAttribute(product);
		
		List<Product> productList=productDAO.listProducts();
		m.addAttribute("productList",productList);
		
		List<Category> listCategory=categoryDAO.listCategories();
		m.addAttribute("categoryList",this.categoryDetailGeneration(listCategory));
		
		return "Product";
	}
	@RequestMapping(value="/InsertProduct",method=RequestMethod.POST)
	public String insertProduct(@ModelAttribute("product")Product product,@RequestParam("pimage") MultipartFile prodImage,Model m, BindingResult result)
	{
		productDAO.addProduct(product);
		
		Product product1=new Product();
		m.addAttribute(product1);
		

		List<Product> productList=productDAO.listProducts();
		m.addAttribute("productList",productList);
		
		//Adding the Image
		
		String path="D:\\Test1stProject\\FashionApparelFrontend\\src\\main\\webapp\\resources\\images\\";
		path=path+String.valueOf(product.getProductId())+".jpg";
		File imageFile=new File(path);
		if(!prodImage.isEmpty())
		{
			try
			{
				byte buffer[]=prodImage.getBytes();
				FileOutputStream fos=new FileOutputStream(imageFile);
				BufferedOutputStream bos=new BufferedOutputStream(fos);
				bos.write(buffer);
				bos.close();
			}
			catch(Exception e)
			{
				System.out.println("Error Occured:"+e);
			}
		}
		else
		{
			System.out.println("File is Empty");
		}
		
		
		List<Category> listCategory=categoryDAO.listCategories();
		m.addAttribute("categoryList",this.categoryDetailGeneration(listCategory));
		
		
		return "Product";
	}
	
	@RequestMapping(value="/productDisplay")
	public String showProducts(Model m)
	{
		List<Product> productList=productDAO.listProducts();
		m.addAttribute("productList",productList);
		return "ProductDisplay";
	}
	
	
	@RequestMapping(value="/totalProductDisplay/{productId}")
	public String totalProductDisplay(@PathVariable(value="productId")int productId, Model m)
	{
		Product product=productDAO.getProduct(productId);
		m.addAttribute(product);
	
		return "TotalProductDisplay";
	}
	
	
	@RequestMapping(value="/editProduct/{productId}")
	public String editProduct(@PathVariable(value="productId")int productId, Model m)
	{
		Product tempProduct=productDAO.getProduct(productId);
		m.addAttribute(tempProduct);
		
		List<Category> listCategory=categoryDAO.listCategories();
		m.addAttribute("categoryList",this.categoryDetailGeneration(listCategory));
		
		
		return "UpdateProduct";
	}
	
	@RequestMapping(value="/UpdateProduct",method=RequestMethod.POST)
	public String updateProduct(@ModelAttribute("product")Product product,Model m, BindingResult result)
	{
		System.out.println("Product Name:"+product.getProductName());
		System.out.println("Product Desc:"+product.getProductDesc());
		
		productDAO.updateProduct(product);
		
		Product product1=new Product();
		m.addAttribute(product1);
		

		List<Product> productList=productDAO.listProducts();
		m.addAttribute("productList",productList);
		
		return "Product";
	}
	
	@RequestMapping(value="/deleteProduct/{productId}")
	public String deleteProduct(@PathVariable(value="productId")int productId, Model m)
	{
		Product tempProduct=productDAO.getProduct(productId);
		productDAO.deleteProduct(tempProduct);
		
		Product product1=new Product();
		m.addAttribute(product1);
		

		List<Product> productList=productDAO.listProducts();
		m.addAttribute("productList",productList);
		
		List<Category> listCategory=categoryDAO.listCategories();
		m.addAttribute("categoryList",this.categoryDetailGeneration(listCategory));
		
		
		
		return "Product";
	}
	
	public LinkedHashMap<Integer,String> categoryDetailGeneration(List<Category> listCategories)
	{
		LinkedHashMap<Integer,String> categoryList=new LinkedHashMap<Integer,String>();
		
		int count=0;
		
		while(count<listCategories.size())
		{
			Category category=listCategories.get(count);
			categoryList.put(category.getCategoryId(), category.getCategoryName());
			
			count++;
		}
		
		return categoryList;
	}

}
