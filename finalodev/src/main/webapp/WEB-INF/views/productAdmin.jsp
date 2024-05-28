
<%@include file="navbar.jsp" %>
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