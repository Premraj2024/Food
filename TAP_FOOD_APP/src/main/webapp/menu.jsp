<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List, com.food.model.Menu, com.food.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Menu</title>
   
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
</head>
<body>
    <header>
        <nav>
            <div class="logo animate__animated animate__bounce"><img src="images/logo.png" height="60px" alt="Tap Foods"></div>
           
            <ul>
                <% 
                User user = (User) session.getAttribute("loggedInUser");
                if(user != null) {
                %>
                <li><a>Welcome, <%=user.getUsername()%>!</a></li>
                <li><a href="restaurant">Restaurants</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="orderHistory">Order History</a></li>
                <li><a href="cart" id="cart-button" class="cart">
                    <i class="fas fa-shopping-cart"></i> Cart <span id="cart-count">0</span>
                <li><a href="logout" class="login-btn">Logout</a></li>
                </a></li>
                <%
                } else{
                %>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Contact</a></li>
                <li><a href="login.jsp" class="login-btn">Login</a></li>
                <li><a href="signup.jsp" class="signup-btn">SignUp</a></li>
                <li><a href="cart" id="cart-button" class="cart">
                    <i class="fas fa-shopping-cart"></i> Cart <span id="cart-count">0</span>
                </a></li>  
                <%
                }
                %>
            </ul>
        </nav>
    </header>
     <div class="container">
        <h1 class="container-header">Our Menu</h1>
        <div class="menu-list">
            <%
                @SuppressWarnings("unchecked")
                List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
                System.out.println("Menu List in JSP: " + menuList); // Debug statement
                if (menuList != null && !menuList.isEmpty()) {
                    for (Menu menu : menuList) {
            %>
            <div class="menu-item">
                <img src="images/pizza.avif" alt="Dish-<%= menu.getMenuId() %>">
                <h3><%= menu.getItemName() %></h3>
                <p><%= menu.getDescription() %></p>
                <p>Price: <%= menu.getPrice() %></p>
                <form action="cart">
                    <input type="hidden" name="itemId" value="<%= menu.getMenuId() %>">
                    Quantity: <input type="number" name="quantity" value="1" min="1" class="quantity-input">
                    <input type="submit" value="Add to Cart" class="add-to-cart">
                    <input type="hidden" name="action" value="add">
                </form>
            </div>
            <%
                    }
                } else {
            %>
            <p>No Menu item available.</p>
            <%
                }
            %>
            <!-- Add more menu items as needed -->
        </div>
    </div>
<script>
document.addEventListener('DOMContentLoaded', () => {
    const cartButton = document.getElementById('cart-button');
    const cartCount = document.getElementById('cart-count');
    let cartItems = 0;

    document.querySelectorAll('.add-to-cart').forEach(button => {
        button.addEventListener('click', () => {
            const itemName = button.getAttribute('data-name');
            const itemPrice = button.getAttribute('data-price');

            cartItems++;
            cartCount.textContent = cartItems;

            // Add item to localStorage (optional)
            let cart = JSON.parse(localStorage.getItem('cart')) || [];
            cart.push({ name: itemName, price: itemPrice });
            localStorage.setItem('cart', JSON.stringify(cart));

            alert(`${itemName} added to cart!`);
        });
    });
});

</script>
<style>

body {
margin: 0;
font-family: 'Arial', sans-serif;
background: #333 url(images/b6.jpg) no-repeat center center/cover;
background-size: cover;
background-attachment: fixed;
color: #333;
}

header {
background: rgba(30, 30, 30, 0.9);
text-align: center;
color: white;
box-shadow: 0 2px 10px rgba(0, 0, 0, 0.7);
}

nav {
display: flex;
justify-content: space-between;
align-items: center;
max-width: 87rem;
margin: 0 auto;
padding: 1rem 1rem;
}

nav .logo {
font-size: 1.5rem;
font-weight: bold;
color: #ff6b6b;
transition: transform 0.3s, color 0.3s;
}

nav .logo:hover {
transform: scale(1.1);
color: #ff2e2e;
}

nav ul {
list-style: none;
display: flex;
gap: 1rem;
}

nav ul li a {
color: #ffffff;
text-decoration: none;
font-size: 1rem;
transition: color 0.3s, border-bottom 0.3s, transform 0.3s;
padding-bottom: 0.5rem;
}

nav ul li a:hover {
color: #ff6b6b;
border-bottom: 2px solid #ff6b6b;
transform: translateY(-2px);
}

.cart {
font-size: 1rem;
color: white;


}

.container {
padding: 20px;
text-align: center;
}

container-header{
color: #f8f8f8;
}

h1{
color: #f8f8f8;
}

.menu-list {
display: flex;
flex-wrap: wrap;
justify-content: space-around;
}

.menu-item {
border: 1px solid #ddd;
margin: 10px;
padding: 10px;
width: 30%;
box-shadow: 0 2px 5px rgba(0,0,0,0.1);
background-color: rgba(255, 255, 255, 0.9);
border-radius: 8px;
transition: transform 0.3s, box-shadow 0.3s;
}

.menu-item:hover {
transform: scale(1.05);
box-shadow: 0 4px 15px rgba(0,0,0,0.3);
}

.menu-item img {
width: 100%;
height: auto;
border-radius: 5px;
}

.menu-item h3 {
margin: 0;
padding: 0;
font-size: 20px;
}

.menu-item p {
margin: 5px 0;
color: #333;
}

.add-to-cart {
background-color: #ff6b6b;
color: white;
border: none;
padding: 10px 20px;
cursor: pointer;
border-radius: 5px;
transition: background-color 0.3s;
}

.add-to-cart:hover {
background-color: #ff2e2e;
}
</style>
</body>
</html>
