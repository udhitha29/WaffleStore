<%@ page import="java.sql.*,db.database" %>

<%
int id = Integer.parseInt(request.getParameter("id"));
String name = request.getParameter("name");
int price = Integer.parseInt(request.getParameter("price"));

Connection con = database.getConnection();

PreparedStatement ps = con.prepareStatement(
"UPDATE products SET name=?, price=? WHERE id=?"
);

ps.setString(1,name);
ps.setInt(2,price);
ps.setInt(3,id);

ps.executeUpdate();

response.sendRedirect("manageProducts.jsp");
%>