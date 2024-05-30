<%@page import="com.onur.finalodev.model.User"%>
<%@include file="navbar.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<title>Insert title here</title>
</head>
<style>
	body{
	
	font-family: Arial, sans-serif !important;
	background-color: #f0f0f0 !important;}
</style>
<body>

	<%
	if (user != null) {
	%>
	<span><%= user.getName() %></span>

	<%
	}
	%>

</body>
</html>