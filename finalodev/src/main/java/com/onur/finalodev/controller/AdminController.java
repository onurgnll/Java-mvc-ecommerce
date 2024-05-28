package com.onur.finalodev.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.onur.finalodev.dao.CategoryDao;
import com.onur.finalodev.dao.ProductDao;
import com.onur.finalodev.dao.UserDao;
import com.onur.finalodev.model.Category;
import com.onur.finalodev.model.Product;
import com.onur.finalodev.model.User;

@Controller
public class AdminController {

	String accessRoleString = "USER";
	
    @Autowired
    private CategoryDao categoryDao;
    @Autowired
    private UserDao userDao;
    
    @Autowired
    private ProductDao productDao;
    
	@RequestMapping(value = "/admin")
	public ModelAndView admin(HttpServletRequest request,HttpServletResponse response) throws IOException {

		
		HttpSession httpSession = request.getSession();
		
		User user = (User) httpSession.getAttribute("user");
		if(user != null) {
			if(user.getRole().equals(accessRoleString)) {
				List<Category> categories = categoryDao.getAllCategories();
				ModelAndView modelAndView = new ModelAndView("admin");
				modelAndView.addObject("categories", categories);


				return modelAndView;
				
			}else {
				response.sendRedirect("/finalodev/");
			}
			
		}else {
			response.sendRedirect("/finalodev/");
			
		}
		return new ModelAndView("home");
		
	}
	

	
	
	

	
	@RequestMapping(value = "/admin/users")
	public ModelAndView adminusers(HttpServletRequest request,HttpServletResponse response) throws IOException {


		HttpSession httpSession = request.getSession();
		
		User user = (User) httpSession.getAttribute("user");
		if(user != null) {
			if(user.getRole().equals(accessRoleString)) {
				
				List<User> users = userDao.getAllUsers();
				ModelAndView modelAndView = new ModelAndView("usersadmin");
				modelAndView.addObject("users", users);


				return modelAndView;
				
			}else {
				response.sendRedirect("/finalodev/");
			}
			
		}else {
			response.sendRedirect("/finalodev/");
			
		}
		return new ModelAndView("home");
		
	}
	
	
	
	
	
	
	
	
	
	@PostMapping(value = "/admin/products")
	public void adminproducts(HttpServletRequest request,HttpServletResponse response) throws IOException {

		
		HttpSession httpSession = request.getSession();
		
		User user = (User) httpSession.getAttribute("user");
		if(user != null) {
			if(user.getRole().equals(accessRoleString)) {

		        String name = request.getParameter("name");
		        String imageUrl = request.getParameter("imageUrl");
		        String description = request.getParameter("description");
		        String price = request.getParameter("price");
		        String categoryId = request.getParameter("categoryId");
		        
		        
		        Product product = new Product();
		        product.setImageUrl(imageUrl);
		        product.setCategoryId(1);
		        product.setDescription(description);
		        product.setName(name);
		        product.setPrice(15);
		        
		        productDao.addProduct(product);
			       
		        response.sendRedirect("/finalodev/admin");
				
			}else {
				response.sendRedirect("/finalodev/");
			}
			
		}else {
			response.sendRedirect("/finalodev/");
			
		}
		
	}

    @GetMapping(value = "/admin/products")
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws IOException {


		HttpSession httpSession = request.getSession();
		
		User user = (User) httpSession.getAttribute("user");
		if(user != null) {
			if(user.getRole().equals(accessRoleString)) {
				
				List<User> users = userDao.getAllUsers();
				ModelAndView modelAndView = new ModelAndView("productAdmin");
				modelAndView.addObject("users", users);


				return modelAndView;
				
			}else {
				response.sendRedirect("/finalodev/");
			}
			
		}else {
			response.sendRedirect("/finalodev/");
			
		}
		return new ModelAndView("home");
		
	}
	
}
