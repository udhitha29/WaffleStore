<%@ page contentType="text/html;charset=UTF-8" %>

<%
String username = (String) session.getAttribute("user");
if(username == null){
    response.sendRedirect("login.jsp");
    return;
}

// Get cart from session
java.util.Map<String,Integer> cart =
(java.util.Map<String,Integer>) session.getAttribute("cart");

if(cart == null){
    cart = new java.util.HashMap<String,Integer>();
}

// Add item to cart
String item = request.getParameter("item");
if(item != null){
    Integer qty = cart.get(item);
    if(qty == null){
        cart.put(item,1);
    }else{
        cart.put(item,qty+1);
    }
}

session.setAttribute("cart",cart);

// Calculate total items
int totalItems = 0;
for(Integer qty : cart.values()){
    totalItems += qty;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Pancakes - WaffyLand</title>

<style>

body{
font-family:Segoe UI;
margin:0;
background:#fff8f5;
text-align:center;
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

.container{
padding:40px;
}

.grid{
display:grid;
grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
gap:25px;
}

.card{
background:white;
border-radius:18px;
box-shadow:0 6px 18px rgba(0,0,0,0.15);
overflow:hidden;
transition:0.3s;
padding-bottom:10px;
}

.card:hover{
transform:translateY(-5px);
}

.card img{
width:100%;
height:180px;
object-fit:cover;
}

.name{
font-size:18px;
font-weight:600;
margin-top:10px;
}

.price{
color:green;
font-weight:bold;
margin:5px;
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

.homebtn{
margin-top:30px;
display:inline-block;
padding:10px 20px;
background:#444;
color:white;
text-decoration:none;
border-radius:8px;
}

</style>

</head>

<body>

<div class="header">

<div>
🥞 WaffyLand
</div>

<div>
Welcome, <%= username %> |
<a href="home.jsp">Home</a> |
<a href="cart.jsp">🛒 Cart (<%= totalItems %>)</a>
</div>

</div>

<h1>Our Delicious Pancakes 🥞</h1>

<div class="container">

<div class="grid">

<!-- Banana -->
<div class="card">
<img src="images/banana.jpg">
<div class="name">Banana Pancake</div>
<div class="price">₹120</div>
<form method="post">
<input type="hidden" name="item" value="Banana Pancake">
<button type="submit">🛒 Add</button>
</form>
</div>

<!-- Buttermilk -->
<div class="card">
<img src="images/butermilk.jpg">
<div class="name">Buttermilk Pancake</div>
<div class="price">₹130</div>
<form method="post">
<input type="hidden" name="item" value="Buttermilk Pancake">
<button type="submit">🛒 Add</button>
</form>
</div>

<!-- Chocolate Chip -->
<div class="card">
<img src="images/chocolatechipp.jpg">
<div class="name">Chocolate Chip Pancake</div>
<div class="price">₹150</div>
<form method="post">
<input type="hidden" name="item" value="Chocolate Chip Pancake">
<button type="submit">🛒 Add</button>
</form>
</div>

<!-- Chocolate Strawberry -->
<div class="card">
<img src="images/chocolate_strawbery.jpg">
<div class="name">Chocolate Strawberry</div>
<div class="price">₹170</div>
<form method="post">
<input type="hidden" name="item" value="Chocolate Strawberry">
<button type="submit">🛒 Add</button>
</form>
</div>

<!-- Double Chocolate -->
<div class="card">
<img src="images/double_chocolate.jpg">
<div class="name">Double Chocolate</div>
<div class="price">₹180</div>
<form method="post">
<input type="hidden" name="item" value="Double Chocolate">
<button type="submit">🛒 Add</button>
</form>
</div>

<!-- Double Berry -->
<div class="card">
<img src="images/double_berry.jpg">
<div class="name">Double Berry</div>
<div class="price">₹170</div>
<form method="post">
<input type="hidden" name="item" value="Double Berry">
<button type="submit">🛒 Add</button>
</form>
</div>

<!-- Double Vanilla -->
<div class="card">
<img src="images/double_vanila.jpg">
<div class="name">Double Vanilla</div>
<div class="price">₹160</div>
<form method="post">
<input type="hidden" name="item" value="Double Vanilla">
<button type="submit">🛒 Add</button>
</form>
</div>

<!-- Red Velvet -->
<div class="card">
<img src="images/redvelvet.jpg">
<div class="name">Red Velvet Pancake</div>
<div class="price">₹190</div>
<form method="post">
<input type="hidden" name="item" value="Red Velvet Pancake">
<button type="submit">🛒 Add</button>
</form>
</div>

<!-- Tres Leches -->
<div class="card">
<img src="images/treeleeches.jpg">
<div class="name">Tres Leches Pancake</div>
<div class="price">₹200</div>
<form method="post">
<input type="hidden" name="item" value="Tres Leches Pancake">
<button type="submit">🛒 Add</button>
</form>
</div>

</div>
<a href="CartServlet?action=add&item=Belgian Waffle">
    <button>Add to Cart</button>
</a>
<a href="home.jsp" class="homebtn">⬅ Back to Home</a>

</div>

</body>
</html>