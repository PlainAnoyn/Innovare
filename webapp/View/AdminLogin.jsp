<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/View/CSS/admin-login.css">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
</head>
</head>
<body> 
    <section class="login-form">
            <form action="../admin-login" method="POST">
                <div class="mainin">
                    <h2 class="first-heading">Log In as Admin</h2>
                    <input type="text" placeholder="Enter Admin Id" class="first-input" name="email">
                    <input type="text" placeholder="Enter Password" class="second-input" name="password">
                    <button class="first-button" type="submit">Login</button>
                    <br><br>
                    <a href="${pageContext.request.contextPath}/index.jsp" class="return">Go back Home</a>
                </div>
            </form>
    </section>
</body>
</html>