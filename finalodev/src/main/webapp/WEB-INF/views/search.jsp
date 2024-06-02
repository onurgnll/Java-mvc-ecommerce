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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<style>

body{

	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
}
.card-img-top{
	height: 200px;
	
    object-fit: contain;
    object-position: center;
}
.bthnnn{
        background-color: #ff1b6b !important;
        border: none;
}
</style>
<body>
    <h2>Products in Category: <%= request.getAttribute("categoryName") %></h2>
    <div class="d-flex justify-content-around flex-wrap">
		<%
		List<Product> products = (List<Product>) request.getAttribute("products");
		if (products != null) {
			for (Product item : products) {
		%>
		<form action="/finalodev/addToCart/<%=item.getId()%>" method="post" class="card m-4" style="width: 16rem; border:none; border-radius:20px">
			<img src="<%= item.getImageUrl() %>"
				class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title"><%=item.getName()%></h5>
				<p class="card-text"><%=item.getDescription()%></p>
				<div class="d-flex justify-content-between align-items-center">
					<p class="card-text p-0 m-0"><%=item.getPrice()%> TL</p>
					
        			<button type="submit"  class="btn btn-primary bthnnn" value="Sepete Ekle">Sepete Ekle</button>
				</div>
			</div>
		</form>
		<%
			}
		} else {
		%>
			<p>No products available.</p>
		<%
		}
		%>
	</div>
</body>
</html>
