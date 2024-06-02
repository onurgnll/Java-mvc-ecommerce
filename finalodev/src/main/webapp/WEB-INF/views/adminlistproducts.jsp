
<%@page import="com.onur.finalodev.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

    body {
        font-family: Arial, sans-serif !important;
        background-color: #f0f0f0 !important;
    }.card-img-top {
	height: 200px;
	object-fit: contain;
	object-position: center;
	padding:10px;
	border-radius:20px;
}

.bthnnn {
	background-color: #ff1b6b !important;
	border: none;
	border-radius: 10px;
	 /* Butonu başlangıçta gizleyin */
}

/* Hover efekti için yeni CSS */
.price-container {
	position: relative;
	cursor: pointer;
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
			<img src="<%= item.getImageUrl() %>"
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