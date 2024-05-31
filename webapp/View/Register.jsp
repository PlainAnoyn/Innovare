<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>

    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/View/CSS/register.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
</head>

<body>
    <section class="sign-up">
        <div class="profile-section">
            <!-- Profile related elements -->
            <div class="image-field" id="image-field">
                <img src="${pageContext.request.contextPath}/View/Images/profilee.png?v=${time}" class="showImage" width="200px" height="240px">
                <input type="file" id="file" name="image" class="imageChooser" value="profilee.png" onchange="onImageChange()" required />
                <label for="file" id="upload-btn"><i class='bx bx-cloud-upload'></i>Choose Photo</label>
                <a href="${pageContext.request.contextPath}/index.jsp" class="return">Go back Home</a>
            </div>
        </div>
        <form action="/Innovare/registration" method="POST" enctype="multipart/form-data">
            <div class="input-field">
                <!-- Sign-up fields -->
                <h1>Sign Up</h1>
                <span class="name">
                    <label for="name"></label>
                    <p style="color: grey">Name</p>
                    <input type="text" id="name" name="name" placeholder="Enter Full Name" required>
                </span>
                 <p style="color: grey">Email</p>
                <span class="email">
                    <label for="email"></label>
                    <input type="email" id="email" name="email" placeholder="Your Email Address" required>
                </span>
                <% if(request.getAttribute("emailMsg") != null){ %>
                    <p class="message" style="color: red;margin-left: 70px;width: 300px;"><%= request.getAttribute("emailMsg")%></p>
                <%} %>
                 <p style="color: grey">Password</p>
                <span class="password">
                    <label for="password"></label>
                    <input type="password" id="password" name="password" placeholder="Enter Password" required>
                </span>
                 <p style="color: grey">Confirm password</p>
                <span class="confirm-password">
                    <label for="confirm-password"></label>
                    <input type="password" name="confirm-password" id="confirm-password" placeholder="Re-Enter Password" required>
                </span>
                <% if(request.getAttribute("passMsg") != null){ %>
                    <p class="message" style="color: red;margin-left: 70px;width: 300px;"><%= request.getAttribute("passMsg")%></p>
                <%} %>
                <br>
                <input type="submit" value="Sign Up">

                <div class="login-option">
                    <a href="${pageContext.request.contextPath}/View/Login.jsp" class="login-btn">Log In</a>
                </div>
            </div>
        </form>
    </section>
    <script>
            function onImageChange() {
                var imageChooser = document.querySelector(".imageChooser");
                var showImage = document.querySelector(".showImage");
                showImage.src = URL.createObjectURL(imageChooser.files[0]);
            }
        </script>


</body>

</html>
