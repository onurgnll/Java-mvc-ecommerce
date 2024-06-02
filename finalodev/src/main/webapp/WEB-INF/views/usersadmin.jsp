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

.iconn {
	font-size: 4rem !important;
}
</style>
<body>
	<div class="d-flex justify-content-around flex-wrap m-2 mt-4">
		<%
		List<User> usersAdmin = (List<User>) request.getAttribute("users");
		if (usersAdmin != null) {
			for (User userAdmin : usersAdmin) {
		%>
		<form action="/finalodev/admin/editUser/<%=userAdmin.getId()%>"
			method="post" class="card m-2 " style="width: 16rem;">
			<div class="d-flex justify-content-center">
				<img alt=""
					src="https://cdn.pixabay.com/photo/2016/04/15/18/05/computer-1331579_640.png"
					style="width: 100px; height: 100px" class="mt-3">
			</div>
			<div class="card-body">
				<input name="name" value="<%=userAdmin.getName()%>"
					class="card-title text-center"
					style="border: none; font-weight: bold"> <input
					name="email" value="<%=userAdmin.getEmail()%>"
					class="card-title text-center" style="border: none">
				<div class="d-flex justify-content-between align-items-center">
					<span><%=userAdmin.getRole()%></span>
					<div>
						<button type="submit" class="btn btn-primary bthnnn py-1">Düzenle</button>
						<a href="/finalodev/admin/deleteUser/<%=userAdmin.getId()%>"
							class="btn btn-primary bthnnn py-1">Sil</a>
					</div>
				</div>
			</div>
		</form>
		<%
		}
		}
		%>
	</div>
</body>
</html>