<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List, com.food.model.Restaurant, com.food.model.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Delivery App</title>
    
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
    <section class="hero">
        <div class="hero-content animate__animated animate__fadeIn">
            <h1>Order food online from 1000+ restaurants!</h1>
            <p>Food delivery service that's easy & convenient!</p>
            <form action="restaurant" id="searchForm">
                <div class="search-box animate__animated animate__fadeInUp">
                    <select required name="city" id="city">
                        <option value="" disabled selected>City</option>
                        <option value="Bengaluru">Bengaluru</option>
                        <option value="Mumbai">Mumbai</option>
                        <option value="Pune">Pune</option>
                        <option value="Hydrabad">Hydrabad</option>
                        <option value="Chennai">Chennai</option>
                        <option value="Delhi">Delhi</option>
                        <option value="Bihar">Bihar</option>
                        <option value="Noida">Noida</option>
                        <!-- Add more options as needed -->
                    </select>
                    <input type="text" placeholder="District Name" name="district" id="district">
                    <button type="submit" class="show-restaurants">SHOW RESTAURANTS</button>
                </div>
            </form>
        </div>
        <div class="floating-bubbles">
            <div class="bubble"></div>
            <div class="bubble"></div>
            <div class="bubble"></div>
            <div class="bubble"></div>
            <div class="bubble"></div>
        </div>
    </section>
    
    <section class="how-it-works">
        <h2>How it works</h2>
        <p>Get your favourite food in 4 simple steps</p>
        <div class="steps">
            <div class="step">
                <img src="images/step1.png" alt="Search">
                <h3>Search</h3>
                <p>Find all restaurants available near you</p>
            </div>
            <div class="step">
                <img src="images/step2.png" alt="Choose">
                <h3>Choose</h3>
                <p>Browse hundreds of menus to find the food you like</p>
            </div>
            <div class="step">
                <img src="images/step3.png" alt="Pay">
                <h3>Pay</h3>
                <p>It's quick, secure and easy</p>
            </div>
            <div class="step">
                <img src="images/step4.png" alt="Enjoy">
                <h3>Enjoy</h3>
                <p>Food is prepared & delivered to your door</p>
            </div>
        </div>
    </section>
    <section class="featured-dishes">
        <h2>Featured Dishes</h2>
        <div class="dishes">
            <div class="dish" class="a">
                <img src="images/pizza.avif" alt="Pizza">
                <h3>Pizza</h3>
                <p>Delicious cheese pizza with fresh ingredients.</p>
            </div>
            <div class="dish" class="b">
                <img src="images/burger.jpg" alt="Burger">
                <h3>Burger</h3>
                <p>Juicy chicken burger with crispy fries.</p>
            </div>
            <div class="dish" class="c">
                <img src="images/Biriyani.jpg" alt="Sushi">
                <h3>Biriyani</h3>
                <p>Fresh Biriyani with Hyderabadi style.</p>
            </div>
        </div>
    </section>
    <section class="restaurants" style="background-color: rgb(255, 253, 253)">
        <h2>Popular Restaurants</h2>
        <div class="restaurant-container">
            <div class="restaurant-item">
                <img src="images/UBQ.avif" alt="Restaurant 1">
                <h3>UBQ by Barbeque Nation</h3>
                <p>North Indian, Barbecue, Biryani</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/Pizza Hut.avif" alt="Restaurant 1">
                <h3>Pizza Hut</h3>
                <p>Pizzas</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/wow momo.avif" alt="Restaurant 1">
                <h3>Wow! Momo</h3>
                <p>Tibetan, Healthy Food</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/Barbeque nation.avif" alt="Restaurant 1">
                <h3>Barbeque Nation</h3>
                <p>North Indian, Barbecue, Biryani</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/subway.avif" alt="Restaurant 1">
                <h3>Subway</h3>
                <p>Salads,Snacks,Deserts</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/corner house.avif" alt="Restaurant 1">
                <h3>Corner House Ice Cream</h3>
                <p>Ice Cream, Desearts</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/mojo pizza.avif" alt="Restaurant 1">
                <h3>MOJO PIZZA - 2X Toppings</h3>
                <p>Pizzas, Italian, Fast Food,Deserts</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/mcDonalds.avif" alt="Restaurant 1">
                <h3>McDonald's</h3>
                <p>Burger, Beaverages</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/kfc.avif" alt="Restaurant 1">
                <h3>KFC</h3>
                <p>Burgers, Fast Foods</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/burgerking.avif" alt="Restaurant 1">
                <h3>Burger King</h3>
                <p>Burgers, Americans</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/wendy's.avif" alt="Restaurant 1">
                <h3>Wendy's Burger</h3>
                <p>Burgers, American Fast Foods</p>
                <span>40-45 mins</span>
            </div>
            <div class="restaurant-item">
                <img src="images/dominos.avif" alt="Restaurant 1">
                <h3>Domino's Pizza</h3>
                <p>Pizzas, Italian, Pastas</p>
                <span>40-45 mins</span>
            </div>
            <!-- Repeat for other restaurants -->
        </div>
    </section>
    <section class="testimonials">
        <h2>What Our Customers Say</h2>
        <div class="testimonial">
            <p>"Tap Foods has the best delivery service! The food is always fresh and hot. Highly recommend!"</p>
            <h4>- Jane Doe</h4>
        </div>
        <div class="testimonial">
            <p>"Great variety of dishes and excellent customer service. I'm a regular customer now!"</p>
            <h4>- John Smith</h4>
        </div>
    </section>
    <section class="sliding-banner">
        <div class="banner-content">
            <p>Special Offer: Get 20% off on your first order! Use code: FIRST20</p>
        </div>
    </section>
    
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
    <script>
        window.addEventListener('scroll', function() {
            const nav = document.querySelector('nav');
            if (window.scrollY > 50) {
                nav.classList.add('scrolled');
            } else {
                nav.classList.remove('scrolled');
            }
        });

        document.getElementById('searchForm').addEventListener('submit', function(event) {
            const user = '<%=user != null%>';
            if (!user) {
                event.preventDefault();
                alert("Please log in or sign up first.");
                window.location.href = 'login.jsp';
            }
        });
    </script>
    <script>document.addEventListener('DOMContentLoaded', () => {
        const header = document.querySelector('header');
        let lastScrollY = window.scrollY;

        window.addEventListener('scroll', () => {
            if (window.scrollY > lastScrollY) {
                // Scrolling down
                header.style.transform = 'translateY(-100%)';
            } else {
                // Scrolling up
                header.style.transform = 'translateY(0)';
            }
            lastScrollY = window.scrollY;
        });
    });

    document.getElementById('theme-toggle').addEventListener('click', () => {
        document.body.classList.toggle('dark-mode');
    });
 </script>
 <style>body {
    margin: 0;
    font-family: 'Arial', sans-serif;
    background: #333 url(images/b6.jpg) no-repeat center center/cover;
    background-size: cover;
    background-attachment: fixed;
    color: #333;
}

header {
    background: rgba(30, 30, 30, 0.9);
    padding: .5rem 0;
    width: 100%;
    position: fixed;
    top: 0;
    z-index: 1000;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.7);
    transition: transform 0.3s ease, background 0.3s;
} 

 nav {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 87rem;
    margin: 0 auto;
    padding: 0 1rem;
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

nav ul li a{
    text-decoration: none;
}

nav ul li a{
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

/* Hero Section */
.hero {
    height: 100vh;
    background: url('https://source.unsplash.com/1600x900/?food') no-repeat center center/cover;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    color: #fff;
    padding-top: 4rem;
    position: relative;
    overflow: hidden;
}

.hero::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.7);
    z-index: 1;
}

.hero-content {
    height: 56vh;
    position: relative;
    z-index: 2;
    animation: fadeIn 2s ease-in-out;
}

.hero-content h1 {
    font-size: 3rem;
    margin-bottom: 1rem;
    text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
    animation: slideInLeft 1.5s ease;
}

.hero-content p {
    font-size: 1.2rem;
    margin-bottom: 2rem;
    text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
    animation: slideInRight 1.5s ease;
}

.search-box {
    display: flex;
    width: 75%;
    margin: 0 auto;
    background: rgba(46, 46, 46, 0.9);
    padding: 10px;
    border-radius: 5px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    
}

.search-box {
    display: flex;
    gap: 1.5em;
    justify-content: center;
    align-items: center;
    animation: fadeInUp 1.5s ease;

}

#city{
    width: 30%;
}

.search-box select, .search-box #district,
.search-box button {
    padding: 0.5rem 1rem;
    font-size: 1rem;
    border: none;
    border-radius: 5px;
    outline: none;
    transition: transform 0.3s, box-shadow 0.3s;
}

.search-box select {
    background: #fff;
    color: #333;
}

.search-box button {
    background: #ff6b6b;
    color: #fff;
    cursor: pointer;
    transition: background 0.3s, transform 0.3s, box-shadow 0.3s;
}

.search-box button:hover {
    background: #ff2e2e;
    transform: scale(1.05);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
}

/* Featured Dishes Section */
.featured-dishes {
    padding: 4rem 1rem;
    text-align: center;
    background: #f5f5f5;
    animation: fadeIn 2s ease-in-out;
}

.featured-dishes h2 {
    font-size: 2.5rem;
    margin-bottom: 2rem;
    position: relative;
    display: inline-block;
}

.featured-dishes h2::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 50px;
    height: 3px;
    background: #ff6b6b;
}

.dishes {
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
}

.dish {
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin: 1rem;
    overflow: hidden;
    transition: transform 0.3s, box-shadow 0.3s;
    flex: 1 1 200px; /* Adjust to make it responsive */
    max-width: 300px; /* Adjust to make it responsive */
}

.dish img {
    width: 100%;
    height: 200px;
    object-fit: cover;
    transition: transform 0.3s;
}

.dish:hover img {
    transform: scale(1.1);
}

.dish h3 {
    font-size: 1.5rem;
    margin: 1rem 0;
}

.dish p {
    padding: 0 1rem 1rem;
}

.dish:hover {
    cursor: pointer;
    transform: translateY(-10px);
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
}

/* How it Works Section */
.how-it-works {
    padding: 4rem 1rem;
    background: #fff;
    text-align: center;
    animation: fadeInUp 2s ease;
}

.how-it-works h2 {
    font-size: 2rem;
    margin-bottom: 1rem;
    position: relative;
    display: inline-block;
}

.how-it-works h2::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 50px;
    height: 3px;
    background: #ff6b6b;
}

.how-it-works p {
    font-size: 1rem;
    color: #666;
    margin-bottom: 2rem;
}

.steps {
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
    gap: 2rem;
}

.step {
    flex: 1 1 200px;
    max-width: 200px;
    text-align: center;
    animation: fadeIn 1s ease-in-out;
}

.step img {
    width: 60px;
    height: 60px;
   
    transition: transform 0.3s;
}

.step img:hover {
    transform: rotate(20deg) scale(1.1);
}

.step h3 {
    font-size: 1.2rem;
    color: #ff6b6b;
    margin-top: 0.2rem;
    margin-bottom: 0.5rem;
}

.step p {
    font-size: 1rem;
    color: #666;
}

/* Testimonials Section */
.testimonials {
    padding: 4rem 1rem;
    text-align: center;
    background: #f5f5f5;
    animation: fadeIn 2s ease-in-out;
}

.testimonials h2 {
    font-size: 2.5rem;
    margin-bottom: 2rem;
    position: relative;
    display: inline-block;
}

.testimonials h2::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 50px;
    height: 3px;
    background: #ff6b6b;
}

.testimonial {
    background: #fff;
    padding: 2rem;
    margin: 1rem auto;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    max-width: 600px;
    transition: transform 0.3s, box-shadow 0.3s;
}

.testimonial:hover {
    transform: translateY(-10px);
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
}

.testimonial p {
    font-size: 1.1rem;
    margin-bottom: 1rem;
    color: #666;
    line-height: 1.6;
}

.testimonial h4 {
    font-size: 1rem;
    color: #333;
    font-weight: bold;
}

/* Footer */
.footer-content {
    background: #000;
    padding: 1rem;
    text-align: center;
    color: #fff;
    margin-bottom: 3em;
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
    color: #fff;
    text-decoration: none;
    transition: color 0.3s;
}

.footer-content ul li a:hover {
    color: #ff6b6b;
}

/* Keyframes */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes slideInLeft {
    from {
        opacity: 0;
        transform: translateX(-50px);
    }
    to {
        opacity: 1;
        transform: translateX(0);
    }
}

@keyframes slideInRight {
    from {
        opacity: 0;
        transform: translateX(50px);
    }
    to {
        opacity: 1;
        transform: translateX(0);
    }
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
    background: #ff6b6b;
}

.restaurant-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 50px;
}

.restaurant-item {
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    padding: 20px;
    width: 250px;
    transition: transform 0.3s, box-shadow 0.3s;
}

.restaurant-item:hover {
    cursor: pointer;
    transform: translateY(-10px);
    box-shadow: 0 10px 20px rgba(0,0,0,0.15);
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
    color: #666;
}

.restaurant-item span {
    color: #999;
    font-size: 14px;
}

/* Media Queries */
@media (max-width: 1200px) {
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

@media (max-width: 768px) {
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

@media (max-width: 480px) {
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
/* Floating Bubbles */
.floating-bubbles {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    overflow: hidden;
    z-index: 0;
}

.bubble {
    position: absolute;
    bottom: -100px;
    background-color: rgba(255, 255, 255, 0.8);
    border-radius: 50%;
    opacity: 0.7;
    animation: float 10s infinite;
}

.bubble:nth-child(1) {
    width: 40px;
    height: 40px;
    left: 20%;
    animation-duration: 15s;
    animation-delay: 2s;
}

.bubble:nth-child(2) {
    width: 60px;
    height: 60px;
    left: 50%;
    animation-duration: 12s;
    animation-delay: 4s;
}

.bubble:nth-child(3) {
    width: 30px;
    height: 30px;
    left: 70%;
    animation-duration: 10s;
    animation-delay: 0s;
}

.bubble:nth-child(4) {
    width: 80px;
    height: 80px;
    left: 80%;
    animation-duration: 18s;
    animation-delay: 6s;
}

.bubble:nth-child(5) {
    width: 50px;
    height: 50px;
    left: 90%;
    animation-duration: 20s;
    animation-delay: 8s;
}

@keyframes float {
    0% {
        transform: translateY(0);
    }
    50% {
        transform: translateY(-100vh);
    }
    100% {
        transform: translateY(0);
    }
}

/* Sliding Banner */
.sliding-banner {
    position: fixed;
    bottom: 0;
    width: 100%;
    background-color: #ff6347;
    color: white;
    text-align: center;
    height: 3rem;
    z-index: 1000;
    overflow: hidden;
}

.banner-content {
    display: inline-block;
    white-space: nowrap;
    animation: slide 20s linear infinite;
}

@keyframes slide {
    0% {
        transform: translateX(100%);
    }
    100% {
        transform: translateX(-100%);
    }
}
</style>
</body>
</html>