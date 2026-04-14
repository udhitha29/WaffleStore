<%@ page contentType="text/html;charset=UTF-8" %>

<%
String username = (String) session.getAttribute("user");
if(username == null){
response.sendRedirect("login.jsp");
return;
}

// Get cart from session
java.util.Map<String, Integer> cart =
(java.util.Map<String, Integer>) session.getAttribute("cart");

if(cart == null){
cart = new java.util.HashMap<String, Integer>();
}

// Add item to cart
String item = request.getParameter("item");
if(item != null){
Integer qty = cart.get(item);
if(qty == null){
cart.put(item, 1);
} else {
cart.put(item, qty + 1);
}
}

session.setAttribute("cart", cart);

// Calculate total items
int totalItems = 0;
for(Integer qty : cart.values()){
totalItems += qty;
}
%>

<!DOCTYPE html>

<html>
<head>
<title>Waffles - WaffyLand</title>

<style>
body {
    font-family: Arial;
    background-color: #fff8f0;
    margin: 0;
    text-align: center;
}

.header{
    background:#ff8c00;
    color:white;
    padding:15px 30px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.header a{
    color:white;
    text-decoration:none;
    margin-left:15px;
}

.container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
    margin: 30px;
}

.card {
    background: white;
    width: 220px;
    padding: 15px;
    border-radius: 15px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}

.card img {
    width: 100%;
    height: 150px;
    border-radius: 10px;
}

.price {
    color: green;
    font-weight: bold;
}

button{
    padding:6px 10px;
    border:none;
    background:#ff8c00;
    color:white;
    border-radius:15px;
    font-size:12px;
    cursor:pointer;
}
</style>

</head>

<body>

<div class="header">
    <div>🧇 WaffyLand</div>
    <div>
        Welcome, <%= username %> |
        <a href="home.jsp">Home</a> |
        <a href="cart.jsp">🛒 Cart (<%= totalItems %>)</a>
    </div>
</div>

<h1>Our Delicious Waffles 🧇</h1>

<div class="container">

<!-- Belgian -->

<div class="card">
    <img src="images/belgian.jpg">
    <h3>Belgian Waffle</h3>
    <p class="price">₹120</p>
    <form method="post">
        <input type="hidden" name="item" value="Belgian Waffle">
        <button type="submit">🛒 Add</button>
    </form>
</div>

<!-- Blueberry -->

<div class="card">
    <img src="images/blueberry.jpg">
    <h3>Blueberry Waffle</h3>
    <p class="price">₹140</p>
    <form method="post">
        <input type="hidden" name="item" value="Blueberry Waffle">
        <button type="submit">🛒 Add</button>
    </form>
</div>

<!-- Bubblegum -->

<div class="card">
    <img src="images/bubblegum.jpg">
    <h3>Bubblegum Waffle</h3>
    <p class="price">₹130</p>
    <form method="post">
        <input type="hidden" name="item" value="Bubblegum Waffle">
        <button type="submit">🛒 Add</button>
    </form>
</div>

<!-- Butterscotch -->

<div class="card">
    <img src="images/buterscotch.jpg">
    <h3>Butterscotch Waffle</h3>
    <p class="price">₹150</p>
    <form method="post">
        <input type="hidden" name="item" value="Butterscotch Waffle">
        <button type="submit">🛒 Add</button>
    </form>
</div>

<!-- Coffee -->

<div class="card">
    <img src="images/coffee.jpg">
    <h3>Coffee Waffle</h3>
    <p class="price">₹160</p>
    <form method="post">
        <input type="hidden" name="item" value="Coffee Waffle">
        <button type="submit">🛒 Add</button>
    </form>
</div>

<!-- Honey -->

<div class="card">
    <img src="images/honey.jpg">
    <h3>Honey Waffle</h3>
    <p class="price">₹140</p>
    <form method="post">
        <input type="hidden" name="item" value="Honey Waffle">
        <button type="submit">🛒 Add</button>
    </form>
</div>

<!-- Ice Cream -->

<div class="card">
    <img src="images/ice.jpg">
    <h3>Ice Cream Waffle</h3>
    <p class="price">₹180</p>
    <form method="post">
        <input type="hidden" name="item" value="Ice Cream Waffle">
        <button type="submit">🛒 Add</button>
    </form>
</div>

</div>

</body>
</html>
