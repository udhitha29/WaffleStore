<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<html>
<body style="background:#ffe4ec;text-align:center;font-family:'Segoe UI';">

<h1>🧾 Orders 💖</h1>

<%
    // Order amounts array
    int[] amounts = {399,399,219,340,219,280,479};

    int totalRevenue = 0;

    for(int amt : amounts){
        totalRevenue += amt;
    }
%>

<table border="1" style="margin:auto;">
<tr><th>ID</th><th>Amount</th><th>Status</th><th>Date</th></tr>

<tr><td>1773057564174</td><td>₹399</td><td>✅ Confirmed</td><td>Mar 9</td></tr>
<tr><td>1773057705307</td><td>₹399</td><td>✅ Confirmed</td><td>Mar 9</td></tr>
<tr><td>1773058163179</td><td>₹219</td><td>⏳ Pending</td><td>Mar 9</td></tr>
<tr><td>1773057564174</td><td>₹340</td><td>✅ Confirmed</td><td>Mar 26</td></tr>
<tr><td>1773057564174</td><td>₹219</td><td>✅ Confirmed</td><td>Mar 26</td></tr>
<tr><td>1773057564174</td><td>₹280</td><td>⏳ Pending</td><td>Apr 1</td></tr>
<tr><td>1773057564174</td><td>₹479</td><td>🚚 Delivering</td><td>Apr 1</td></tr>

</table>

<br><br>

<!-- Total Revenue Display -->
<h2 style="color:#d63384;">
    💰 Total Revenue: ₹ <%= totalRevenue %>
</h2>

<br>
<a href="admin.jsp"><button style="padding:10px 20px;background:#ff69b4;color:white;border:none;border-radius:8px;">⬅ Back</button></a>

</body>
</html>