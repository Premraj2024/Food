<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, com.food.model.Cart, com.food.model.CartItem, com.food.model.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
</head>
<body>
    <header class="animate__animated animate__fadeInDown">
        <nav>
            <a href="index.jsp"><div class="logo animate__animated animate__bounce">
                <img src="images/logo.png" height="60px" alt="Tap Foods">
            </div></a>
            <ul>
                <% 
                User user = (User) session.getAttribute("loggedInUser");
                if(user != null) {
                %>
                <li><a>Welcome, <%=user.getUsername()%>!</a></li>
                <li><a href="restaurant">Restaurants</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="orderHistory">Order History</a></li>
                <li><a href="logout" class="login-btn">Logout</a></li>
                <%
                } else {
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
    <div class="container animate__animated animate__fadeInUp">
        <h1>Your Shopping Cart</h1>
        <div class="cart-items">
            <%
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart != null && !cart.getItems().isEmpty()) {
                for (CartItem item : cart.getItems().values()) {
            %>
            <div class="cart-item animate__animated animate__zoomIn">
                <h3><%= item.getName() %></h3>
                <p>₹<%= item.getPrice() %></p>
                <form action="cart">
                    <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                    <label>Quantity: <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1"></label>
                    <input type="submit" name="action" value="update" class="btn update-btn">
                    <input type="submit" name="action" value="remove" class="btn remove-btn">
                </form>
            </div>
            <%
                }
            } else {
            %>
            <p>Your cart is empty.</p>
            <%
            }
            %>
        </div>
    
        <%-- Add More Items Button --%>
        <%
        Integer restaurantId = (Integer) session.getAttribute("restaurantId");
        if (restaurantId != null) {
        %>
        <a href="menu?restaurantId=<%= restaurantId %>" class="btn add-more-items-btn animate__animated animate__bounceIn">Add More Items</a>
        <%
        } else {
        %>
        <p>Unable to retrieve restaurant menu.</p>
        <%
        }
        %>
    
        <%-- Proceed to Checkout Button --%>
        <%
        if (cart != null && user != null) {
        %>
        <form action="checkout.jsp" method="post">
            <input type="submit" value="Proceed to Checkout" class="btn proceed-to-checkout-btn animate__animated animate__fadeInUp">
        </form>
        <%
        } else if (user == null) {
            response.sendRedirect("login.jsp");
        }
        %>
    </div>

    <script>
    document.addEventListener('DOMContentLoaded', () => {
        const cartItemsContainer = document.getElementById('cart-items');
        const totalElement = document.getElementById('total');
        const cartCount = document.getElementById('cart-count');
        let cart = JSON.parse(localStorage.getItem('cart')) || [];

        function renderCartItems() {
            cartItemsContainer.innerHTML = '';
            let total = 0;

            cart.forEach((item, index) => {
                total += parseFloat(item.price);
                const cartItem = document.createElement('div');
                cartItem.classList.add('cart-item');

                cartItem.innerHTML = `
                    <img src="${item.img || 'default.jpg'}" alt="${item.name}">
                    <h3>${item.name}</h3>
                    <p>₹${item.price}</p>
                    <button class="remove-from-cart" data-index="${index}">Remove</button>
                `;

                cartItemsContainer.appendChild(cartItem);
            });

            totalElement.textContent = total.toFixed(2);
            if (cartCount) {
                cartCount.textContent = cart.length;
            }

            document.querySelectorAll('.remove-from-cart').forEach(button => {
                button.addEventListener('click', (event) => {
                    const index = event.target.getAttribute('data-index');
                    cart.splice(index, 1);
                    localStorage.setItem('cart', JSON.stringify(cart));
                    renderCartItems();
                });
            });
        }

        renderCartItems();
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

	a	{
		text-decoration: none
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
	
	.container {
	    padding: 20px;
	    text-align: center;
	    background-color: rgba(255, 255, 255, 0.9);
	    border-radius: 8px;
	    max-width: 800px;
	    margin: 20px auto;
	}
	
	.cart-items {
	    margin-bottom: 20px;
	}
	
	.cart-item {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    padding: 10px;
	    border-bottom: 1px solid #ddd;
	}
	
	.cart-item img {
	    width: 100px;
	    height: auto;
	    border-radius: 5px;
	}
	
	.cart-item h3 {
	    margin: 0;
	    padding: 0;
	    font-size: 18px;
	}
	
	.cart-item p {
	    margin: 5px 0;
	    color: #333;
	}
	
	.total-price {
	    font-size: 1.5rem;
	    margin-bottom: 20px;
	}
	
	.payment-methods {
	    text-align: left;
	    margin-bottom: 20px;
	}
	
	.payment-methods h2 {
	    margin-bottom: 10px;
	}
	
	.payment-methods label {
	    display: block;
	    margin: 10px 0;
	}
	
	.btn {

	    background-color: #ff6b6b;
	    color: white;
	    border: none;
	    padding: 10px 20px;
	    cursor: pointer;
	    border-radius: 5px;
	    transition: background-color 0.3s;
	    margin: 1rem;
	}
	
	.btn:hover {
	    background-color: #ff2e2e;
	}
	
	.update-btn {
	    margin-right: 10px;
	}
	
	.remove-btn {
	    background-color: #f44336;
	}
	
	.remove-btn:hover {
	    background-color: #d32f2f;
	}
</style>
</body>
</html>