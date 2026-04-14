<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Waffle Store</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;

            /* FULL BACKGROUND IMAGE */
            background: url('images/home1.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .navbar {
            display: flex;
            justify-content: center;
            gap: 30px;
            padding: 20px;
            font-weight: bold;
            background: rgba(255,255,255,0.7); /* transparent white */
        }

        .navbar a {
            text-decoration: none;
            color: black;
        }

        .btn {
            padding: 10px 20px;
            background-color: orange;
            color: white;
            border-radius: 20px;
        }

        /* CENTER BUTTON */
        .center {
            height: 80vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .order-btn {
            font-size: 20px;
            padding: 15px 30px;
            background-color: orange;
            color: white;
            border-radius: 30px;
            text-decoration: none;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <a href="front.jsp">HOME</a>
    <a href="#">CATALOG</a>
    <a href="#">ABOUT</a>
    <a href="#">CONTACT</a>

    <a href="login.jsp" class="btn">Login</a>
    <a href="signup.jsp" class="btn">Sign Up</a>
</div>

<!-- CENTER BUTTON ONLY -->
<div class="center">
    <a href="login.jsp" class="order-btn">Order Now</a>
</div>

</body>
</html>