package com.onur.finalodev.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.onur.finalodev.dao.CategoryDao;
import com.onur.finalodev.dao.OrderDao;
import com.onur.finalodev.dao.OrderProductDao;
import com.onur.finalodev.dao.ProductDao;
import com.onur.finalodev.dao.UserDao;
import com.onur.finalodev.model.Category;
import com.onur.finalodev.model.Order;
import com.onur.finalodev.model.OrderProduct;
import com.onur.finalodev.model.OrderProductListing;
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
    
    @Autowired
    private OrderDao orderDao;
    
    @Autowired
    private OrderProductDao orderProductDao;
    
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

	@RequestMapping(value = "/admin/editUser/{userId}", method = RequestMethod.POST)
	public ModelAndView editUser(@PathVariable("userId") int userId, HttpServletRequest request, HttpServletResponse response) throws IOException {
	    HttpSession httpSession = request.getSession();
	    User sessionUser = (User) httpSession.getAttribute("user");
	    
	    if (sessionUser != null && sessionUser.getRole().equals(accessRoleString)) {
	        User user = userDao.getUserById(userId);
	        
	        if (user != null) {
	            String newName = request.getParameter("name");
	            String newEmail = request.getParameter("email");
	            System.out.println(newName);
	            user.setName(newName);
	            user.setEmail(newEmail);

	            userDao.updateUser(user);

	            response.sendRedirect("/finalodev/admin/users");
	        } else {
	            response.sendRedirect("/finalodev/");
	        }
	    } else {
	        response.sendRedirect("/finalodev/");
	    }
	    return null;
	}
	@RequestMapping(value = "/admin/deleteUser/{userId}", method = RequestMethod.GET)
    public ModelAndView deleteUser(@PathVariable("userId") int userId, HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println(userId);
        HttpSession httpSession = request.getSession();
        User user = (User) httpSession.getAttribute("user");

        if (user != null) {
            if (user.getRole().equals(accessRoleString)) {

                // Assuming you have a method in your DAO to delete the user by ID
                userDao.deleteUser(userId);

                List<User> users = userDao.getAllUsers();
                ModelAndView modelAndView = new ModelAndView("usersadmin");
                modelAndView.addObject("users", users);

                return modelAndView;

            } else {
                response.sendRedirect("/finalodev/");
            }

        } else {
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
				List<Category> categories = categoryDao.getAllCategories();
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
		        product.setCategoryId(Integer.parseInt(categoryId));
		        product.setDescription(description);
		        product.setName(name);
		        product.setPrice(Double.parseDouble(price));
		        
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
    public ModelAndView prods(HttpServletRequest request, HttpServletResponse response) throws IOException {


		HttpSession httpSession = request.getSession();
		
		User user = (User) httpSession.getAttribute("user");
		if(user != null) {
			if(user.getRole().equals(accessRoleString)) {
				
				ModelAndView modelAndView = new ModelAndView("adminlistproducts");
				List<Category> categories = categoryDao.getAllCategories();
				modelAndView.addObject("categories", categories);
				List<Product> products = productDao.getAllProducts();
				modelAndView.addObject("products", products);


				return modelAndView;
				
			}else {
				response.sendRedirect("/finalodev/");
			}
			
		}else {
			response.sendRedirect("/finalodev/");
			
		}
		return new ModelAndView("home");
		
	}
    
    @GetMapping(value = "/admin/createproduct")
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws IOException {


		HttpSession httpSession = request.getSession();
		
		User user = (User) httpSession.getAttribute("user");
		if(user != null) {
			if(user.getRole().equals(accessRoleString)) {
				
				List<User> users = userDao.getAllUsers();
				ModelAndView modelAndView = new ModelAndView("productAdmin");
				List<Category> categories = categoryDao.getAllCategories();
				modelAndView.addObject("categories", categories);
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
    

    @PostMapping(value = "/admin/newCategories")
    public ModelAndView createcategory(HttpServletRequest request, HttpServletResponse response) throws IOException {


		HttpSession httpSession = request.getSession();
		
		User user = (User) httpSession.getAttribute("user");
		if(user != null) {
			if(user.getRole().equals(accessRoleString)) {

		        String categoryName = request.getParameter("categoryName");

		        Category category = new Category();
		        category.setName(categoryName);
		        categoryDao.addCategory(category);

				response.sendRedirect("/finalodev/admin");
				
			}else {
				response.sendRedirect("/finalodev/");
			}
			
		}else {
			response.sendRedirect("/finalodev/");
			
		}
		return new ModelAndView("home");
		
	}
    @GetMapping(value = "/admin/newCategories")
    public ModelAndView category(HttpServletRequest request, HttpServletResponse response) throws IOException {


		HttpSession httpSession = request.getSession();
		
		User user = (User) httpSession.getAttribute("user");
		if(user != null) {
			if(user.getRole().equals(accessRoleString)) {
				
				List<User> users = userDao.getAllUsers();
				ModelAndView modelAndView = new ModelAndView("newCategory");
				List<Category> categories = categoryDao.getAllCategories();
				modelAndView.addObject("categories", categories);
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
    @GetMapping(value = "/admin/orders")
    public ModelAndView adminorders(HttpServletRequest request, HttpServletResponse response) throws IOException {


		HttpSession httpSession = request.getSession();
		
		User user = (User) httpSession.getAttribute("user");
		if(user != null) {
			if(user.getRole().equals(accessRoleString)) {

				List<OrderProductListing> orderProductListings = new ArrayList<OrderProductListing>();
				
				List<OrderProduct> orderProducts = orderProductDao.getAllOrderProducts();
				
			
				for (OrderProduct orderProduct : orderProducts) {
					
					Product product =  productDao.getProductById(orderProduct.getProductId());
					Order order = orderDao.getOrderById(orderProduct.getOrderId());
					
					orderProductListings.add(new OrderProductListing(orderProduct.getQuantity() ,product , order));
					
				}

				List<User> users = userDao.getAllUsers();
				ModelAndView modelAndView = new ModelAndView("adminOrders");
				modelAndView.addObject("orderProductListings",orderProductListings);
				List<Category> categories = categoryDao.getAllCategories();
				modelAndView.addObject("categories", categories);
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
    
    @GetMapping(value = "/admin/createCategory")
    public ModelAndView admincategorys(HttpServletRequest request, HttpServletResponse response) throws IOException {


		HttpSession httpSession = request.getSession();
		
		User user = (User) httpSession.getAttribute("user");
		if(user != null) {
			if(user.getRole().equals(accessRoleString)) {
				
				List<User> users = userDao.getAllUsers();
				ModelAndView modelAndView = new ModelAndView("adminCreateCategory");
				List<Category> categories = categoryDao.getAllCategories();
				modelAndView.addObject("categories", categories);
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