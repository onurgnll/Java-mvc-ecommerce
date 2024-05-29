
<%@include file="navbar.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
</head>
<style>
.boxadmin {
	height: 200px;
	width: 200px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.4);
    border-radius: 20px;
    display:flex;
	text-decoration: none;
	color: black;
	
}
body{

	font-family: Arial, sans-serif !important;
	background-color: #f0f0f0 !important;
}

</style>
<body>
	<div class="d-flex justify-content-around flex-wrap">

			<a class="m-3 boxadmin text-center fw-bold fs-3 d-flex align-items-center" href="/finalodev/admin/users">Kayıtlı kullanıcılar</a>
			<a class="m-3 boxadmin text-center fw-bold fs-3 d-flex align-items-center" href="/finalodev/admin/orders">Kayıtlı Siparişler</a>
			<a class="m-3 boxadmin text-center fw-bold fs-3 d-flex align-items-center" href="/finalodev/admin/products">Kayıtlı Ürünler</a>
			<a class="m-3 boxadmin text-center fw-bold fs-3 d-flex align-items-center" href="/finalodev/admin/products">Ürün Oluştur</a>
			<a class="m-3 boxadmin text-center fw-bold fs-3 d-flex align-items-center" href="/finalodev/admin/categories">Kayıtlı Kategoriler</a>
			<a class="m-3 boxadmin text-center fw-bold fs-3 d-flex align-items-center" href="/finalodev/admin/products">Kategori Oluştur</a>
		

	</div>
</body>
</html>