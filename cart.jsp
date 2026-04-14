<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String username = (String) session.getAttribute("user");

    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    java.util.Map<String, Integer> cart =
        (java.util.Map<String, Integer>) session.getAttribute("cart");

    if (cart == null) {
        cart = new java.util.HashMap<String, Integer>();
    }

    /* ---------- PRICE LIST ---------- */
    java.util.Map<String, Integer> prices = new java.util.HashMap<>();

    // Waffles
    prices.put("Belgian Waffle",120);
    prices.put("Blueberry Waffle",140);
    prices.put("Bubblegum Waffle",130);
    prices.put("Butterscotch Waffle",150);
    prices.put("Coffee Waffle",160);
    prices.put("Honey Waffle",140);
    prices.put("Ice Cream Waffle",180);

    // Pancakes
    prices.put("Banana Pancake",120);
    prices.put("Buttermilk Pancake",130);
    prices.put("Chocolate Chip Pancake",150);
    prices.put("Chocolate Strawberry",170);
    prices.put("Double Chocolate",180);
    prices.put("Double Berry",170);
    prices.put("Double Vanilla",160);
    prices.put("Red Velvet Pancake",190);
    prices.put("Tres Leches Pancake",200);

    // Desserts
    prices.put("Pound Cake",140);
    prices.put("Paczki",150);
    prices.put("Swiss Roll",130);
    prices.put("Sachertorte",200);
    prices.put("Jelly Roll",120);
    prices.put("Foam Cake",160);
    prices.put("Dobos Cake",180);
    prices.put("Date Square",140);
    prices.put("Cup Cake",100);
    prices.put("Battenberg Cake",170);
    prices.put("Angel Cake",190);

    // Shakes
    prices.put("KitKat Shake",199);
    prices.put("Strawberry Shortcake Shake",199);
    prices.put("Banana Cream Pie Shake",199);
    prices.put("Fruity Pebble Shake",199);
    prices.put("Peanut Butter Brownie Shake",219);
    prices.put("S'mores Shake",219);
    prices.put("Mint White Chocolate Shake",199);
    prices.put("Cherry Vanilla Shake",199);
    prices.put("Salted Caramel Pretzel Shake",219);
    // Combo Offers ⭐
prices.put("Waffle Lover Combo",249);
prices.put("Mega Sweet Combo",299);

    /* ---------- CART ACTIONS ---------- */

    String add = request.getParameter("add");
    if (add != null && cart.containsKey(add)) {
        cart.put(add, cart.get(add) + 1);
    }

    String removeOne = request.getParameter("removeOne");
    if (removeOne != null && cart.containsKey(removeOne)) {
        int qty = cart.get(removeOne) - 1;

        if (qty <= 0) {
            cart.remove(removeOne);
        } else {
            cart.put(removeOne, qty);
        }
    }

    String removeAll = request.getParameter("removeAll");
    if (removeAll != null) {
        cart.remove(removeAll);
    }

    session.setAttribute("cart", cart);

    /* ---------- TOTAL CALCULATION ---------- */

    int total = 0;
    int totalItems = 0;

    for (String item : cart.keySet()) {
        int qty = cart.get(item);
        int price = prices.getOrDefault(item, 0);

        total += qty * price;
        totalItems += qty;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>🛒 Your Cart</title>

    <style>
        body{
            font-family:'Segoe UI';
            background:#fff5f8;
            margin:0;
            text-align:center;
        }

        .header{
            background:#ff8c00;
            color:white;
            padding:15px 30px;
            display:flex;
            justify-content:space-between;
            align-items:center;
        }

        .header a{
            color:white;
            text-decoration:none;
            margin-left:15px;
            font-weight:bold;
        }

        .cart-box{
            width:65%;
            margin:40px auto;
            background:white;
            padding:30px;
            border-radius:20px;
            box-shadow:0 8px 20px rgba(0,0,0,0.15);
        }

        table{
            width:100%;
            border-collapse:collapse;
            margin-top:20px;
        }

        th{
            background:#fff0f5;
        }

        th,td{
            padding:12px;
            border-bottom:1px solid #eee;
        }

        button{
            border:none;
            padding:8px 12px;
            border-radius:12px;
            font-size:14px;
            cursor:pointer;
            transition:0.2s;
        }

        button:hover{
            transform:scale(1.08);
        }

        .plus{background:#4caf50;color:white;}
        .minus{background:#ff9800;color:white;}
        .delete{background:#e53935;color:white;}

        .total{
            margin-top:25px;
            font-size:22px;
            font-weight:bold;
            color:#2e7d32;
        }

        .checkout-btn{
            margin-top:20px;
            background:#2e7d32;
            color:white;
            padding:12px 30px;
            border-radius:25px;
            font-size:16px;
        }

        .home-btn{
            background:#ff8c00;
            color:white;
            padding:10px 20px;
            border-radius:20px;
        }
    </style>
</head>

<body>

<div class="header">
    <div style="font-size:22px;font-weight:bold;">
        🧇 WaffyLand
    </div>

    <div>
        Welcome, <%= username %>
        <a href="home.jsp">🏠 Home</a>
        <a href="loginInfo.jsp">📊 Login Info</a>
        🛒 Cart (<%= totalItems %>)
    </div>
</div>

<h1>🧁 Your Sweet Cart 💖</h1>

<div class="cart-box">

<% if(cart.isEmpty()){ %>

    <h2>🥺 Your cart is empty</h2>
    <p>Add some delicious waffles!</p>

    <a href="home.jsp">
        <button class="home-btn">🍩 Browse Menu</button>
    </a>

<% } else { %>

    <table>
        <tr>
            <th>Item</th>
            <th>Price</th>
            <th>Qty</th>
            <th>Subtotal</th>
            <th>Actions</th>
        </tr>

        <% for(String item : cart.keySet()){
            int qty = cart.get(item);
            int price = prices.getOrDefault(item,0);
            int subtotal = qty * price;
        %>

        <tr>
            <td><%= item %></td>
            <td>₹<%= price %></td>
            <td><%= qty %></td>
            <td>₹<%= subtotal %></td>
            <td>
                <a href="cart.jsp?add=<%= item %>">
                    <button class="plus">+</button>
                </a>

                <a href="cart.jsp?removeOne=<%= item %>">
                    <button class="minus">-</button>
                </a>

                <a href="cart.jsp?removeAll=<%= item %>">
                    <button class="delete">❌</button>
                </a>
            </td>
        </tr>

        <% } %>
    </table>

    <div class="total">
        🛍 Items: <%= totalItems %> <br><br>
        💰 Total Amount: ₹<%= total %>
    </div>

    <form action="checkout.jsp">
        <button class="checkout-btn">✅ Proceed to Checkout</button>
    </form>

<% } %>

<br><br>

<a href="home.jsp">
    <button class="home-btn">⬅ Continue Shopping</button>
</a>

</div>

</body>
</html>