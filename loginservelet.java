package com.waffystore;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "SELECT id FROM users WHERE username=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("id");
                HttpSession session = request.getSession();
                session.setAttribute("userId", userId);
                session.setAttribute("username", username);

                // Record the visit
                PreparedStatement visitStmt = conn.prepareStatement(
                        "INSERT INTO visits(user_id) VALUES(?)");
                visitStmt.setInt(1, userId);
                visitStmt.executeUpdate();

                response.sendRedirect("dashboard.jsp");
            } else {
                response.sendRedirect("login.jsp?msg=invalid");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?msg=error");
        }
    }
}