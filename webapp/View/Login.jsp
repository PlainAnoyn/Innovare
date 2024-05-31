<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/View/CSS/login.css">
    <link rel="stylesheet"
  href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
</head>
</head>
<body>
    <section class="login-form">
            <form action="../login" method="POST">
                <div class="mainin">
                    <h1 class="first-heading">Log In to Innovare</h2>
                     <p class="stt">Email</p>
                    <input type="text" placeholder="Enter Your Address" class="first-input" name="email">
                     <p class="stt">Password</p>
                    <input type="text" placeholder="Enter Password" class="second-input" name="password">
                    <button class="first-button" type="submit">Login</button>
                    <p class="first-para">Don't have an account? <a href="${pageContext.request.contextPath}/View/Register.jsp"><span>Sign Up</span></a></p>
                    <a href="${pageContext.request.contextPath}/index.jsp" class="return">Go back Home</a>
                </div>
            </form>
    </section>
</body>
</html>