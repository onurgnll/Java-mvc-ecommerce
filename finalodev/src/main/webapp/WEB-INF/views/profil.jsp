<%@page import="com.onur.finalodev.model.OrderProductListing"%>
<%@page import="com.onur.finalodev.model.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.onur.finalodev.model.User"%>
<%@include file="navbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
    }
     .profile-container, .order-history {
        background: #FFFFFF;
        border-radius: 15px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        padding: 30px;
        margin-top: 7
        0px;
        min-height: 300px; 
    }

    .profile-container {
        background: #FFFFFF;
        border-radius: 15px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        padding: 30px;
        margin-top: 50px;
        
    }
    .profile-container {
        position: relative; /* Relative position for the container */
    }
    

     .profile-header {
        display: flex;
        align-items: center;
        justify-content: center; /* Yatayda ortalama */
        height: 100%;
        text-align: left; 
        margin-bottom: 30px;
    }

     .profile-icon {
        font-size: 100px;
        color: #FF1B6B;
        margin-right: 80px;
        margin-top: 50px;
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
        max-height: 400px;
        overflow-y: auto; /* İçerik taşarsa scroll bar ekle */
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
   .logout-link {
        position: absolute; /* Position absolute for the logout link */
        bottom: 10px; /* Align at the bottom */
        right: 10px; /* Align at the right */
        color: #FF1B6B;
        text-decoration: none;
        display: flex;
        align-items: center;
    }

    .logout-link i {
        margin-right: 5px; /* İkon ve metin arasına boşluk ekle */
    }

    .header {
        background-color: #FFFFFF;
        color: #FF1B6B;
        padding: 10px;
        border-radius: 10px;
        margin-bottom: 20px;
        margin-top: 30px;
        font-weight: bold; 
        text-align: center;
    }
     
</style>
</head>
<body>
    <div class="container">
        <div class="header">KULLANICI BİLGİLERİM</div> 
        <div class="row justify-content-between">
            <div class="col-md-6 order-md-2">
                <div class="order-history">
                    <div class="order-history-header">Geçmiş Siparişler</div>
                    <ul class="order-list">
                        <% 
                            List<OrderProductListing> orders = (List<OrderProductListing>) request.getAttribute("orderProductListings");
                            if (orders != null) {
                                for (OrderProductListing item : orders) {
                        %>
                        <li class="order-item">
                            <div><%= item.getProduct().getName() %></div>
                            <div><%= item.getOrder().getAddress() %></div>
                        </li>
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
                    <div class="profile-header">
                        <i class="fas fa-user profile-icon"></i> <!-- Kişi ikonu -->
                        <div class="profile-info">
                            <span><strong>İsim:</strong> <%= user.getName() %></span>
                            <span><strong>E-mail:</strong> <%= user.getEmail() %></span>
                        </div>
                    </div>
                     <div class="logout-link">
                        <i class="fas fa-sign-out-alt"></i> 
                        <a href="/finalodev/logout">Çıkış Yap</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>