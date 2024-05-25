package com.onur.finalodev.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.onur.finalodev.model.Product;

@Controller
public class HomeController {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    
	@RequestMapping(value = "/")
	public ModelAndView test(HttpServletResponse response) throws IOException {

		String sql = "SELECT * FROM product";

		List<Product> products = jdbcTemplate.query(sql, (rs, rowNum) -> {
			Product product = new Product();
			product.setId(rs.getInt("id"));
			product.setName(rs.getString("name"));
			product.setPrice(rs.getDouble("price"));
			System.out.println(product.getName());
			// Diğer alanları burada ekleyin
			return product;
		});

		ModelAndView modelAndView = new ModelAndView("home");
		modelAndView.addObject("products", products);

		return modelAndView;
	}
}
