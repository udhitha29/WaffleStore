<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String userRole = (String)session.getAttribute("userRole");
if(userRole == null || !"admin".equals(userRole)){
    response.sendRedirect("login.jsp");
    return;
}

String message = "";

if("POST".equalsIgnoreCase(request.getMethod())){
    String name = request.getParameter("name");
    String category = request.getParameter("category");
    String price = request.getParameter("price");

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/waffyland?useSSL=false&serverTimezone=UTC",
            "root",
            "udhi.udhu.1"
        );
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO products(name, category, price) VALUES(?,?,?)"
        );
        ps.setString(1, name);
        ps.setString(2, category);
        ps.setDouble(3, Double.parseDouble(price));
        ps.executeUpdate();
        message = "Product added successfully!";
        con.close();
    }catch(Exception e){
        message = e.getMessage();
    }
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Add Product</title>
<style>
body{font-family:Arial; background:#fff0f5;}
.container{max-width:600px;margin:30px auto;padding:20px;background:#fff;border-radius:10px;box-shadow:0 0 10px rgba(0,0,0,0.1);}
input, select, button{width:100%;padding:10px;margin:5px 0;border-radius:5px;border:1px solid #ccc;}
button{background:#ff8c00;color:white;border:none;cursor:pointer;}
button:hover{background:#ff4500;}
a{display:block;margin-top:10px;color:white;background:#ff8c00;padding:10px;text-decoration:none;text-align:center;border-radius:5px;}
a:hover{background:#ff4500;}
.message{color:green;}
</style>
</head>
<body>
<div class="container">
<h2>Add Product</h2>
<form method="post">
<input type="text" name="name" placeholder="Product Name" required>
<select name="category" required>
<option value="">Select Category</option>
<option value="Waffles">Waffles</option>
<option value="Pancakes">Pancakes</option>
<option value="Desserts">Desserts</option>
<option value="Shakes">Shakes</option>
</select>
<input type="number" step="0.01" name="price" placeholder="Price" required>
<button type="submit">Add Product</button>
</form>
<div class="message"><%= message %></div>
<a href="admin_home.jsp">⬅ Back to Dashboard</a>
</div>
</body>
</html>