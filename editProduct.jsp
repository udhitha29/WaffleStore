<%@ page import="java.sql.*,db.database" %>

<%
int id = Integer.parseInt(request.getParameter("id"));
Connection con = database.getConnection();

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM products WHERE id=?"
);
ps.setInt(1,id);
ResultSet rs = ps.executeQuery();
rs.next();
%>

<html>
<body style="text-align:center;background:#ffe4ec;">

<h2>✏ Edit Product 💖</h2>

<form action="updateProduct.jsp">
<input type="hidden" name="id" value="<%= id %>">

Name: <input type="text" name="name" value="<%= rs.getString("name") %>"><br><br>

Price: <input type="number" name="price" value="<%= rs.getInt("price") %>"><br><br>

Toppings: <input type="text" name="toppings"><br><br>

Extra Cream: <input type="checkbox" name="cream"><br><br>

<button>💾 Update</button>

</form>

</body>
</html>