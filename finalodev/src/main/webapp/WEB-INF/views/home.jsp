<%@page import="com.onur.finalodev.model.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.onur.finalodev.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
}
.card-img-top {
	height: 200px;
	object-fit: cover;
	object-position: center;
	padding:10px;
	border-radius:20px;
}

.bthnnn {
	background-color: #ff1b6b !important;
	border: none;
	display: none;
	border-radius: 10px;
	 /* Butonu başlangıçta gizleyin */
}

/* Hover efekti için yeni CSS */
.price-container {
	position: relative;
	cursor: pointer;
}

.price-container:hover .price-text {
	display: none;
}

.price-container:hover .bthnnn {
	display: block; /* Hover üzerinde butonu göster */
	color: white;
	background: none;
}
</style>
<body>
	<div class="d-flex justify-content-around flex-wrap">
		<%
		List<Product> products = (List<Product>) request.getAttribute("products");
		if (products != null) {
			for (Product item : products) {
		%>
		<form action="/finalodev/addToCart/<%=item.getId()%>" method="post" class="card m-4" style="box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);width: 15rem; border:none; border-radius:20px">
			<img src="https://images.rawpixel.com/image_png_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvam9iNjgwLTE2Ni1wLWwxZGJ1cTN2LnBuZw.png"
				class="card-img-top" alt="...">
			<div class="card-body d-flex-column align-items-center ms-4">
				<h5 class="card-title fs-3"><%=item.getName()%></h5>
				<div class="d-flex justify-content-between align-items-center price-container">
					<p class="card-text p-0 m-0 price-text fs-6"><%=item.getPrice()%> TL</p>
        			<button type="submit" class="bthnnn py-1 px-3 ">Sepete Ekle</button>
				</div>
			</div>
		</form>
		<%
			}
		} else {
		%>
			<p>Mevcut ürün bulunmamaktadır.</p>
		<%
		}
		%>
	</div>
</body>
</html>
