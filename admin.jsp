<%@ page contentType="text/html;charset=UTF-8" %>

<%
int totalUsers = 7;
int totalOrders = 7;
int totalItems = 35;

int waffles = 9;
int pancakes = 9;
int desserts = 10;
int shakes = 7;
%>

<html>
<head>
<title>💖 Admin Dashboard</title>

<style>
body{
    font-family:'Segoe UI';
    background:linear-gradient(to right,#ffe4ec,#fff0f5);
    text-align:center;
}

/* HEADER */
.header{
    background:#ff69b4;
    color:white;
    padding:15px;
    display:flex;
    justify-content:space-between;
}

/* CARDS */
.card{
    display:inline-block;
    background:white;
    padding:20px;
    margin:15px;
    border-radius:25px;
    width:200px;
    box-shadow:0 8px 20px rgba(0,0,0,0.2);
    transition:0.3s;
}

.card:hover{
    transform:scale(1.05);
}

.big{
    font-size:28px;
    color:#ff1493;
    font-weight:bold;
}

/* BUTTONS */
.btn{
    padding:10px 20px;
    border:none;
    border-radius:25px;
    background:#ff69b4;
    color:white;
    margin:10px;
    cursor:pointer;
}
</style>
</head>

<body>

<div class="header">
    <h2>🍩 WaffyLand Admin</h2>
    <a href="logout.jsp"><button class="btn">🚪 Logout</button></a>
</div>

<h1>💖 Dashboard</h1>

<div class="card">👤 Users<br><div class="big"><%= totalUsers %></div></div>
<div class="card">🧾 Orders<br><div class="big"><%= totalOrders %></div></div>
<div class="card">🍰 Items<br><div class="big"><%= totalItems %></div></div>

<br>

<div class="card">🧇 Waffles<br><div class="big"><%= waffles %></div></div>
<div class="card">🥞 Pancakes<br><div class="big"><%= pancakes %></div></div>
<div class="card">🍮 Desserts<br><div class="big"><%= desserts %></div></div>
<div class="card">🥤 Shakes<br><div class="big"><%= shakes %></div></div>
<div class="card">
💬 Feedback  
<br>
<div class="big">5</div>
</div>

<br><br>

<a href="users.jsp"><button class="btn">👤 Users</button></a>
<a href="order.jsp"><button class="btn">🧾 Orders</button></a>
<a href="manageItems.jsp"><button class="btn">🍰 Manage Items</button></a>
<a href="adminFeedback.jsp">
<button class="btn">💬 View Feedback</button>
</a>

</body>
</html>