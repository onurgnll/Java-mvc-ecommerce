<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="com.onur.finalodev.model.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>home</title>

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    />
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
      }
      .navbar {
        display: flex;
        flex-direction: column;
      }
      h2 {
        margin-left: 10px;
        color: #ff1b6b;
        font-size: x-large;
        font-weight: 800;
      }
      .container {
        margin-top: 20px; /* Containerlar arasına boşluk ekle */
      }
      .container.container-1 {
        display: flex; /* Container-1 içindeki öğeleri yan yana sıralamak için */
        justify-content: space-between;
        align-items: center; /* Yatayda hizalamak için */
        background-color: white;
      }
      .container.container-2 {
        display: flex; /* Container-1 içindeki öğeleri yan yana sıralamak için */
        justify-content: space-between;
        align-items: center; /* Yatayda hizalamak için */
        background-color: #ff1b6b;
        height: 40px;
        border-radius: 5px;
        padding-inline: 30px;
      }
      .container.container-2 a {
        color: white;
        text-decoration: none;
        font-weight: 700;
        padding: 0 10px; /* Sağ ve sol boşluk */
        border-right: 1px solid black;
      }
      .container-2 a:last-child {
            border-right: none; /* Son linkten sonra çizgi ekleme */
        }
      .title {
        margin-right: 50px; /* Başlık ile diğer öğeler arasına boşluk ekleyelim */
      }

      .search-box {
        position: relative;
        display: inline-block;
      }

      .search-input {
        padding-right: 30px;
        width: 500px;
        height: 30px;
        background-color: #f0f0f0;
        border: none;
        border-radius: 15px;
        margin-right: 50px;
      }

      .search-icon {
        position: absolute;
        right: 5px;
        top: 50%;
        transform: translateY(-50%);
        margin-right: 50px;
      }
      .button {
        margin-left: 10px; /* Butonlar arasına boşluk ekleyelim */
        color: white;
        background-color: #ff1b6b;
        border: none;
        padding: 10px;
        border-radius: 5px;
        width: 150px;
        height: 30px;
        text-decoration: none;
        margin-right: 50px;
        font-weight: 550;
      }
    </style>
  </head>
  <body>
    <nav class="navbar">
      <div class="container container-1">
        <h2 class="title">MEGASTORE</h2>
        <div>
          <div class="search-box">
            <input type="text" class="search-input" />
            <i class="fas fa-search search-icon"></i>
          </div>
          <a href="/finalodev/login" class="button">Giriş Yap/Üye Ol</a>
          <a href="/finalodev/admin" class="button">Yönetici</a>
        </div>
      </div>

      <div class="container container-2">
        <a href="/finalodev/">Home</a>
         <%
        List<Category> categories = (List<Category>) request.getAttribute("categories");
        if (categories != null) {
            for (Category category : categories) {
        %>
            <a href="category?name=<%=category.getName()%>"><%=category.getName()%></a>
        <%
            }
        }
        %>
      </div>
    </nav>
  </body>
</html>