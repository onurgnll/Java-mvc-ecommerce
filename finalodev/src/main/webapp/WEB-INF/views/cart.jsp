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
	<div class="d-flex mt-2">
		<div style="height: 75vh; width: 65%"
			class=" overflow-auto d-flex  flex-wrap">
			<%
			List<CartProductListing> cartProductListings = (List<CartProductListing>) request.getAttribute("cartProductListings");
			if (cartProductListings != null) {
				for (CartProductListing item : cartProductListings) {
			%>
			<div class="my-3 d-flex justify-content-between p-3 ms-3"
				style="width: 50rem; height: 10rem; background-color: #E5EDF2; border-radius: 10px">
				<img
					src="https://images.rawpixel.com/image_png_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvam9iNjgwLTE2Ni1wLWwxZGJ1cTN2LnBuZw.png"
					class="" alt="...">
				<div class="d-flex flex-column">
					<span class="fw-bold"><%=item.getProduct().getName()%></span> <span
						class="fw-bold"><%=item.getProduct().getDescription()%></span> <span
						class="fw-bold" style="color: #FF1B6B"><%=item.getProduct().getPrice()%> TL</span>

				</div>
				<div class="d-flex me-3">
					<div
						class="d-flex justify-content-center align-items-center bg-white mt-5"
						style="width: 140px; height: 30px; border-radius: 10px">
						<a href="" class="text-primary fs-2 text-decoration-none">+</a> <span
							class="mx-4"><%=item.getQuantity()%></span> <a href=""
							class="text-primary fs-2 text-decoration-none">-</a>
					</div>
					<div class="mt-5 ms-3">
						<a href="" class="text-decoration-none"
							style="color: black; font-size: 13px; font-weight: bold"><i
							class="fas fa-solid fa-trash"></i> SİL</a>

					</div>
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
		
		<div style="height: 75vh; width: 30%; background-color: #E5EDF2; border-radius:15px" class="m-3 p-3">
			<div class="d-flex flex-column">
				<%
				if (cartProductListings != null) {
					for (CartProductListing item : cartProductListings) {
				%>
				<div class="d-flex justify-content-between mx-5">
					<span> <%=item.getProduct().getName()%></span>
					<span> <%=item.getProduct().getPrice()%></span>
					<span> <%=item.getQuantity()%></span>
				</div>
				<%
				}
				}
				%>
				<hr>
				<div class="d-flex justify-content-between mx-5">
					<span class="fw-bold"> Toplam Fiyat: </span> <span class="fw-bold">
						<%=request.getAttribute("totalPrice")%> TL
					</span>
				</div>
				<div class="mt-3 me-4 d-flex justify-content-end">
					<a href="/finalodev/satinal"
					class="px-4 py-2"
					style="background-color: #FF1B6B; text-decoration:none; color:white; border-radius:10px">Sepeti Onayla</a>
				</div>

			</div>
		</div>
	</div>
</body>
</html>
