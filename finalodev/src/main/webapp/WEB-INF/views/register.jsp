<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
</head>
<body>
    <h2>Register</h2>
    <form action="register" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>
        <input type="submit" value="Register">
    </form>
    
		<%
		String message = (String) request.getAttribute("message"); // List<String> türüne dönüştürüldü
		if(message != null) { // Null check eklenerek hata önlemi yapıldı
		    
		%>
		<span><%=message %></span>
		<%
		   
		}
		%>
    <p><a href="/login">Already have an account? Login here.</a></p>
</body>
</html>
