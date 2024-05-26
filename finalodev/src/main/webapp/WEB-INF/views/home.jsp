<%@page import="com.onur.finalodev.model.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.onur.finalodev.model.Product"%>
<!-- Ensure this is the correct package -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>
	<h2>Product List</h2>
	
	<ul>
		<%
		List<Product> products = (List<Product>) request.getAttribute("products"); // List<String> türüne dönüştürüldü
		if(products != null) { // Null check eklenerek hata önlemi yapıldı
		    for (Product item : products) {
		%>
		<li><%=item.getName() %></li>
		<%
		    }
		}
		%>
	</ul>
</body>
</html>
