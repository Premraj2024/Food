<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List, com.food.model.User, com.food.model.Restaurant, com.food.DAOImpl.RestuarantDAOImpl" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
</head>
<body>
    <header class="header">
        <nav>
           <a href="index.jsp"><div class="logo animate__animated animate__bounce"><img src="images/logo.png" height="60px" alt="Tap Foods"></div></a>
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
                <%
                } else{
                %>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Contact</a></li>
                <li><a href="login.jsp" class="login-btn">Login</a></li>
                <li><a href="signup.jsp" class="signup-btn">SignUp</a></li>  
                <%
                }
                %>
            </ul>
        </nav>
    </header>
    <div class="sticky-bar">
        <label for="sort">Sort by:</label>
        <select id="sort"  class="form-control d-inline w-auto">
            <option value="relevance">Relevance</option>
            <option value="rating">Rating</option>
            <option value="delivery-time">Delivery Time</option>
            <option value="price">Price</option>
        </select>
        <label for="filter">Filter by:</label>
        <input type="checkbox" id="vegetarian" name="vegetarian" value="vegetarian"> Vegetarian
        <input type="checkbox" id="vegan" name="vegan" value="vegan"> Vegan
        <input type="checkbox" id="gluten-free" name="gluten-free" value="gluten-free"> Gluten Free
    </div>
    <section class="restaurants" style="background-color: rgb(255, 253, 253)">
        <h2>Restaurants Near You</h2>
        
        <div class="restaurant-container">
        	<div class="restaurant-item">
                <img src="images/subway.avif" alt="Restaurant 1">
                <h3>Subway</h3>
                <p>Salads,Snacks,Deserts</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/corner house.avif" alt="Restaurant 2">
                <h3>Corner House Ice Cream</h3>
                <p>Ice Cream, Desearts</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/mojo pizza.avif" alt="Restaurant 3">
                <h3>MOJO PIZZA - 2X Toppings</h3>
                <p>Pizzas, Italian, Fast Food,Deserts</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/mcDonalds.avif" alt="Restaurant 4">
                <h3>McDonald's</h3>
                <p>Burger, Beaverages</p>
                <span>40-45 mins</span>
            </div>
            <a href="menu.jsp">
            <div class="restaurant-item">
                <img src="images/UBQ.avif" alt="Restaurant 5">
                <h3>UBQ by Barbeque Nation</h3>
                <p>North Indian, Barbecue, Biryani</p>
                <span>40-45 mins</span>
            </div>
            </a>
            <a href="menu.html">
            <div class="restaurant-item">
                <img src="images/Pizza Hut.avif" alt="Restaurant 6">
                <h3>Pizza Hut</h3>
                <p>Pizzas</p>
                <span>40-45 mins</span>
            </div>
            </a>
            <a href="menu.html">
            <div class="restaurant-item">
                <img src="images/wow momo.avif" alt="Restaurant 7">
                <h3>Wow! Momo</h3>
                <p>Tibetan, Healthy Food</p>
                <span>40-45 mins</span>
            </div>
            </a>
            <div class="restaurant-item">
                <img src="images/Barbeque nation.avif" alt="Restaurant 8">
                <h3>Barbeque Nation</h3>
                <p>North Indian, Barbecue, Biryani</p>
                <span>40-45 mins</span>
            </div>
            
            <div class="restaurant-item">
                <img src="images/kfc.avif" alt="Restaurant 9">
                <h3>KFC</h3>
                <p>Burgers, Fast Foods</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/burgerking.avif" alt="Restaurant 10">
                <h3>Burger King</h3>
                <p>Burgers, Americans</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/wendy's.avif" alt="Restaurant 11">
                <h3>Wendy's Burger</h3>
                <p>Burgers, American Fast Foods</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/dominos.avif" alt="Restaurant 12">
                <h3>Domino's Pizza</h3>
                <p>Pizzas, Italian, Pastas</p>
                <span>40-45 mins</span>
            </div>
            
   	 
   	 
   	 <div class="restaurant-container">
        <% 
        @SuppressWarnings("unchecked")
        List<Restaurant> restaurantList = (List<Restaurant>) session.getAttribute("restaurantList");
        System.out.println(restaurantList);
        
        if (restaurantList != null) {
            for (Restaurant restaurant : restaurantList) {
        %>
        <a href="menu?restaurantId=<%=restaurant.getrestaurantId()%>">
        <div class="restaurant-item">
            <img src="images/<%= restaurant.getImgPath() %>" alt="<%= restaurant.getRestaurantName() %>">
            <h3><%= restaurant.getRestaurantName() %></h3>
            <p><%= restaurant.getCusineType() %></p>
            <span><%= restaurant.getDeliveryTime() %> mins</span>
        </div>
        </a>
        <% 
            }
        } else {
        %>
        <p>No restaurants available at the moment.</p>
        <% 
        } 
        %>
    </div>
            <!-- Repeat for other restaurants -->
        </div>
    </section>
    <!-- Footer -->
    <footer>
        <div class="footer-content">
            <p>&copy; 2024 Tap Foods. All Rights Reserved.</p>
            <ul>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">Terms of Service</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
        </div>
    </footer>

	<style>
:root {
	--background-color: #ffffff;
	--text-color: #333333;
	--header-background: rgba(30, 30, 30, 0.9);
	--header-text-color: #ffffff;
	--primary-color: #ff6b6b;
	--secondary-color: #ff2e2e;
}

body.dark-mode {
	--background-color: #333333;
}

body {
	margin: 0;
	font-family: 'Arial', sans-serif;
	background: var(--background-color);
	color: var(--text-color);
	transition: background-color 0.5s ease, color 0.5s ease;
}

.header {
	background: var(--header-background);
	text-align: center;
	font-size: 24px;
	color: var(--header-text-color);
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.7);
	transition: transform 0.3s ease, background 0.3s, color 0.3s;
}

nav {
	display: flex;
	justify-content: space-between;
	align-items: center;
	max-width: 87rem;
	margin: 0 auto;
}

nav .logo {
	font-size: 1.5rem;
	font-weight: bold;
	color: var(--primary-color);
	transition: transform 0.3s, color 0.3s;
}

nav .logo:hover {
	transform: scale(1.1);
	color: var(--secondary-color);
}

nav ul {
	list-style: none;
	display: flex;
	gap: 1rem;
}

nav ul li a {
	color: var(--header-text-color);
	text-decoration: none;
	font-size: 1rem;
	transition: color 0.3s, border-bottom 0.3s, transform 0.3s;
	padding-bottom: 0.5rem;
}

nav ul li a:hover {
	color: var(--primary-color);
	border-bottom: 2px solid var(--primary-color);
	transform: translateY(-2px);
}

.theme-toggle {
	background: var(--primary-color);
	color: var(--header-text-color);
	border: none;
	padding: 10px;
	cursor: pointer;
	transition: background-color 0.3s ease, color 0.3s ease;
}

.sticky-bar {
	background-color: var(--primary-color);
	padding: 10px 0;
	text-align: center;
	color: var(--header-text-color);
	transition: background-color 0.3s ease, color 0.3s ease;
}

.sticky-bar select, .sticky-bar input {
	margin: 0 10px;
	padding: 5px;
}

.container {
	padding: 20px;
}

/* Footer */
footer {
	width: 100%;
	margin-top: 2rem;
}

.footer-content {
	background: #000;
	padding: 1rem;
	text-align: center;
	color: var(--header-text-color);
}

.footer-content ul {
	list-style: none;
	padding: 0;
}

.footer-content ul li {
	display: inline;
	margin: 0 1rem;
}

.footer-content ul li a {
	color: var(--header-text-color);
	text-decoration: none;
	transition: color 0.3s;
}

.footer-content ul li a:hover {
	color: var(--primary-color);
}

/* Restaurants Section */
.restaurants {
	padding: 50px 20px;
	animation: fadeIn 2s ease-in-out;
	text-align: center;
}

.restaurants h2 {
	font-size: 28px;
	text-align: center;
	margin-bottom: 20px;
	position: relative;
	display: inline-block;
}

.restaurants h2::after {
	content: '';
	position: absolute;
	bottom: -10px;
	left: 50%;
	transform: translateX(-50%);
	width: 50px;
	height: 3px;
	background: var(--primary-color);
}

.restaurant-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 50px;
}

.restaurant-item {
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	padding: 20px;
	width: 250px;
	transition: transform 0.3s, box-shadow 0.3s;
}

.restaurant-item:hover {
	cursor: pointer;
	transform: translateY(-10px);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
}

.restaurant-item img {
	width: 100%;
	border-radius: 10px;
	transition: transform 0.3s;
}

.restaurant-item:hover img {
	transform: scale(1.05);
}

.restaurant-item h3 {
	font-size: 20px;
	margin: 10px 0;
}

.restaurant-item p {
	color: var(--text-color);
}

.restaurant-item span {
	color: #999;
	font-size: 14px;
}

/* Media Queries */
@media ( max-width : 1200px) {
	nav ul {
		gap: 0.5rem;
	}
	.hero-content h1 {
		font-size: 2.5rem;
	}
	.hero-content p {
		font-size: 1rem;
	}
	.dish {
		flex: 1 1 250px;
	}
}

@media ( max-width : 768px) {
	nav ul {
		flex-direction: column;
		gap: 0.5rem;
	}
	.hero-content h1 {
		font-size: 2rem;
	}
	.hero-content p {
		font-size: 0.9rem;
	}
	.dish {
		flex: 1 1 200px;
		max-width: 100%;
	}
	.steps {
		flex-direction: column;
	}
	.step {
		max-width: 100%;
	}
}

@media ( max-width : 480px) {
	nav .logo {
		font-size: 1.2rem;
	}
	.hero-content h1 {
		font-size: 1.5rem;
	}
	.hero-content p {
		font-size: 0.8rem;
	}
	.dishes {
		flex-direction: column;
		align-items: center;
	}
	.step {
		max-width: 100%;
	}
	.restaurant-item {
		width: 100%;
	}
	.restaurant-container {
		gap: 20px;
	}
}

a {
	text-decoration: none;
	color: #000;
}
</style>
</body>
</html>