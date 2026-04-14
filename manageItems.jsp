<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
/* ================= INIT ================= */
Map<String,Integer> items =
(Map<String,Integer>) application.getAttribute("items");

Set<String> deleted =
(Set<String>) application.getAttribute("deleted");

if(items == null){
    items = new LinkedHashMap<>();

    items.put("Belgian Waffle",120);
    items.put("Chocolate Waffle",130);
    items.put("Strawberry Pancake",90);
    items.put("KitKat Shake",199);

    application.setAttribute("items", items);
}

if(deleted == null){
    deleted = new HashSet<>();
    application.setAttribute("deleted", deleted);
}

/* ================= ACTIONS ================= */

// UPDATE
String update = request.getParameter("update");
if(update != null){
    String price = request.getParameter("price_" + update);
    if(price != null && !price.isEmpty()){
        items.put(update, Integer.parseInt(price));
    }
}

// DELETE (hide item)
String delete = request.getParameter("delete");
if(delete != null){
    deleted.add(delete);
}

// ADD NEW ITEM
String add = request.getParameter("add");
if(add != null){
    String newName = request.getParameter("newName");
    String newPrice = request.getParameter("newPrice");

    if(newName != null && !newName.isEmpty() &&
       newPrice != null && !newPrice.isEmpty()){

        items.put(newName, Integer.parseInt(newPrice));
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Items</title>

<style>
body{background:#fff0f5;text-align:center;font-family:'Segoe UI';}

table{
    margin:auto;
    width:80%;
    border-collapse:collapse;
}

th{background:#ffb6c1;}
td,th{padding:10px;border:1px solid #ddd;}

input{
    padding:5px;
    border-radius:10px;
}

button{
    padding:5px 10px;
    border:none;
    border-radius:10px;
    background:#ff69b4;
    color:white;
    cursor:pointer;
}
</style>
</head>

<body>

<h1>🍰 Manage Items 💖</h1>

<!-- ================= TABLE ================= -->
<form method="post">

<table>

<tr>
<th>Name</th>
<th>Price</th>
<th>Update</th>
<th>Delete</th>
</tr>

<%
for(String name : items.keySet()){

    if(deleted.contains(name)) continue; // hide deleted
%>

<tr>
<td><%=name%></td>

<td>
<input type="text" name="price_<%=name%>"
value="<%=items.get(name)%>">
</td>

<td>
<button type="submit" name="update"
value="<%=name%>">Update</button>
</td>

<td>
<button type="submit" name="delete"
value="<%=name%>">Delete</button>
</td>

</tr>

<%
}
%>

</table>

</form>

<br><br>

<!-- ================= ADD NEW ITEM ================= -->

<h3>➕ Add New Item</h3>

<form method="post">
    Name: <input type="text" name="newName" required>
    Price: <input type="text" name="newPrice" required>
    <button type="submit" name="add">Add</button>
</form>

<br>

<a href="admin.jsp"><button>⬅ Back</button></a>

</body>
</html>