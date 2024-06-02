<%@page import="com.onur.finalodev.model.OrderProductListing"%>
<%@page import="com.onur.finalodev.model.Category"%>
<%@page import="java.util.List"%>
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
    body {
        font-family: 'Inter', sans-serif !important;
        background-color: #F5F5F5;
        padding: 50px;
    }

    .profile-container {
        background: #FFFFFF;
        border-radius: 15px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        padding: 30px;
        margin-top: 50px;
    }

    .profile-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 30px;
    }

    .profile-icon {
        font-size: 100px;
        color: #FF1B6B;
        margin-right: 20px;
    }

    .profile-info {
        font-size: 1.2rem;
        color: #000000;
    }

    .profile-info span {
        display: block;
        margin-bottom: 10px;
    }

    .order-history {
        background: #FFFFFF;
        border-radius: 15px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        padding: 30px;
        margin-top: 50px;
    }

    .order-history-header {
        font-size: 24px;
        font-weight: bold;
        color: #FF1B6B;
        margin-bottom: 20px;
    }

    .order-list {
        list-style: none;
        padding: 0;
    }

    .order-item {
        margin-bottom: 20px;
        padding: 20px;
        background-color: #f9f9f9;
        border-radius: 10px;
    }
</style>
</head>
<body>
	<div class="container">
    <div class="row justify-content-between">
        <div class="col-md-6 order-md-2"> <%--büyük ekran boyutlarında , sutunu sag tarafta oluşturur.order-md-2 de küçük ekran boyutunda sağa dogru kaydırır--%>
            <div class="order-history">
                <div class="order-history-header">Geçmiş Siparişler</div>
                <ul class="order-list">
                   
                   <%
		             List<OrderProductListing> orders = (List<OrderProductListing>) request.getAttribute("orderProductListings");
	             	if (orders != null) {
		     	for (OrderProductListing item : orders) {
		%>
		<div><%= item.getProduct().getName() %></div>
		<div><%= item.getOrder().getAddress() %></div>
		<%
			}
		} else {
		%>
			<p>No products available.</p>
		<%
		}
		%>
                </ul>
            </div>
        </div>
        <div class="col-md-6 order-md-1">
            <div class="profile-container">
                <%
                if (user != null) {
                %>
                <div class="profile-header">
                    <i class="fas fa-user profile-icon"></i> <!-- Kişi ikonu -->
                    <div class="profile-info">
                        <span><strong>İsim:</strong> <%= user.getName() %></span>
                        <span><strong>E-mail:</strong> <%= user.getEmail() %></span>
                    </div>
                </div>
                <%-- Additional user information can be added here as needed --%>
                <%
                } else {
                %>
                <p>Kullanıcı bilgileri bulunamadı.</p>
                <%
                }
                %>
            </div>
        </div>
    </div>
</div>
</body>
</html>