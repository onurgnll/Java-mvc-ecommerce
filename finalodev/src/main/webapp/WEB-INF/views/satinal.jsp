<%@page import="com.onur.finalodev.model.Category"%>
<%@page import="com.onur.finalodev.model.PaymentMethod"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Home</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
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
}
.bthnnn {
	background-color: #ff1b6b !important;
}
</style>
<body>
	<div class="d-flex align-items-center flex-column mt-5">
		<h2>Satın Alım</h2>
		<span><%= request.getAttribute("totalPrice") %>TL</span>
		<form class="d-flex flex-column" method="post" action="satinalpost">
			<textarea name="address" id="address"></textarea>
			<select name="paymentMethod">
				<%
					List<PaymentMethod> paymentMethods = (List<PaymentMethod>) request.getAttribute("paymentMethods");
					for (PaymentMethod paymentMethod : paymentMethods) {
				%>
					<option value="<%= paymentMethod.getId() %>"><%= paymentMethod.getName() %></option>
				<%
					}
				%>
			</select>
			<input type=submit />
		</form>
	</div>
</body>
</html>
