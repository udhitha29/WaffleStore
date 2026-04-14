<%@ page session="true" %>
<%
if(!"admin".equals(session.getAttribute("userRole"))){
    response.sendRedirect("login.jsp");
    return;
}
String username = (String)session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
<style>
body { font-family: Arial; background:#fff0f5; }
.container { max-width:600px; margin:50px auto; background:#fff; padding:20px; border-radius:10px; box-shadow:0 0 10px rgba(0,0,0,0.1);}
a { display:block; margin:10px 0; padding:10px; background:#ff8c00; color:white; text-decoration:none; border-radius:5px; text-align:center;}
a:hover { background:#ff4500; }
</style>
</head>
<body>
<div class="container">
<h2>Welcome Admin, <%= username %></h2>
<a href="view_orders.jsp">📜 View Orders</a>
<a href="add_product.jsp">➕ Add Products</a>
<a href="view_users.jsp">👥 View Users</a>
<a href="logout.jsp">🚪 Logout</a>
</div>
</body>
</html>