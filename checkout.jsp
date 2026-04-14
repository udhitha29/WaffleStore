<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>

<%
String username = (String) session.getAttribute("user");

Map<String,Integer> cart =
(Map<String,Integer>)session.getAttribute("cart");

if(cart == null || cart.isEmpty()){
response.sendRedirect("cart.jsp");
return;
}

/* Price List */

Map<String,Integer> prices = new HashMap<>();

// Pancakes
prices.put("Banana Pancake",120);
prices.put("Buttermilk Pancake",130);
prices.put("Chocolate Chip Pancake",150);
prices.put("Chocolate Strawberry",170);
prices.put("Double Chocolate",180);
prices.put("Double Berry",170);
prices.put("Double Vanilla",160);
prices.put("Red Velvet Pancake",190);
prices.put("Tres Leches Pancake",200);

// Desserts
prices.put("Pound Cake",140);
prices.put("Paczki",150);
prices.put("Swiss Roll",130);
prices.put("Sachertorte",200);
prices.put("Jelly Roll",120);
prices.put("Foam Cake",160);
prices.put("Dobos Cake",180);
prices.put("Date Square",140);
prices.put("Cup Cake",100);
prices.put("Battenberg Cake",170);
prices.put("Angel Cake",190);

// Shakes
prices.put("KitKat Shake",199);
prices.put("Strawberry Shortcake Shake",199);
prices.put("Banana Cream Pie Shake",199);
prices.put("Fruity Pebble Shake",199);
prices.put("Peanut Butter Brownie Shake",219);
prices.put("S'mores Shake",219);
prices.put("Mint White Chocolate Shake",199);
prices.put("Cherry Vanilla Shake",199);
prices.put("Salted Caramel Pretzel Shake",219);

int total = 0;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>

<style>

body{
font-family:'Segoe UI';
background: linear-gradient(rgba(255,240,245,0.85), rgba(255,228,225,0.85)),
url("images/checkouti.jpg");
background-size: cover;
text-align:center;
}

/* header */

.header{
background:#ff8c00;
padding:15px 30px;
color:white;
display:flex;
justify-content:space-between;
}

.header a{
color:white;
text-decoration:none;
margin-left:15px;
}

/* main box */

.box{
width:45%;
margin:40px auto;
background:white;
padding:30px;
border-radius:25px;
box-shadow:0 10px 25px rgba(0,0,0,0.2);
}

/* table */

table{
width:100%;
margin-top:15px;
border-collapse:collapse;
}

th,td{
padding:10px;
}

th{
background:#fff0f5;
}

/* inputs */

input,textarea{
width:90%;
padding:12px;
margin:10px 0;
border-radius:15px;
border:1px solid #ddd;
}

button{
background:#ff8c00;
color:white;
padding:12px 25px;
border:none;
border-radius:25px;
cursor:pointer;
}

.total{
font-size:20px;
font-weight:bold;
color:#2e7d32;
margin-top:10px;
}

.homebtn{
margin-top:20px;
display:inline-block;
background:#555;
color:white;
padding:10px 20px;
border-radius:20px;
text-decoration:none;
}

</style>
</head>

<body>

<!-- Header -->

<div class="header">

<div>🧇 WaffyLand</div>

<div>
Welcome, <%=username%> |
<a href="home.jsp">🏠 Home</a> |
<a href="cart.jsp">🛒 Cart</a>
</div>

</div>


<div class="box">

<h2>🧁 Your Order</h2>

<table>

<tr>
<th>Item</th>
<th>Qty</th>
<th>Subtotal</th>
</tr>

<%
for(String item : cart.keySet()){

int qty = cart.get(item);

int price = prices.getOrDefault(item,0);

int subtotal = qty * price;

total += subtotal;
%>

<tr>
<td><%=item%></td>
<td><%=qty%></td>
<td>₹<%=subtotal%></td>
</tr>

<%
}
%>

</table>

<div class="total">
Total Amount: ₹<%=total%>
</div>


<h2>💖 Sweet Delivery Details 💖</h2>

<form action="payment.jsp" method="post">

<input type="text" name="name" placeholder="👩‍🍳 Your Name" required>

<input type="text" name="mobile" placeholder="📱 Mobile Number" required>

<textarea name="address" placeholder="🏠 Delivery Address" required></textarea>

<button type="submit">Continue to Payment ➡</button>

</form>

<br>

<a href="home.jsp" class="homebtn">⬅ Back to Home</a>

</div>

</body>
</html>