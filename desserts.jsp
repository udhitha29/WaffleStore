<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
java.util.Map<String,Integer> cart =
(java.util.Map<String,Integer>) session.getAttribute("cart");

if(cart == null){
cart = new java.util.HashMap<>();
}

// Add item to cart (current JSP logic)
String item = request.getParameter("item");
if(item != null){
int qty = cart.getOrDefault(item,0);
cart.put(item, qty + 1);
}

session.setAttribute("cart", cart);

// Total items
int totalItems = 0;
for(int q : cart.values()){
totalItems += q;
}
%>

<!DOCTYPE html>

<html>
<head>
<title>Desserts Menu</title>

<style>
body{
    font-family:Segoe UI;
    margin:0;
    background:#fff8f5;
}

.header{
    background:#ff8c00;
    color:white;
    padding:15px 30px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.logo{
    font-size:22px;
    font-weight:bold;
}

.container{
    padding:40px;
    text-align:center;
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
    color:#ff8c00;
    font-weight:bold;
    margin:5px;
}

button{
    background:#ff8c00;
    border:none;
    color:white;
    padding:10px 15px;
    border-radius:8px;
    margin:10px;
    cursor:pointer;
}

button:hover{
    background:#e67600;
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
    <div class="logo">🍰 Desserts</div>
    <div>
        🛒 <a href="cart.jsp" style="color:white;">Cart (<%= totalItems %>)</a>
    </div>
</div>

<div class="container">

<div class="grid">

<!-- Pound Cake -->

<div class="card">
    <img src="images/poundcake.jpg">
    <div class="name">Pound Cake</div>
    <div class="price">₹140</div>
    <form>
        <input type="hidden" name="item" value="Pound Cake">
        <button>Add to Cart</button>
    </form>
</div>

<!-- Paczki -->

<div class="card">
    <img src="images/paczki.jpg">
    <div class="name">Paczki</div>
    <div class="price">₹150</div>
    <form>
        <input type="hidden" name="item" value="Paczki">
        <button>Add to Cart</button>
    </form>
</div>

<!-- Swiss Roll -->

<div class="card">
    <img src="images/swissroll.jpg">
    <div class="name">Swiss Roll</div>
    <div class="price">₹130</div>
    <form>
        <input type="hidden" name="item" value="Swiss Roll">
        <button>Add to Cart</button>
    </form>
</div>

<!-- Sachertorte -->

<div class="card">
    <img src="images/sachertorte.jpg">
    <div class="name">Sachertorte</div>
    <div class="price">₹200</div>
    <form>
        <input type="hidden" name="item" value="Sachertorte">
        <button>Add to Cart</button>
    </form>
</div>

<!-- Jelly Roll -->

<div class="card">
    <img src="images/jellyroll.webp">
    <div class="name">Jelly Roll</div>
    <div class="price">₹120</div>
    <form>
        <input type="hidden" name="item" value="Jelly Roll">
        <button>Add to Cart</button>
    </form>
</div>

<!-- Foam Cake -->

<div class="card">
    <img src="images/foamcake.jpg">
    <div class="name">Foam Cake</div>
    <div class="price">₹160</div>
    <form>
        <input type="hidden" name="item" value="Foam Cake">
        <button>Add to Cart</button>
    </form>
</div>

<!-- Dobos Cake -->

<div class="card">
    <img src="images/dobos.jpg">
    <div class="name">Dobos Cake</div>
    <div class="price">₹180</div>
    <form>
        <input type="hidden" name="item" value="Dobos Cake">
        <button>Add to Cart</button>
    </form>
</div>

<!-- Date Square -->

<div class="card">
    <img src="images/datesquare.jpg">
    <div class="name">Date Square</div>
    <div class="price">₹140</div>
    <form>
        <input type="hidden" name="item" value="Date Square">
        <button>Add to Cart</button>
    </form>
</div>

<!-- Cup Cake -->

<div class="card">
    <img src="images/cupcake.jpg">
    <div class="name">Cup Cake</div>
    <div class="price">₹100</div>
    <form>
        <input type="hidden" name="item" value="Cup Cake">
        <button>Add to Cart</button>
    </form>
</div>

<!-- Battenberg -->

<div class="card">
    <img src="images/battenberg.jpg">
    <div class="name">Battenberg Cake</div>
    <div class="price">₹170</div>
    <form>
        <input type="hidden" name="item" value="Battenberg Cake">
        <button>Add to Cart</button>
    </form>
</div>

<!-- Angel Cake -->

<div class="card">
    <img src="images/angelcake.jpg">
    <div class="name">Angel Cake</div>
    <div class="price">₹190</div>
    <form>
        <input type="hidden" name="item" value="Angel Cake">
        <button>Add to Cart</button>
    </form>
</div>

</div>

<a href="home.jsp" class="homebtn">⬅ Back to Home</a>

</div>

</body>
</html>
