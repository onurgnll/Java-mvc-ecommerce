<%@page import="java.util.List"%>
<%@page import="com.onur.finalodev.model.Product"%>
<!-- Ensure this is the correct package -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>
	<h2>Product List</h2>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Price</th>
		</tr>
		<%
		List<Product> products = (List<Product>) request.getAttribute("products");
		System.out.println("Products size: " + (products != null ? products.size() : "null"));
		%>
		<%
		List<Product> products2 = (List<Product>) request.getAttribute("products"); // Correct cast
		if (products != null) {
			for (Product product : products) { // Ensure correct import
		%>
		<tr>
			<td><%=product.getId()%></td>
			<td><%=product.getName()%></td>
			<td><%=product.getPrice()%></td>
		</tr>
		<%
		}
		} else {
		%>
		<tr>
			<td colspan="3">No products found.</td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>
