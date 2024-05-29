
<%@page import="com.onur.finalodev.model.CartProductListing"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
body {
	font-family: Arial, sans-serif !important;
	background-color: #f0f0f0 !important;
}

.card-img-top {
	height: 200px;
	object-fit: cover;
	object-position: center;
}

.bthnnn {
	background-color: #ff1b6b !important;
}
</style>
<body>
	<div class="d-flex">
		<div style="height: 75vh; width: 70%"
			class=" overflow-auto d-flex  flex-wrap">
			<%
			List<CartProductListing> cartProductListings = (List<CartProductListing>) request.getAttribute("cartProductListings");
			if (cartProductListings != null) {
				for (CartProductListing item : cartProductListings) {
			%>
			<div class="my-3 d-flex justify-content-between bg-white p-3"
				style="min-width: 60rem; height: 15rem">
				<img
					src="https://images.rawpixel.com/image_png_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvam9iNjgwLTE2Ni1wLWwxZGJ1cTN2LnBuZw.png"
					class="" alt="...">
				<div class="d-flex flex-column">
					<span class="fw-bold"><%=item.getProduct().getName()%></span> <span><%=item.getProduct().getDescription()%></span>
				</div>
				<div
					class="d-flex flex-column justify-content-center align-items-center">
					<span>+</span> <span><%=item.getQuantity()%></span> <span>-</span>
				</div>
			</div>
			<%
			}
			} else {
			%>
			<p>No products available.</p>
			<%
			}
			%>
		</div>
		<div style="height: 75vh; width: 30%">
		sepet detay
		</div>

	</div>
</body>
</html>