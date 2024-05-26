package com.onur.finalodev.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.onur.finalodev.model.Category;
import com.onur.finalodev.model.Product;

@Controller
public class NavBarController {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    
	@RequestMapping(value = "/home")
	public ModelAndView test(HttpServletResponse response) throws IOException {

		String sql = "SELECT * FROM product";
		String sqlGetCategories = "SELECT * FROM category";

		List<Category> categories = jdbcTemplate.query(sqlGetCategories, (rs, rowNum) -> {
			Category category = new Category();
			category.setId(rs.getInt("id"));
			category.setName(rs.getString("name"));
			return category;
		});
		
		List<Product> products = jdbcTemplate.query(sql, (rs, rowNum) -> {
			Product product = new Product();
			product.setId(rs.getInt("id"));
			product.setName(rs.getString("name"));
			product.setPrice(rs.getDouble("price"));
			return product;
		});

		ModelAndView modelAndView = new ModelAndView("home");
		modelAndView.addObject("products", products);
		modelAndView.addObject("categories", categories);

		return modelAndView;
	}
}
