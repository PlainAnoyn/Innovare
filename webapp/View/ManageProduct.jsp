<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="java.util.Date" %>

      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <style>
          .table_tag {
  margin: 20px auto;
  width: 80%;
}

.product-table {
  width: 100%;
  border-collapse: collapse;
  border-radius: 8px;
  overflow: hidden;
}

.product-table th,
.product-table td {
  padding: 12px 15px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

.product-table th {
  background-color: #A1C6F3;
  color: #fff;
}

.product-table tr:nth-child(even) {
  background-color: #f9f9f9;
}
.product-table th:not(:last-child),
.product-table td:not(:last-child) {
    border-right: 5px solid #ddd;
}

.product-table tr:hover {
  background-color: #f2f2f2;
}

.product-table td {
  vertical-align: middle;
}
.bx{
	font-size: 20px;
}

/* Responsive styles */
@media screen and (max-width: 600px) {
  .product-table {
    font-size: 12px;
  }
  .product-table th,
  .product-table td {
    padding: 8px 10px;
  }
}

        </style>
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/View/CSS/navbar.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/View/CSS/AddProduct.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
          href="https://fonts.googleapis.com/css2?family=Mochiy+Pop+One&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
          integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />

      </head>

      <body>
       <header>
					<span class="logo">Innovare</span>
					<div class="right">
						<a href="./"><i class="fas fa-home"></i>Home</a>
						

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
								<i class="fas fa-shopping-cart"></i>Cart
							</div>
							
						</div>
						<div class="icons">
							<div class="order" onclick="cartClicked()">
								<i class="fas fa-clipboard"></i>Order
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
							<h1>Profile </h1>
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
																						<a class="admin-btn" href="${pageContext.request.contextPath}/admin-page">Dashboard</a><br/>
          <a class="admin-btn" href="${pageContext.request.contextPath}/manageusers">Users Record</a><br/>
          <a class="admin-btn" href="${pageContext.request.contextPath}/View/AddProduct.jsp">Add Product</a><br/>
          <a class="admin-btn" href="${pageContext.request.contextPath}/manageproducts">Edit Product</a><br/>
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
								window.location.href = "./View/Login.jsp"
									<%}%>
                
            }

					</script>
					<hr/>
				</header>
        <hr>
        
        <div style="padding:50px;">
          <table class="product-table">
            <tr>
              <th>Product Image</th>
              <th>Product Name</th>
              <th>Total Quantity</th>
              <th>Product Price</th>
              <th>Action</th>
            </tr>
            <c:forEach var="st" items="${productList}">
              <tr>
                <td><img src="Images/${st.productImagePath}" alt="Images/${st.productImagePath}" height="100px"
                    width="100px"></td>
                <td>${st.productName}</td>
                <td>${st.productQuantity}</td>
                <td>${st.productPrice}</td>
                <td>
                  <div style="margin:10px;">
                    <a href="${pageContext.request.contextPath}/editproducts?id=${st.id}"><i class='bx bx-edit'></i></a>
                    <a href="${pageContext.request.contextPath}/deleteproducts?id=${st.id}"><i class='bx bx-trash' ></i></a>
                  </div>
                </td>
              </tr>
            </c:forEach>

          </table>
        </div>
        <script>

        </script>
      </body>

      </html>