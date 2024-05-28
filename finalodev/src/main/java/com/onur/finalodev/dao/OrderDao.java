package com.onur.finalodev.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import com.onur.finalodev.model.Order;

@Repository
public class OrderDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Order> getAllOrders() {
        String sqlGetOrders = "SELECT * FROM `order`";
        return jdbcTemplate.query(sqlGetOrders, (rs, rowNum) -> {
            Order order = new Order();
            order.setId(rs.getInt("id"));
            order.setUserId(rs.getInt("userId"));
            order.setTotalAmount(rs.getDouble("totalAmount"));
            order.setOrderDate(rs.getDate("orderDate"));
            order.setShippingAddress(rs.getString("shippingAddress"));
            return order;
        });
    }

    public Order getOrderById(int orderId) {
        String sqlGetOrderById = "SELECT * FROM `order` WHERE id = ?";
        return jdbcTemplate.queryForObject(sqlGetOrderById, new Object[]{orderId}, (rs, rowNum) -> {
            Order order = new Order();
            order.setId(rs.getInt("id"));
            order.setUserId(rs.getInt("userId"));
            order.setTotalAmount(rs.getDouble("totalAmount"));
            order.setOrderDate(rs.getDate("orderDate"));
            order.setShippingAddress(rs.getString("shippingAddress"));
            return order;
        });
    }

    public void addOrder(Order order) {
        String sqlInsertOrder = "INSERT INTO `order` (userId, totalAmount, orderDate, shippingAddress) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sqlInsertOrder, new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps) throws SQLException {
                ps.setInt(1, order.getUserId());
                ps.setDouble(2, order.getTotalAmount());
                ps.setDate(3, new java.sql.Date(order.getOrderDate().getTime()));
                ps.setString(4, order.getShippingAddress());
            }
        });
    }

    public void updateOrder(Order order) {
        String sqlUpdateOrder = "UPDATE `order` SET userId = ?, totalAmount = ?, orderDate = ?, shippingAddress = ? WHERE id = ?";
        jdbcTemplate.update(sqlUpdateOrder, new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps) throws SQLException {
                ps.setInt(1, order.getUserId());
                ps.setDouble(2, order.getTotalAmount());
                ps.setDate(3, new java.sql.Date(order.getOrderDate().getTime()));
                ps.setString(4, order.getShippingAddress());
                ps.setInt(5, order.getId());
            }
        });
    }

    public void deleteOrder(int orderId) {
        String sqlDeleteOrder = "DELETE FROM `order` WHERE id = ?";
        jdbcTemplate.update(sqlDeleteOrder, orderId);
    }
}
