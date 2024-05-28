<%@page import="com.onur.finalodev.model.User"%>
<%@page import="java.util.List"%>
<%@include file="navbar.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div>
    <h2>Products in Category:</h2>
    
    <ul>
        <%
        List<User> users = (List<User>) request.getAttribute("users");
        if(users != null) {
            for (User user : users) {
        %>
        <li><%=user.getName()%></li>
        <%
            }
        }
        %>
    </ul>
        </div>
</body>
</html>