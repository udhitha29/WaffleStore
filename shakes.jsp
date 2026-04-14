<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Shakes - WaffyLand</title>

<style>

body{
    font-family:Segoe UI;
    margin:0;
    background:#fff8f5;
}

/* Back button */
.back{
    margin:20px;
}

.back a{
    background:#ff8c00;
    color:white;
    padding:10px 18px;
    text-decoration:none;
    border-radius:8px;
    font-weight:bold;
}

/* Grid menu */
.menu{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
    gap:25px;
    padding:30px;
}

/* Item card */
.item{
    background:white;
    border-radius:15px;
    box-shadow:0 5px 15px rgba(0,0,0,0.15);
    text-align:center;
    padding:10px;
    transition:0.3s;
}

.item:hover{
    transform:translateY(-5px);
}

.item img{
    width:100%;
    height:180px;
    object-fit:cover;
    border-radius:10px;
}

.item h3{
    margin:10px 0;
}

.price{
    color:#444;
    font-weight:bold;
}

.cartbtn{
    background:#ff8c00;
    color:white;
    border:none;
    padding:10px 15px;
    border-radius:20px;
    cursor:pointer;
    margin-top:10px;
    font-weight:bold;
}

.cartbtn:hover{
    background:#e67600;
}

</style>

</head>

<body>

<jsp:include page="header.jsp" />

<div class="back">
    <a href="home.jsp">⬅ Back to Home</a>
</div>

<div class="menu">

```
<!-- Strawberry -->
<div class="item">
    <img src="images/strawberryshort.jpg">
    <h3>Strawberry Shortcake Shake</h3>
    <p class="price">₹199</p>
    <a href="addToCart.jsp?item=Strawberry Shortcake Shake">
        <button class="cartbtn">🛒 Add to Cart</button>
    </a>
</div>

<!-- Banana -->
<div class="item">
    <img src="images/bananacreampie.jpg">
    <h3>Banana Cream Pie Shake</h3>
    <p class="price">₹199</p>
    <a href="addToCart.jsp?item=Banana Cream Pie Shake">
        <button class="cartbtn">🛒 Add to Cart</button>
    </a>
</div>

<!-- Fruity -->
<div class="item">
    <img src="images/fruitypebble.jpg">
    <h3>Fruity Pebble Shake</h3>
    <p class="price">₹199</p>
    <a href="addToCart.jsp?item=Fruity Pebble Shake">
        <button class="cartbtn">🛒 Add to Cart</button>
    </a>
</div>

<!-- Peanut Butter -->
<div class="item">
    <img src="images/peanutbutteerbrownie.jpg">
    <h3>Peanut Butter Brownie Shake</h3>
    <p class="price">₹219</p>
    <a href="addToCart.jsp?item=Peanut Butter Brownie Shake">
        <button class="cartbtn">🛒 Add to Cart</button>
    </a>
</div>

<!-- Smores -->
<div class="item">
    <img src="images/smores.jpg">
    <h3>S'mores Shake</h3>
    <p class="price">₹219</p>
    <a href="addToCart.jsp?item=S'mores Shake">
        <button class="cartbtn">🛒 Add to Cart</button>
    </a>
</div>

<!-- Mint -->
<div class="item">
    <img src="images/mintwhitechocolate.webp">
    <h3>Mint White Chocolate Shake</h3>
    <p class="price">₹199</p>
    <a href="addToCart.jsp?item=Mint White Chocolate Shake">
        <button class="cartbtn">🛒 Add to Cart</button>
    </a>
</div>

<!-- Cherry -->
<div class="item">
    <img src="images/cherryvanilla.jpg">
    <h3>Cherry Vanilla Shake</h3>
    <p class="price">₹199</p>
    <a href="addToCart.jsp?item=Cherry Vanilla Shake">
        <button class="cartbtn">🛒 Add to Cart</button>
    </a>
</div>

<!-- Salted Caramel -->
<div class="item">
    <img src="images/saltedcaramelpretzel.jpg">
    <h3>Salted Caramel Pretzel Shake</h3>
    <p class="price">₹219</p>
    <a href="addToCart.jsp?item=Salted Caramel Pretzel Shake">
        <button class="cartbtn">🛒 Add to Cart</button>
    </a>
</div>
```

</div>

</body>
</html>
