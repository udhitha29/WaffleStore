```jsp
<%@ page contentType="text/html;charset=UTF-8" %>

<%
String name = request.getParameter("name");
String mobile = request.getParameter("mobile");
String address = request.getParameter("address");

if(name == null){
    response.sendRedirect("checkout.jsp");
    return;
}

session.setAttribute("custName", name);
session.setAttribute("custMobile", mobile);
session.setAttribute("custAddress", address);

/* CART */

java.util.Map<String,Integer> cart =
(java.util.Map<String,Integer>) session.getAttribute("cart");

if(cart == null){
    cart = new java.util.HashMap<String,Integer>();
}

/* PRICE LIST */

java.util.Map<String,Integer> prices = new java.util.HashMap<String,Integer>();

// waffles
prices.put("Belgian Waffle",120);
prices.put("Blueberry Waffle",140);
prices.put("Bubblegum Waffle",130);
prices.put("Butterscotch Waffle",150);
prices.put("Coffee Waffle",160);
prices.put("Honey Waffle",140);
prices.put("Ice Cream Waffle",180);

// pancakes
prices.put("Banana Pancake",120);
prices.put("Buttermilk Pancake",130);
prices.put("Chocolate Chip Pancake",150);
prices.put("Chocolate Strawberry",170);
prices.put("Double Chocolate",180);
prices.put("Double Berry",170);
prices.put("Double Vanilla",160);
prices.put("Red Velvet Pancake",190);
prices.put("Tres Leches Pancake",200);

// desserts
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

// shakes
prices.put("KitKat Shake",199);
prices.put("Strawberry Shortcake Shake",199);
prices.put("Banana Cream Pie Shake",199);
prices.put("Fruity Pebble Shake",199);
prices.put("Peanut Butter Brownie Shake",219);
prices.put("S'mores Shake",219);
prices.put("Mint White Chocolate Shake",199);
prices.put("Cherry Vanilla Shake",199);
prices.put("Salted Caramel Pretzel Shake",219);


/* TOTAL CALCULATION */

int total = 0;

for(String item : cart.keySet()){
    int qty = cart.get(item);
    int price = prices.getOrDefault(item,0);
    total += qty * price;
}
%>


<!DOCTYPE html>
<html>
<head>

<title>💳 Payment</title>

<style>

body{
font-family:'Segoe UI';
background:linear-gradient(rgba(255,250,240,0.9), rgba(255,240,245,0.9)),
url("images/paymenti.jpg");
background-size:cover;
text-align:center;
}

.container{
width:45%;
margin:50px auto;
background:white;
padding:30px;
border-radius:25px;
box-shadow:0 10px 25px rgba(0,0,0,0.2);
}

.section{
margin:20px 0;
padding:20px;
background:#fff5f8;
border-radius:20px;
}

button{
padding:10px 20px;
margin:8px;
border:none;
border-radius:20px;
cursor:pointer;
font-size:14px;
transition:0.2s;
}

button:hover{
transform:scale(1.05);
}

.primary{
background:#ff6f61;
color:white;
}

.total{
font-size:24px;
font-weight:bold;
color:#2e7d32;
margin-bottom:20px;
}

.extra{
color:#e53935;
font-weight:bold;
}

/* INPUTS */

input{
padding:10px;
border-radius:10px;
border:1px solid #ccc;
width:70%;
}

/* POPUP */

.popup{
position:fixed;
top:0;
left:0;
width:100%;
height:100%;
background:rgba(0,0,0,0.6);
display:none;
align-items:center;
justify-content:center;
}

.popup-box{
background:white;
padding:40px;
border-radius:25px;
text-align:center;
animation:pop 0.5s ease;
}

@keyframes pop{
0%{transform:scale(0.5);}
100%{transform:scale(1);}
}

.waffle{
font-size:70px;
animation:spin 2s infinite linear;
}

@keyframes spin{
0%{transform:rotate(0deg);}
100%{transform:rotate(360deg);}
}

</style>


<script>

function hideAll(){
document.getElementById("upi").style.display="none";
document.getElementById("cod").style.display="none";
document.getElementById("card").style.display="none";
document.getElementById("netbanking").style.display="none";
}

function showUPI(){
hideAll();
document.getElementById("upi").style.display="block";
}

function showCOD(){
hideAll();
document.getElementById("cod").style.display="block";
}

function showCard(){
hideAll();
document.getElementById("card").style.display="block";
}

function showNet(){
hideAll();
document.getElementById("netbanking").style.display="block";
}

function verifyCard(){
alert("✅ Card Verified Successfully");
}

function orderSuccess(){

var orderId = "WFL" + Math.floor(Math.random()*90000 + 10000);

document.getElementById("orderId").innerHTML = orderId;

document.getElementById("popup").style.display="flex";

}

</script>

</head>


<body>

<div class="container">

<h2>✨ Choose Payment Method ✨</h2>

<div class="total">
💰 Total Amount to Pay: ₹<%= total %>
</div>


<div class="section">

<button class="primary" onclick="showUPI()">📱 GPay / PhonePe</button>

<button class="primary" onclick="showCOD()">💵 Cash on Delivery</button>

<button class="primary" onclick="showCard()">💳 Card Payment</button>

<button class="primary" onclick="showNet()">🏦 Net Banking</button>

</div>


<!-- UPI PAYMENT -->

<div id="upi" class="section" style="display:none">

<h3>📸 Scan & Pay</h3>

<img src="images/scanner.jpg" width="200" style="border-radius:20px">

<br><br>

<p>Scan using GPay / PhonePe</p>

<button class="primary" onclick="orderSuccess()">✔ I Have Paid</button>

</div>



<!-- COD -->

<div id="cod" class="section" style="display:none">

<h3>💵 Cash on Delivery</h3>

<p class="extra">⚠ Extra ₹20 delivery charge applied</p>

<div class="total">
Total Payable: ₹<%= total + 20 %>
</div>

<button class="primary" onclick="orderSuccess()">🚚 Confirm Order</button>

</div>


<!-- CARD PAYMENT -->

<div id="card" class="section" style="display:none">

<h3>💳 Card Payment</h3>

<form onsubmit="orderSuccess(); return false;">

<div style="margin-bottom:15px;">
<label>Card Number</label><br>
<input type="text" placeholder="1234 5678 9012 3456" maxlength="16" required style="width:80%;">
</div>

<div style="display:flex; justify-content:center; gap:20px; margin-bottom:15px;">

<div>
<label>Expiry Date</label><br>
<input type="month" required style="width:140px;">
</div>

<div>
<label>CVV</label><br>
<input type="password" placeholder="123" maxlength="3" required style="width:80px;">
</div>

</div>

<button type="button" class="primary" onclick="verifyCard()">
✔ Verify Card
</button>

<br><br>

<button type="submit" class="primary">
🛒 Pay & Order
</button>

</form>

</div>


<!-- NET BANKING -->

<div id="netbanking" class="section" style="display:none">

<h3>🏦 Choose Your Bank</h3>

<a href="https://retail.onlinesbi.sbi/" target="_blank">
<button class="primary">SBI</button>
</a>

<a href="https://netbanking.hdfcbank.com/" target="_blank">
<button class="primary">HDFC</button>
</a>

<a href="https://www.icicibank.com/net-banking" target="_blank">
<button class="primary">ICICI</button>
</a>

<a href="https://retail.axisbank.co.in/" target="_blank">
<button class="primary">AXIS</button>
</a>

<br><br>

<button class="primary" onclick="orderSuccess()">✔ I Have Paid</button>

</div>

</div>


<!-- POPUP CONFIRMATION -->

<div id="popup" class="popup">

<div class="popup-box">

<div class="waffle">🧇</div>

<h3>🧾 Payment Receipt</h3>

<p><b>Order ID:</b> <span id="orderId"></span></p>

<p>✅ Payment Done Successfully</p>

<p>Your delicious waffles are being prepared 😋</p>
<p>⏳ Estimated delivery: 20 minutes</p>


<p>Thank you for ordering from WaffyLand 💖</p>
<a href="receipt.jsp">
<button class="primary">⬇️ Download Receipt</button>
</a>
<br>


<a href="feedback.jsp">
<button class="primary">💖 Give Feedback</button>
</a>

<br>

<a href="home.jsp">
<button class="primary">🏠 Back to Home</button>
</a>

</div>

</div>

</body>
</html>
```
