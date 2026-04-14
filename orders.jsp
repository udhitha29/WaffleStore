<%@ page import="javax.xml.parsers.*,org.w3c.dom.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>📜 Orders</title>

<style>
body{
    font-family:'Segoe UI';
    background:#ffe6f2;
    text-align:center;
}

h1{
    color:#ff3399;
}

.revenue{
    font-size:30px;
    font-weight:bold;
    color:#2e7d32;
    margin:20px;
}

table{
    margin:auto;
    border-collapse:collapse;
    width:80%;
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

.backBtn{
    margin-top:30px;
    padding:12px 25px;
    background:#ff8c00;
    color:white;
    border:none;
    border-radius:25px;
    cursor:pointer;
}
</style>
</head>

<body>

<h1>💖 Order History 💖</h1>

<%
String path = "C:/orders.xml";

int totalRevenue = 0;

try{

DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
DocumentBuilder builder = factory.newDocumentBuilder();

Document doc = builder.parse(new File(path));

NodeList list = doc.getElementsByTagName("order");
%>

<div class="revenue">
💰 Total Revenue: ₹ 
<%
for(int i=0;i<list.getLength();i++){

    Element order = (Element)list.item(i);

    String amount = "0";

    if(order.getElementsByTagName("amount").getLength() > 0){
        amount = order.getElementsByTagName("amount").item(0).getTextContent();
    }
    else if(order.getElementsByTagName("price").getLength() > 0){
        amount = order.getElementsByTagName("price").item(0).getTextContent();
    }

    totalRevenue += Integer.parseInt(amount);
}

out.print(totalRevenue);
%>
</div>

<table border="1">

<tr>
<th>📦 Order ID</th>
<th>🍽 Item</th>
<th>💰 Amount</th>
<th>📌 Status</th>
<th>📅 Date</th>
</tr>

<%
for(int i=0;i<list.getLength();i++){

    Element order = (Element)list.item(i);

    String id="---", item="Waffle Combo", amount="0", status="Confirmed", date="---";

    if(order.getElementsByTagName("id").getLength()>0)
        id = order.getElementsByTagName("id").item(0).getTextContent();

    if(order.getElementsByTagName("item").getLength()>0)
        item = order.getElementsByTagName("item").item(0).getTextContent();

    if(order.getElementsByTagName("amount").getLength()>0)
        amount = order.getElementsByTagName("amount").item(0).getTextContent();
    else if(order.getElementsByTagName("price").getLength()>0)
        amount = order.getElementsByTagName("price").item(0).getTextContent();

    if(order.getElementsByTagName("status").getLength()>0)
        status = order.getElementsByTagName("status").item(0).getTextContent();

    if(order.getElementsByTagName("date").getLength()>0)
        date = order.getElementsByTagName("date").item(0).getTextContent();
%>

<tr>
<td><%= id %></td>
<td>🍽 <%= item %></td>
<td>₹<%= amount %></td>
<td><%= status %></td>
<td><%= date %></td>
</tr>

<%
}
%>

</table>

<%
}catch(Exception e){
    out.println("<h3 style='color:red;'>Error: "+e.getMessage()+"</h3>");
}
%>

<br>

<a href="home.jsp">
<button class="backBtn">⬅ Back to Home</button>
</a>

</body>
</html>