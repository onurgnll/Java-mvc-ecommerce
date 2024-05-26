<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="com.onur.finalodev.model.Category"%>
<html>
<head>
    <style>
        /* Basit bir stil örneği, CSS kullanarak kendi stilinizi ekleyebilirsiniz */
        .navbar {
            background-color: #333;
            overflow: hidden;
        }
        .navbar a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
    </style>
</head>
<body>
    <div class="navbar">
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
</body>
</html>