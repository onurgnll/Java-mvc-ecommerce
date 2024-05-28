<%@page import="com.onur.finalodev.model.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Products in Category</title>
</head>
<body>
    <h2>Products in Category: <%= request.getAttribute("categoryName") %></h2>
    
    <ul>
        <%
        List<Product> products = (List<Product>) request.getAttribute("products");
        if(products != null) {
            for (Product product : products) {
        %>
        <li><%=product.getName()%> - $<%=product.getPrice()%></li>
        <%
            }
        }
        %>
    </ul>
</body>
</html>
