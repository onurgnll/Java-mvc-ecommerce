
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
    }
    .card-img-top {
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


</style>
<body>
<div class="d-flex justify-content-around flex-wrap">
<%
		List<Product> products = (List<Product>) request.getAttribute("products");
		if (products != null) {
			for (Product item : products) {
		%>
		<form action="/finalodev/addToCart/<%=item.getId()%>" method="post" class="card m-4" style="box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);width: 16rem; height:20rem; border:none; border-radius:20px">
			<img src="<%= item.getImageUrl() %>"
				class="card-img-top" alt="...">
			<div class="card-body d-flex-column  ms-4">

				<input name="name" value="<%=item.getName()%>"
					class="card-title text-center"
					style="border: none; font-weight: bold; witdh:10rem">
				<input
					name="email" value="<%=item.getDescription()%>"
					style="border: none">
				<input name="name" value="<%=item.getPrice()%> TL" style="border: none;" class="mb-2">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<button type="submit" class="btn btn-primary bthnnn py-1">Düzenle</button>
						<a href="<%=item.getId()%>"
							class="btn btn-primary bthnnn py-1">Sil</a>
					</div>
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