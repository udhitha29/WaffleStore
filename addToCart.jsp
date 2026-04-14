<%@ page import="java.util.*" %>

<%
    // Get item from request
    String item = request.getParameter("item");

    // Get cart from session
    Map<String, Integer> cart =
        (Map<String, Integer>) session.getAttribute("cart");

    // If cart doesn't exist, create new
    if (cart == null) {
        cart = new HashMap<>();
    }

    // Add item to cart
    if (item != null) {
        int qty = cart.getOrDefault(item, 0);
        cart.put(item, qty + 1);
    }

    // Save back to session
    session.setAttribute("cart", cart);

    // Redirect back to previous page
    response.sendRedirect(request.getHeader("referer"));
%>