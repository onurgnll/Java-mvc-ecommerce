package com.onur.finalodev.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.onur.finalodev.dao.CategoryDao;
import com.onur.finalodev.dao.ProductDao;
import com.onur.finalodev.model.Category;
import com.onur.finalodev.model.Product;

@Controller
public class HomeController {

    @Autowired
    private CategoryDao categoryDao;
    
    @Autowired
    private ProductDao productDao;
    
	@RequestMapping(value = "/")
	public ModelAndView test(HttpServletResponse response) throws IOException {

		// Kategorileri DAO sınıfından alın
		List<Category> categories = categoryDao.getAllCategories();
		
		// Ürünleri DAO sınıfından alın
		List<Product> products = productDao.getAllProducts();

		ModelAndView modelAndView = new ModelAndView("home");
		modelAndView.addObject("products", products);
		modelAndView.addObject("categories", categories);

		return modelAndView;
	}
	

    @RequestMapping(value = "/category")
    public ModelAndView getCategoryProducts(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String categoryName = request.getParameter("name");
        
        // Belirli bir kategoriye ait ürünleri DAO sınıfından alın
		List<Category> categories = categoryDao.getAllCategories();
        List<Product> products = productDao.getProductsByCategoryName(categoryName);
        
        ModelAndView modelAndView = new ModelAndView("categoryProducts");
        modelAndView.addObject("products", products);
        modelAndView.addObject("categoryName", categoryName);
        modelAndView.addObject("categories", categories);

        return modelAndView;
    }
}
