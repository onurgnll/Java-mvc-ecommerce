<%@page import="com.onur.finalodev.model.PaymentMethod"%>
<%@page import="java.util.Map"%>
<%@page import="com.onur.finalodev.model.OrderProduct"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.onur.finalodev.model.Order"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.onur.finalodev.model.OrderProductListing"%>
<%@include file="navbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />

<style type="text/css">
body {
	font-family: Arial, sans-serif !important;
	background-color: #f0f0f0 !important;
}

img {
	height: 50px;
	object-fit: cover;
	object-position: center;
	border-radius: 15px;
}
</style>
</head>
<body>
	<div class="d-flex justify-content-around flex-wrap w-100">
		<%
		Map<Order, Object[]> orders = (Map<Order, Object[]>) request.getAttribute("orders");

		if (orders != null) {
			for (Map.Entry<Order, Object[]> entry : orders.entrySet()) {
				Order order = entry.getKey();
				Object[] orderDetails = entry.getValue();
				User orderUser = (User) orderDetails[1];
				List<OrderProductListing> orderProductListings = (List<OrderProductListing>) orderDetails[0];
				PaymentMethod paymentMethod = (PaymentMethod) orderDetails[2];
		%>
		<div
			class="d-flex flex-column align-items-center p-2"
			style=" background-color: white; border-radius: 15px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
			<span class="fw-bold fs-4"><%= entry.getKey().getId() %> Idli sipariş</span>
			
			<span class="fw-bold fs-6 mt-2">Kişi bilgileri</span>
			<span><%= orderUser.getName() %></span>
			<span><%= orderUser.getEmail() %></span>
			
			
			<span class="fw-bold fs-6 mt-3">Sipariş bilgileri</span>
			<span><%= order.getAddress() %></span>
			<span><%= order.getCreatedAt() %></span>
			<span><%= order.getTotalPrice()%></span>
			<span><%= paymentMethod.getName() %></span>
			
			
			<span class="fw-bold fs-6 mt-3">Ürün bilgileri</span>
			
			<%
				for(OrderProductListing orderProductListing: orderProductListings){
					%>
					<span><%= orderProductListing.getQuantity() %>x <%= orderProductListing.getProduct().getName() %></span>
					<%
				}
			%>
			
			<span class="fw-bold fs-6 mt-3">Sipariş durumu</span>
			<%
				if(order.getStatus().equals("BEKLIYOR")){
					%>
					
			<span class="fw-bold fs-6 mt-3">BEKLİYOR</span>
					
					<%
				}
			
				if(order.getStatus().equals("ONAYLANDI")){
					%>
					
			<span class="fw-bold fs-6 mt-3">ONAYLANDI</span>
					
					<%
				}
			
				if(order.getStatus().equals("REDDEDILDI")){
					%>
					
			<span class="fw-bold fs-6 mt-3">REDDEDILDI</span>
					
					<%
				}
			%>
			
			<div <%
				if(!order.getStatus().equals("BEKLIYOR")){%>class="d-none"<%}%>>
				<a href="/finalodev/admin/approveOrder/<%= order.getId() %>" type="button" class="btn btn-success px-4">Onayla</a>
				<a href="/finalodev/admin/denyOrder/<%= order.getId() %>" type="button" class="btn btn-danger px-4">Reddet</a>
			</div>
		</div>

		<%
		}
		}
		%>

	</div>
</body>
</html>