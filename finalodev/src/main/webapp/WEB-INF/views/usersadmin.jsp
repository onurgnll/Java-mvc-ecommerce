<%@page import="com.onur.finalodev.model.User"%>
<%@page import="java.util.List"%>
<%@include file="navbar.jsp"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
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
	border: none;
}
.iconn{
	font-size: 4rem !important;
}
</style>
<body>
	<div class="d-flex justify-content-around flex-wrap m-2 mt-4" >
		<%
		List<User> usersAdmin = (List<User>) request.getAttribute("users");
		if (usersAdmin != null) {
			for (User userAdmin : usersAdmin) {
		%>
		<div class="card m-2 " style="width: 16rem; border-radius: 20px; border:none ;box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);">
			<div class="d-flex justify-content-center">
			<img alt="" src="https://cdn.pixabay.com/photo/2016/04/15/18/05/computer-1331579_640.png" style="width:100px; height:100px" class="mt-3">
			</div>
			<div class="card-body">
				<h5 class="card-title text-center"><%=userAdmin.getName()%></h5>
				<p class="card-text text-center"><%=userAdmin.getEmail() %></p>
				<div class="d-flex justify-content-between align-items-center">
				<div>
					<span><%=userAdmin.getRole() %></span>
				</div>
				<div>
					<button type="submit" class="btn btn-primary bthnnn"
						value="Sepete Ekle">Düzenle</button>
					<button type="submit" class="btn btn-primary bthnnn"
						value="Sepete Ekle">Sil</button>
				</div>
				</div>
			</div>
		</div>
		<%
		}
		}
		%>
	</div>
</body>
</html>