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

import com.onur.finalodev.dao.UserDao;
import com.onur.finalodev.dao.CartDao;
import com.onur.finalodev.dao.CategoryDao;
import com.onur.finalodev.model.Category;
import com.onur.finalodev.model.Product;
import com.onur.finalodev.model.User;

@Controller
public class UserController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private CategoryDao categoryDao;
    @Autowired
    private CartDao cartDao;

    @GetMapping(value = "/login")
    public ModelAndView getLogin( HttpServletResponse response) throws IOException {

		// Kategorileri DAO sınıfından alın

		ModelAndView modelAndView = new ModelAndView("login");
		List<Category> categories = categoryDao.getAllCategories();
		modelAndView.addObject("categories", categories);

		return modelAndView;
    }
    @GetMapping(value = "/register")
    public ModelAndView registerr( HttpServletResponse response) throws IOException {

		// Kategorileri DAO sınıfından alın
		

		ModelAndView modelAndView = new ModelAndView("register");
		List<Category> categories = categoryDao.getAllCategories();
		modelAndView.addObject("categories", categories);

		return modelAndView;
    }
    
    
    @PostMapping(value = "/register")
    public ModelAndView register(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Yeni bir sepet oluştur ve ID'sini al
        int cartId = cartDao.createCart();

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setCartId(cartId);
        
        try {
            userDao.registerUser(user);
            ModelAndView modelAndView = new ModelAndView("login");
            modelAndView.addObject("message", "Registration successful! Please log in.");
            
            return modelAndView;
			
		} catch (Exception e) {
			System.out.println("error");
            ModelAndView modelAndView = new ModelAndView("register");
            modelAndView.addObject("message", "Registration successful! Please log in.");
            
            return modelAndView;
			// TODO: handle exception
		}

    }

    @PostMapping(value = "/login")
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {

            User user = userDao.loginUser(email, password);
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);

                ModelAndView modelAndView = new ModelAndView("home");
                response.sendRedirect("/finalodev/");
                return modelAndView;
            }
		} catch (Exception e) {
			System.out.println(e);
            ModelAndView modelAndView = new ModelAndView("login");
            modelAndView.addObject("message", "Invalid email or password.");
            return modelAndView;
		}
        ModelAndView modelAndView = new ModelAndView("login");
        return modelAndView;
    }

    @RequestMapping(value = "/logout")
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        ModelAndView modelAndView = new ModelAndView("login");
        modelAndView.addObject("message", "You have been logged out.");
        
        return modelAndView;
    }
}
