<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title><style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }
        .container h2 {
            margin-bottom: 20px;
        }
        .container label {
            display: block;
            margin-bottom: 5px;
            text-align: left;
        }
        .container input[type="email"],
        .container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        h1{
        	color: #FF1B6B;
        }
        .container input[type="submit"]:hover {
            background-color: #45a049;
        }
        .container p {
            margin-top: 15px;
        }
        .container a {
            color: #4CAF50;
            text-decoration: none;
        }
        .container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>MEGASTORE</h1>
    <div class="container">
    <h2>Login</h2>
    <form action="login" method="post">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>
        <input type="submit" value="Login">
    </form>
		<%
		String message = (String) request.getAttribute("message"); // List<String> türüne dönüştürüldü
		if(message != null) { // Null check eklenerek hata önlemi yapıldı
		    
		%>
		<span><%=message %></span>
		<%
		   
		}
		%>
    <p><a href="register.jsp">Don't have an account? Register here.</a></p></div>
</body>
</html>
