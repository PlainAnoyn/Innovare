<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
				<meta http-equiv="X-UA-Compatible" content="IE=edge">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<title>Document</title>
				<link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
				
				<link rel="stylesheet" href="${pageContext.request.contextPath}/View/CSS/contact.css">
				<link rel="preconnect" href="https://fonts.googleapis.com">
				<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
				<link
					href="https://fonts.googleapis.com/css2?family=Mochiy+Pop+One&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
					rel="stylesheet">
</head>
<body>
<div class="add-contact-form">
            <form action="../contact" method="post" enctype="multipart/form-data">
                <div class="contact-form">
                <h1 style = "color: var(--mainColor);">Contact Us</h1>
                    <div class="left2">
                        <span>
                            <label for="name"> Name:</label><br>
                            <input type="text" placeholder="Enter your name" id="name" name="name">
                        </span>

                        <span>
                            <label for="email">Email:</label><br>
                            <input type="text" placeholder="Enter your email" id="email" name='email'>
                        </span>

                        <span>
                            <label for="phoneNumber">Phone Number:</label><br>
                            <input type="tel" placeholder="Enter your phone number" id="phoneNumber"
                                name='phoneNumber'>
                        </span>
                        <span>
                            <label for="message">Message:</label><br>
                            <input type="text" placeholder="Type message" id="message"
                                name='message'>
                        </span>
                    </div>
                </div>
                <div class="bottom">
                    <button style="font-weight:bold;" type="submit" value="Add Contact">Send Form</button>
                    <a style="margin-left:40px" href="${pageContext.request.contextPath}/admin-page">Cancel</a>
                </div>
            </form>
        </div>
 
</body>
</html>
    