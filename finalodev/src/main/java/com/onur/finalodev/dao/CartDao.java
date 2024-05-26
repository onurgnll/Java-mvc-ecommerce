package com.onur.finalodev.dao;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.onur.finalodev.model.Cart;

@Repository
public class CartDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Tüm sepetleri veritabanından alır ve döner
    public List<Cart> getAllCarts() {
        String sqlGetCarts = "SELECT * FROM cart";
        
        return jdbcTemplate.query(sqlGetCarts, (rs, rowNum) -> {
            Cart cart = new Cart();
            cart.setId(rs.getInt("id"));
            return cart;
        });
    }

    // Yeni bir sepet oluşturur ve ID'sini döner
    public int createCart() {
        String sqlInsertCart = "INSERT INTO cart VALUES (NULL)";
        KeyHolder keyHolder = new GeneratedKeyHolder();
        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(sqlInsertCart, Statement.RETURN_GENERATED_KEYS);
            return ps;
        }, keyHolder);
        return keyHolder.getKey().intValue();
    }
}
