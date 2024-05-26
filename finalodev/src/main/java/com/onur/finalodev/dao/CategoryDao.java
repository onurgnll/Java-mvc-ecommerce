package com.onur.finalodev.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.onur.finalodev.model.Category;

@Repository
public class CategoryDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Tüm kategorileri veritabanından alır ve döner
    public List<Category> getAllCategories() {
        String sqlGetCategories = "SELECT * FROM category";
        
        return jdbcTemplate.query(sqlGetCategories, (rs, rowNum) -> {
            Category category = new Category();
            category.setId(rs.getInt("id"));
            category.setName(rs.getString("name"));
            return category;
        });
    }
}
