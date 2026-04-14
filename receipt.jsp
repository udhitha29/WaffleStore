<%@ page contentType="text/plain;charset=UTF-8" %>

<%
String username = (String)session.getAttribute("user");

Object total = session.getAttribute("lastOrderTotal");
Object items = session.getAttribute("lastOrderItems");
Object orderId = session.getAttribute("lastOrderId");

response.setHeader("Content-Disposition","attachment; filename=receipt.txt");
%>

********** WAFFYLAND RECEIPT **********

🧇 Thank you for your order!

👤 Customer: <%= username %>
🆔 Order ID: <%= orderId %>

🛒 Items:
<%= items %>

💰 Total Paid: ₹<%= total %>

📅 Date: <%= new java.util.Date() %>

--------------------------------------
💖 Visit Again - WaffyLand 💖