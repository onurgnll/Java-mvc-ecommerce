package com.onur.finalodev.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import com.onur.finalodev.model.User;

@Repository
public class UserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    @Autowired
    private CartDao cartDao;

    // Tüm kullanıcıları veritabanından alır ve döner
    public List<User> getAllUsers() {
        String sqlGetUsers = "SELECT * FROM user";
        
        return jdbcTemplate.query(sqlGetUsers, (rs, rowNum) -> {
            User user = new User();
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setCartId(rs.getInt("cartId"));
            user.setRole(rs.getString("role"));
            return user;
        });
    }

    // Belirli bir kullanıcıyı id ile alır ve döner
    public User getUserById(int userId) {
        String sqlGetUserById = "SELECT * FROM user WHERE id = ?";
        
        return jdbcTemplate.queryForObject(sqlGetUserById, new Object[]{userId}, (rs, rowNum) -> {
            User user = new User();
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setCartId(rs.getInt("cartId"));
            return user;
        });
    }

    // Kullanıcıyı veritabanına ekler
    public void registerUser(User user) {
        String sqlInsertUser = "INSERT INTO user (name, email, password, cartId) VALUES (?, ?, ?, ?)";
        
        
        try {

            jdbcTemplate.update(sqlInsertUser, new PreparedStatementSetter() {
                @Override
                public void setValues(PreparedStatement ps) throws SQLException {
                    ps.setString(1, user.getName());
                    ps.setString(2, user.getEmail());
                    ps.setString(3, user.getPassword());
                    ps.setInt(4, user.getCartId());
                }
            });
		} catch (Exception e) {
			throw new RuntimeException();
			// TODO: handle exception
		}
        
    }

    // Kullanıcıyı email ve şifre ile alır ve döner
    public User loginUser(String email, String password) {
        String sqlGetUserByEmailAndPassword = "SELECT * FROM user WHERE email = ? AND password = ?";
        
        return jdbcTemplate.queryForObject(sqlGetUserByEmailAndPassword, new Object[]{email, password}, (rs, rowNum) -> {
            User user = new User();
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setRole(rs.getString("role"));
            user.setCartId(rs.getInt("cartId"));
            return user;
        });
    }
}
