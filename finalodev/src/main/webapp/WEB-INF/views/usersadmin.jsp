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
.card-img-top {
	height: 200px;
	object-fit: cover;
	object-position: center;
}

.bthnnn {
	background-color: #ff1b6b !important;
}
.iconn{
	font-size: 11rem !important;
}
</style>
<body>
	<h2>Tüm Kullanıcılar</h2>
	<div class="d-flex justify-content-around flex-wrap">
		<%
		List<User> usersAdmin = (List<User>) request.getAttribute("users");
		if (usersAdmin != null) {
			for (User userAdmin : usersAdmin) {
		%>
		<div class="card m-2" style="width: 18rem;">
			<div class="d-flex justify-content-center">
			
			<i class="fas fa-solid fa-user iconn"></i>
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