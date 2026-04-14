<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String username = (String)session.getAttribute("user");

if(username==null){
response.sendRedirect("login.jsp");
return;
}

Integer visitCount = (Integer) session.getAttribute("visitCount");
Date lastVisit = (Date) session.getAttribute("lastVisit");

if(visitCount==null){
visitCount=1;
}else{
visitCount++;
}

session.setAttribute("visitCount",visitCount);

Date currentVisit=new Date();
session.setAttribute("lastVisit",currentVisit);

String sessionId=session.getId();

Map<String,Integer> cart=(Map<String,Integer>)session.getAttribute("cart");

int totalItems=0;

if(cart!=null){
for(int q:cart.values()){
totalItems+=q;
}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WaffyLand</title>

<style>

body{
margin:0;
font-family:Segoe UI;
background:linear-gradient(rgba(255,228,225,0.9),rgba(255,240,245,0.9)),url("images/homeim.jpg");
background-size:cover;
}

.header{
background:#ff8c00;
padding:15px 30px;
display:flex;
justify-content:space-between;
align-items:center;
color:white;
}

.logo{
font-size:26px;
font-weight:bold;
}

.menu{
display:flex;
align-items:center;
gap:18px;
}

.menu a{
text-decoration:none;
color:white;
font-weight:bold;
padding:6px 12px;
border-radius:10px;
transition:0.3s;
}

.menu a:hover{
background:rgba(255,255,255,0.2);
}

.welcome{
font-weight:bold;
}

.search{
padding:7px 12px;
border-radius:20px;
border:none;
outline:none;
}

.searchBtn{
background:white;
border:none;
padding:6px 10px;
border-radius:50%;
cursor:pointer;
}

.logout{
background:#ff4d4d;
padding:6px 12px;
border-radius:15px;
}

.logout:hover{
background:#e60000;
}

.xml{
background:#ff69b4;
padding:6px 12px;
border-radius:15px;
}

.xml:hover{
background:#ff3ca6;
}

.hero{
text-align:center;
padding:40px;
color:#333;
}

.hero h1{
font-size:40px;
}

.categories{
display:flex;
justify-content:center;
gap:40px;
flex-wrap:wrap;
margin-top:30px;
}

.card{
width:250px;
background:white;
border-radius:20px;
box-shadow:0 8px 20px rgba(0,0,0,0.2);
overflow:hidden;
text-align:center;
transition:0.3s;
}

.card:hover{
transform:scale(1.05);
}

.card img{
width:100%;
height:180px;
object-fit:cover;
}

.card h3{
padding:15px;
}

/* CHAT ICON */

#chatIcon{
position:fixed;
bottom:20px;
right:20px;
font-size:28px;
background:#ff8c00;
color:white;
width:50px;
height:50px;
display:flex;
align-items:center;
justify-content:center;
border-radius:50%;
cursor:pointer;
box-shadow:0 5px 10px rgba(0,0,0,0.3);
}

/* CHAT BOX */

#chatbot{
position:fixed;
bottom:80px;
right:20px;
width:250px;
background:white;
border-radius:15px;
box-shadow:0 5px 15px rgba(0,0,0,0.3);
font-family:Segoe UI;
overflow:hidden;
display:none;
}

#chatHeader{
background:#ff8c00;
color:white;
padding:10px;
text-align:center;
font-weight:bold;
}

#chatBody{
height:200px;
overflow-y:auto;
padding:10px;
font-size:14px;
background:#fff5f8;
}

#chatInput{
display:flex;
border-top:1px solid #eee;
}

#chatInput input{
flex:1;
border:none;
padding:8px;
outline:none;
}

#chatInput button{
background:#ff8c00;
border:none;
color:white;
padding:8px 10px;
cursor:pointer;
}

</style>
</head>

<body>

<div class="header">

<div class="logo">🧇 WaffyLand</div>

<div class="menu">

<span class="welcome">👋 Welcome, <%=username%></span>

<a href="loginInfo.jsp">📊 Login Info</a>

<form action="search.jsp" method="get" style="display:flex;gap:5px;align-items:center;">
<input type="text" name="keyword" class="search" placeholder="🔎 Search waffles, pancakes...">
<button type="submit" class="searchBtn">🔍</button>
</form>

<a href="confirmedOrders.xml" class="xml">📦 Orders</a>

<a href="cart.jsp">🛒 Cart (<%=totalItems%>)</a>

<a href="login.jsp?action=logout" class="logout">🚪 Logout</a>

</div>
</div>

<div class="hero">
<h1>Fluffy Waffles & Creamy Pancakes 🥞</h1>
<p>Sweet happiness delivered fresh to your door 💕</p>
</div>

<h2 style="text-align:center">Explore Categories</h2>

<div class="categories">

<a href="waffles.jsp">
<div class="card">
<img src="images/fruity.jpg">
<h3>🧇 Waffles</h3>
</div>
</a>

<a href="pancakes.jsp">
<div class="card">
<img src="images/panake.jpg">
<h3>🥞 Pancakes</h3>
</div>
</a>

<a href="desserts.jsp">
<div class="card">
<img src="images/desserts.jpg">
<h3>🍰 Desserts</h3>
</div>
</a>

<a href="shakes.jsp">
<div class="card">
<img src="images/milkshakes.jpg">
<h3>🥤 Shakes</h3>
</div>
</a>

</div>

<!-- COMBO OFFERS -->

<h2 style="text-align:center;margin-top:60px;font-size:32px;color:#ff69b4;">
🎉 Sweet Combo Offers 🎉
</h2>

<div style="display:flex;justify-content:center;gap:40px;flex-wrap:wrap;margin-top:30px;padding-bottom:80px;">

<div style="width:260px;background:white;border-radius:20px;box-shadow:0 8px 20px rgba(0,0,0,0.2);text-align:center;">
<img src="images/Gemini_Generated_Image_76oomm76oomm76oo.png" style="width:100%;height:180px;object-fit:cover;">
<h3>🧇 Waffle Lover Combo</h3>
<p style="font-weight:bold;color:#ff8c00;">₹249</p>

<a href="addToCart.jsp?item=Waffle Lover Combo">
<button style="background:#ff8c00;border:none;color:white;padding:10px 20px;border-radius:15px;cursor:pointer;">
🛒 Add to Cart
</button>
</a>

</div>

<div style="width:260px;background:white;border-radius:20px;box-shadow:0 8px 20px rgba(0,0,0,0.2);text-align:center;">
<img src="images/Gemini_Generated_Image_4duafb4duafb4dua.png" style="width:100%;height:180px;object-fit:cover;">
<h3>🥞 Mega Sweet Combo</h3>
<p style="font-weight:bold;color:#ff8c00;">₹299</p>

<a href="addToCart.jsp?item=Mega Sweet Combo">
<button style="background:#ff8c00;border:none;color:white;padding:10px 20px;border-radius:15px;cursor:pointer;">
🛒 Add to Cart
</button>
</a>

</div>

</div>

<!-- CHATBOT -->

<div id="chatIcon" onclick="toggleChat()">💬</div>

<div id="chatbot">

<div id="chatHeader">🤖 WaffyBot</div>

<div id="chatBody">
<p><b>Bot:</b> Hello <%=username%> 👋 Ask me about menu, prices or cart!</p>
</div>

<div id="chatInput">
<input id="userMsg" placeholder="Ask something...">
<button onclick="startVoice()">🎤</button>
<button onclick="sendMsg()">➤</button>
</div>

</div>

<script>

function toggleChat(){
var box=document.getElementById("chatbot");
box.style.display = box.style.display==="block" ? "none" : "block";
}

function sendMsg(){

var input=document.getElementById("userMsg");
var msg=input.value.toLowerCase();
var chat=document.getElementById("chatBody");

chat.innerHTML+="<p><b>You:</b> "+msg+"</p>";

var reply="Sorry <%=username%> 🤔 I didn't understand.";

if(msg.includes("waffle")){
reply="🧇 Waffles: Belgian ₹120, Blueberry ₹140, Bubblegum ₹150.";
}
else if(msg.includes("pancake")){
reply="🥞 Pancakes: Banana ₹110, Buttermilk ₹120, Chocolate Chip ₹130.";
}
else if(msg.includes("desserts")){
reply="🥞 desserts: swiss roll ₹110, dobos ₹120, date square ₹130.";
}
else if(msg.includes("shakes")){
reply="🥞 shakes: Bananashake ₹110, strawberry shake ₹120, nutshake ₹130.";
}
else if(msg.includes("hi")){
reply="🥞 hello Udhi welcome to waffyland";
}
else if(msg.includes("belgian")){
reply="🥞 Belgian waffle ₹150";
}
else if(msg.includes("dobos")){
reply="🥞 dobos dessert ₹130";
}
else if(msg.includes("blueberry")){
reply="🥞 Blueberry waffle ₹180";
}

else if(msg.includes("cart")){
reply="🛒 Your cart items: <%= (cart!=null && !cart.isEmpty()) ? cart.toString() : "Cart is empty" %>";
}

chat.innerHTML+="<p><b>Bot:</b> "+reply+"</p>";

chat.scrollTop=chat.scrollHeight;
input.value="";
}

function startVoice(){

var recognition=new(window.SpeechRecognition || window.webkitSpeechRecognition)();
recognition.lang="en-US";

recognition.onresult=function(event){
var voiceText=event.results[0][0].transcript;
document.getElementById("userMsg").value=voiceText;
sendMsg();
};

recognition.start();

}

</script>

</body>
</html>