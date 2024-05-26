package com.onur.finalodev.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.onur.finalodev.model.Product;

@Repository
public class ProductDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Tüm ürünleri veritabanından alır ve döner
    public List<Product> getAllProducts() {
        String sqlGetProducts = "SELECT * FROM product";
        
        return jdbcTemplate.query(sqlGetProducts, (rs, rowNum) -> {
            Product product = new Product();
            product.setId(rs.getInt("id"));
            product.setName(rs.getString("name"));
            product.setPrice(rs.getDouble("price"));
            return product;
        });
    }
    
    public List<Product> getProductsByCategoryName(String categoryName) {
        String sqlGetProductsByCategory = "SELECT p.* FROM product p JOIN category c ON p.categoryId = c.id WHERE c.name = ?";
        
        return jdbcTemplate.query(sqlGetProductsByCategory, new Object[]{categoryName}, (rs, rowNum) -> {
            Product product = new Product();
            product.setId(rs.getInt("id"));
            product.setName(rs.getString("name"));
            product.setPrice(rs.getDouble("price"));
            return product;
        });
    }
}
