import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UpdateItemServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String updateId = request.getParameter("updateId");
        String deleteId = request.getParameter("deleteId");

        try {
            Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/waffle","root","password");

            // ✅ UPDATE PRICE
            if(updateId != null){
                int id = Integer.parseInt(updateId);

                String price = request.getParameter("price_" + id);

                PreparedStatement ps = con.prepareStatement(
                "UPDATE products SET price=? WHERE id=?");

                ps.setInt(1, Integer.parseInt(price));
                ps.setInt(2, id);

                ps.executeUpdate();
            }

            // ❌ DELETE (HIDE ITEM)
            if(deleteId != null){
                int id = Integer.parseInt(deleteId);

                PreparedStatement ps = con.prepareStatement(
                "UPDATE products SET is_active=FALSE WHERE id=?");

                ps.setInt(1, id);
                ps.executeUpdate();
            }

            con.close();

        } catch(Exception e){
            e.printStackTrace();
        }

        response.sendRedirect("manageItems.jsp");
    }
}