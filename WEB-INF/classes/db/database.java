import java.sql.*;

public class database {
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/wafflestore",
                "root",
                "udhi.udhu.1"
            );
        } catch(Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}