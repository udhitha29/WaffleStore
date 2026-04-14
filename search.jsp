<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
Map<String,Integer> cart = (Map<String,Integer>)session.getAttribute("cart");

int totalItems = 0;

if(cart != null){
    for(int q : cart.values()){
        totalItems += q;
    }
}
%>

<%
class Item{
String name;
int price;
String category;

Item(String n,int p,String c){
name=n;
price=p;
category=c;
}
}

List<Item> items=new ArrayList<>();

// WAFFLES
items.add(new Item("Belgian Waffle",120,"waffle"));
items.add(new Item("Blueberry Waffle",140,"waffle"));
items.add(new Item("Bubblegum Waffle",130,"waffle"));
items.add(new Item("Butterscotch Waffle",150,"waffle"));
items.add(new Item("Coffee Waffle",160,"waffle"));
items.add(new Item("Honey Waffle",140,"waffle"));
items.add(new Item("Ice Cream Waffle",180,"waffle"));

// PANCAKES
items.add(new Item("Banana Pancake",120,"pancake"));
items.add(new Item("Buttermilk Pancake",130,"pancake"));
items.add(new Item("Chocolate Chip Pancake",150,"pancake"));
items.add(new Item("Chocolate Strawberry",170,"pancake"));
items.add(new Item("Double Chocolate",180,"pancake"));
items.add(new Item("Double Berry",170,"pancake"));
items.add(new Item("Double Vanilla",160,"pancake"));
items.add(new Item("Red Velvet Pancake",190,"pancake"));
items.add(new Item("Tres Leches Pancake",200,"pancake"));

// DESSERTS
items.add(new Item("Pound Cake",140,"dessert"));
items.add(new Item("Paczki",150,"dessert"));
items.add(new Item("Swiss Roll",130,"dessert"));
items.add(new Item("Sachertorte",200,"dessert"));
items.add(new Item("Jelly Roll",120,"dessert"));
items.add(new Item("Foam Cake",160,"dessert"));
items.add(new Item("Dobos Cake",180,"dessert"));
items.add(new Item("Date Square",140,"dessert"));
items.add(new Item("Cup Cake",100,"dessert"));
items.add(new Item("Battenberg Cake",170,"dessert"));
items.add(new Item("Angel Cake",190,"dessert"));

// SHAKES
items.add(new Item("KitKat Shake",199,"shake"));
items.add(new Item("Strawberry Shortcake Shake",199,"shake"));
items.add(new Item("Banana Cream Pie Shake",199,"shake"));
items.add(new Item("Fruity Pebble Shake",199,"shake"));
items.add(new Item("Peanut Butter Brownie Shake",219,"shake"));
items.add(new Item("S'mores Shake",219,"shake"));
items.add(new Item("Mint White Chocolate Shake",199,"shake"));
items.add(new Item("Cherry Vanilla Shake",199,"shake"));
items.add(new Item("Salted Caramel Pretzel Shake",219,"shake"));

String keyword=request.getParameter("keyword");
String category=request.getParameter("category");

if(keyword==null) keyword="";
if(category==null) category="";
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Search Menu</title>

<style>

body{
font-family:Segoe UI;
background:#fff5f8;
margin:0;
text-align:center;
}

/* TOP BAR */

.topbar{
background:#ff8c00;
color:white;
padding:15px 30px;
display:flex;
justify-content:space-between;
align-items:center;
}

.topbar a{
color:white;
text-decoration:none;
font-weight:bold;
margin-left:15px;
}

.logo{
font-size:22px;
font-weight:bold;
}

/* SEARCH AREA */

.header{
background:#87CEEB;
padding:20px;
}

.searchBox{
padding:8px 12px;
border-radius:20px;
border:none;
width:220px;
}

select{
padding:7px;
border-radius:10px;
border:none;
}

button{
padding:7px 12px;
border:none;
border-radius:15px;
background:#ff8c00;
color:white;
cursor:pointer;
}

/* MENU */

.menu{
width:65%;
margin:auto;
margin-top:30px;
background:white;
border-radius:20px;
padding:20px;
box-shadow:0 5px 15px rgba(0,0,0,0.2);
}

.item{
display:flex;
justify-content:space-between;
padding:12px;
border-bottom:1px solid #eee;
align-items:center;
}

.price{
color:#ff3399;
font-weight:bold;
}

.cartBtn{
background:#66ccff;
}

.back{
margin-top:25px;
background:#87CEEB;
}

</style>

<script>
function added(){
alert("🛒 Added to Cart!");
}
</script>

</head>

<body>

<!-- TOP BAR -->

<div class="topbar">

<div class="logo">
🧇 WaffyLand Search
</div>

<div>
<a href="home.jsp">🏠 Home</a>
<a href="cart.jsp">🛒 Cart (<%=totalItems%>)</a>
</div>

</div>

<!-- SEARCH AREA -->

<div class="header">

<form method="get">

<input class="searchBox" name="keyword"
placeholder="🔎 Search food..."
value="<%=keyword%>">

<select name="category">

<option value="">All Categories</option>

<option value="waffle" <%=category.equals("waffle")?"selected":""%>>🧇 Waffles</option>

<option value="pancake" <%=category.equals("pancake")?"selected":""%>>🥞 Pancakes</option>

<option value="dessert" <%=category.equals("dessert")?"selected":""%>>🍰 Desserts</option>

<option value="shake" <%=category.equals("shake")?"selected":""%>>🥤 Shakes</option>

</select>

<button type="submit">Search</button>

</form>

</div>

<!-- MENU RESULTS -->

<div class="menu">

<h2>🍓 Menu Items</h2>

<%

for(Item i:items){

boolean matchKeyword =
i.name.toLowerCase().contains(keyword.toLowerCase()) ||
i.category.toLowerCase().contains(keyword.toLowerCase());

boolean matchCategory =
category.equals("") || i.category.equals(category);

if(matchKeyword && matchCategory){

%>

<div class="item">

<span>

<%
if(i.category.equals("waffle")) out.print("🧇 ");
else if(i.category.equals("pancake")) out.print("🥞 ");
else if(i.category.equals("dessert")) out.print("🍰 ");
else if(i.category.equals("shake")) out.print("🥤 ");
%>

<%=i.name%>

</span>

<span class="price">₹<%=i.price%></span>

<form action="addToCart.jsp" method="post" onsubmit="added()">

<input type="hidden" name="item" value="<%=i.name%>">

<button class="cartBtn">🛒 Add to Cart</button>

</form>

</div>

<%
}
}
%>

</div>

<br>

<a href="home.jsp">
<button class="back">🏠 Back to Home</button>
</a>

</body>
</html>