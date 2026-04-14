<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>💬 Feedback Panel</title>

<style>

body{
    font-family:'Segoe UI';
    background:#ffe6f2;
    text-align:center;
}

/* HEADER */
.header{
    background:#ff69b4;
    color:white;
    padding:15px;
}

/* TABLE */
table{
    margin:auto;
    margin-top:30px;
    border-collapse:collapse;
    width:85%;
    background:white;
    border-radius:15px;
    box-shadow:0 8px 20px rgba(0,0,0,0.2);
}

th{
    background:#ff99cc;
    padding:12px;
}

td{
    padding:10px;
}

tr:nth-child(even){
    background:#fff0f5;
}

/* BUTTON */
.btn{
    margin-top:20px;
    padding:10px 20px;
    border:none;
    border-radius:20px;
    background:#ff69b4;
    color:white;
    cursor:pointer;
}

</style>

</head>

<body>

<div class="header">
<h2>💬 Customer Feedback</h2>
</div>

<table border="1">

<tr>
<th>👤 User</th>
<th>🔐 Login</th>
<th>📦 Order Status</th>
<th>💰 Payment</th>
<th>⭐ Rating</th>
<th>💬 Feedback</th>
</tr>

<tr>
<td>udhi</td>
<td>Success</td>
<td>Confirmed</td>
<td>Paid</td>
<td>⭐⭐⭐⭐⭐</td>
<td>Waffles were amazing 😍</td>
</tr>

<tr>
<td>keeru@gmail.com</td>
<td>Success</td>
<td>Delivered</td>
<td>Paid</td>
<td>⭐⭐⭐⭐</td>
<td>Very tasty pancakes 💖</td>
</tr>

<tr>
<td>abhi@gmail.com</td>
<td>Success</td>
<td>Confirmed</td>
<td>Paid</td>
<td>⭐⭐⭐</td>
<td>Good but delivery slow ⏳</td>
</tr>

<tr>
<td>xxx</td>
<td>Success</td>
<td>Delivered</td>
<td>Paid</td>
<td>⭐⭐⭐⭐⭐</td>
<td>Best shakes ever 🥤🔥</td>
</tr>

<tr>
<td>admin</td>
<td>Admin Login</td>
<td>Test Order</td>
<td>Paid</td>
<td>⭐⭐⭐⭐⭐</td>
<td>System working perfectly ✅</td>
</tr>

</table>

<br>

<a href="admin.jsp">
<button class="btn">⬅ Back to Dashboard</button>
</a>

</body>
</html>