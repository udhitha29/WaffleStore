import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Map<String, Integer> cart =
                (Map<String, Integer>) session.getAttribute("cart");

        if (cart == null) {
            cart = new HashMap<>();
        }

        String item = request.getParameter("item");
        String action = request.getParameter("action");

        if (item != null && action != null) {

            switch (action) {

                case "add":
                    cart.put(item, cart.getOrDefault(item, 0) + 1);
                    break;

                case "removeOne":
                    if (cart.containsKey(item)) {
                        int qty = cart.get(item) - 1;
                        if (qty <= 0) {
                            cart.remove(item);
                        } else {
                            cart.put(item, qty);
                        }
                    }
                    break;

                case "removeAll":
                    cart.remove(item);
                    break;
            }
        }

        session.setAttribute("cart", cart);

        response.sendRedirect("cart.jsp");
    }
}
