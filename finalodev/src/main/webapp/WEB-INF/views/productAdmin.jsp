
<%@include file="navbar.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


    <form action="/finalodev/admin/products" method="post">
        <input type="text" id="name" name="name" required><br>
        <input type="text" id="imageUrl" name="imageUrl" required><br>
        <input type="text" id="description" name="description" required><br>
        <input type="text" id="price" name="price" required><br>
        <input type="text" id="categoryId" name="categoryId" required><br>
        <input type="submit" value="Oluştur">
    </form>

</body>
</html>