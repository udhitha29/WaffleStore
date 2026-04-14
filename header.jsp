
<%@ page contentType="text/html;charset=UTF-8" %>

<%
String username = (String) session.getAttribute("user");
if(username == null){
    response.sendRedirect("login.jsp");
    return;
}

java.util.Map<String,Integer> cart =
    (java.util.Map<String,Integer>) session.getAttribute("cart");

int cartCount = 0;
if(cart != null){
    for(int qty : cart.values()){
        cartCount += qty;
    }
}
%>

<style>
.header {
    background: #ff8c00;
    padding: 15px 30px;
    color: white;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo {
    font-size: 22px;
    font-weight: bold;
}
</style>

<div class="header">

    <div style="display:flex; align-items:center; gap:20px;">
        <div class="logo">🧇 WaffyLand</div>

        <a href="cart.jsp" 
           style="text-decoration:none; color:white; font-size:18px;">
            🛒 Cart (<%= cartCount %>)
        </a>

        <a href="home.jsp" 
           style="color:white; text-decoration:none;">
            🏠 Home
        </a>
    </div>

    <div>
        <%= username %>

        <a href="home.jsp?action=logout" 
           style="color:white;margin-left:15px;">
            🚪 Logout
        </a>
    </div>

</div>