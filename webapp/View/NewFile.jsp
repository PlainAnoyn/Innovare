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
				<link rel="stylesheet" href="${pageContext.request.contextPath}/View/CSS/navbar.css">
				<link rel="stylesheet" href="${pageContext.request.contextPath}/View/CSS/home.css">
				<link rel="preconnect" href="https://fonts.googleapis.com">
				<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
				<link
					href="https://fonts.googleapis.com/css2?family=Mochiy+Pop+One&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
					rel="stylesheet">
				<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
					integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
					crossorigin="anonymous" referrerpolicy="no-referrer" />
				<script src="${pageContext.request.contextPath}/View/JS/profile.js"></script>
			</head>
<body>
    <nav>
        <header>
				
					
<span class="logo"><img src="${pageContext.request.contextPath}/Images/productImage/innovare_logo.png" alt="Innovare Logo" class="logo-img"></span>

					<div class="right">
						<a href="../"><i class="fas fa-home"></i>Home</a>
						

						<script>
							const select = document.querySelector(".drop-container")
							const option = document.querySelector(".dropdown-content")

							select.addEventListener("mouseenter", () => {
								option.style.display = "block";
							})
							option.addEventListener("mouseleave", () => {
								option.style.display = "none"
							})
						</script>

						<div class="icons">
							<div class="cart" onclick="cartClicked()">
								<i class="fas fa-shopping-cart"></i> Cart
							</div>
							
						</div>
						<div class="icons">
							<div class="order" onclick="orderClicked()">
								<i class="fas fa-clipboard"></i>Order
							</div>
						</div>
						<div class="icons">
							<div class="About-us" >
							<a href="About.jsp"><i class="fas fa-info-circle"></i>About us</a>
							</div>
						</div>
						
					</div>
					<form action="${pageContext.request.contextPath}/search" class="search-bar">
						<input type="text" name="item-name" class="search-field" placeholder="Search..."
							onclick="searchClicked()">
						<input type="submit" id="search">
						<label for="search"><i class='bx bx-search-alt-2'></i></label>
					</form>
					<script>
						const searchClicked = () => {
							document.querySelector(".search-result").style.top = "70px";
							document.querySelector(".search-result").style.opacity = "1";
						}
					</script>
					<div class="profile" onclick="profileClicked()">
    <i class='bx bx-user'></i> 
</div>

					<div class="profile-section">
						<div class="top">
							<h1>Actions </h1>
							<i class='bx bx-x' onclick="profileClicked()"></i>
						</div>
						<% String email=null; if(session.getAttribute("loggedInId")==null){ %>
							<div class="middle">
								<a href="${pageContext.request.contextPath}/View/AdminLogin.jsp">Login as Admin</a>
								<a href="${pageContext.request.contextPath}/View/Login.jsp">Login as User</a>
								<%} else{ email=session.getAttribute("loggedInId").toString(); %>
									<%if(session.getAttribute("adminEmail") !=null){%>
										<a href="${pageContext.request.contextPath}/admin-page" class="admin-btn">Admin
											Page</a><br />
										<a href="${pageContext.request.contextPath}/index.jsp" class="admin-btn">Return
											to Home</a><br />
										<%}%>

											<%if(session.getAttribute("adminEmail")==null &&
												session.getAttribute("loggedInId") !=null){%>
												<a href="${pageContext.request.contextPath}/editProfile?email=<%=email%>"
													class="edit-profile-btn">Edit Profile</a><br />

												<%}%>

													<a href="${pageContext.request.contextPath}/logout"
														class="logout-profile-btn">Log Out</a>
													<%} %>
							</div>
					</div>

					<div class="cart-section">
						<div class="top">
							<h1>Cart Items</h1>
							<i class='bx bx-x' onclick="profileClicked()"></i>
						</div>
						<div class="middle" id="middle">

						</div>
						<div class="lower">
							<span>
								<p class="index">Total Price: </p>
								<p class="total-price"></p>
							</span>
							<a href="" id="order" onclick="clicked()">Order Now!</a>
						</div>
					</div>
					
					<script>
						const profileClicked = () => {
							const btn = document.querySelector(".profile")
							const mainDiv = document.querySelector(".profile-section")
							const cross = document.querySelector(".profile-section .top i")
							btn.addEventListener("click", () => {
								mainDiv.classList.add("active");
							})
							cross.addEventListener("click", () => {
								mainDiv.classList.remove("active");
							})
						}

						const cartClicked = () => {
            	<%if (session.getAttribute("adminEmail") == null && session.getAttribute("loggedInId") != null) { %>
                const btn = document.querySelector(".cart")
								const mainDiv = document.querySelector(".cart-section")
								const cross = document.querySelector(".cart-section .top i")
								btn.addEventListener("click", () => {
									mainDiv.classList.add("active");
								})
								cross.addEventListener("click", () => {
									mainDiv.classList.remove("active");
								})


								let cartDisplay = document.getElementById("middle");
								let totalPriceDisp = document.querySelector(".lower .total-price");
								// Create an empty string to store the HTML content
								let cartHtml = "";
								let totalPrice = 0;
								// Loop through the cart object and generate HTML for each item
								cartItems.forEach((item) => {
									cartHtml += `
                	<div class="item">
  						<img src=/Innovare/Images/`+ item.image + `?v=${time}/>
  						<span>
  							<h3>`+ item.name + `</h3>
	  						<p>Price: Rs. `+ item.price + `</p>
	  					</span>
  					</div>
                  `;
									totalPrice += parseInt(item.price);
								})


								// Set the innerHTML of the cart display element to the generated HTML content
								cartDisplay.innerHTML = cartHtml;
								totalPriceDisp.innerText = totalPrice;
                <%} else {%>
								window.location.href = "${pageContext.request.contextPath}/View/Login.jsp";
									<%}%>
                
            }

					</script>
					<hr/>
				</header>
				<div class="about-section">
        <div class="image-container">
            <!-- Image on the left side -->
            <img src="${pageContext.request.contextPath}/View/Images/abt2.png" alt="About-picture">
        </div>
        <div class="text-container">
            <!-- Text on the right side -->
            <h1>About Innovare</h1>
            <p>
                At Innovare, we're passionate about providing top-notch laptops that elevate your tech experience. With a focus on quality and innovation, we've curated a selection of products designed to meet the needs of discerning users like you. Our mission is to offer powerful performance and sleek designs that inspire productivity and creativity. As technology enthusiasts ourselves, we understand the importance of staying ahead in today's fast-paced world. That's why we're dedicated to bringing you the latest advancements in computing, backed by our commitment to excellence in every aspect of our business. Join us on this journey and explore the possibilities of tomorrow's technology today!
            </p>
        </div>
		
    </div>
	 <div class="image1-container">
            <!-- Image on the left side -->
            <img src="${pageContext.request.contextPath}/View/Images/abt1.jpeg" alt="About-picture">
        </div>
        <div class="text1-container">
            <!-- Text on the right side -->
            <h1>How we are different than rest</h1>
				<span style="font-weight: bold; color:#606060;">High Quality and Innovation.</span>
				<p> Innovare focuses on making top-notch laptops that are both reliable </p>
				<p> with the latest tech features. Unlike others, we don't compromise on</p><p> quality or innovation.</p>

				<span style="font-weight: bold;  color:#606060;">Carefully Chosen Products.</span> 
				<p>We don't overwhelm you with too many choices. Instead, we pick out the</p>
				<p>best laptops that we know you'll love, ensuring each one offers great</p><p> performance and value.</p>

				<span style="font-weight: bold;  color:#606060;">Tech Enthusiasts at Heart.</span>
				<p> Everyone at Innovare is crazy about technology! That means we're always</p>
				<p>on the lookout for the coolest new gadgets and features to bring to you.</p>
        </div>
		<div style="text-align: center; color:#606060;">
		<hr style= " margin-top: 190px">
		<h2 style =" color: var(--mainColor);">Contact Information
		<hr>
		    <h3 style="color:#606060; font-weight:bold;">Get in Touch</h3>
    <div class="contact-info">
      <p><span style="font-weight:bold;" >Phone:</span> 9800000000</p>
      <p><span style="font-weight:bold;" >Email:</span> innovare@np.com</p>
      <p><span style="font-weight:bold;">Address:</span> Itahari, Nepal</p>
	 <a href= "${pageContext.request.contextPath}/View/Contact.jsp"> <span style="font-weight:bold; text-decoration:underline;  color: var(--mainColor); "><i class="fas fa-message"></i> Contact us</span></a>
    </div> 
	
  </div>
  </div>
  <script src="https://kit.fontawesome.com/your-fontawesome-kit-code.js" crossorigin="anonymous"></script>
    
</body>
</html>
