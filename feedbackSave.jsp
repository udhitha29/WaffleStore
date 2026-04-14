<%@ page contentType="text/html;charset=UTF-8" %>

<%
String rating = request.getParameter("rating");
String feedback = request.getParameter("feedback");

if(rating == null || rating.equals("")){
    rating = "Not given";
}
if(feedback == null || feedback.trim().equals("")){
    feedback = "No feedback";
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Thank You 💖</title>

<style>
body{
    font-family:'Segoe UI';
    background:#fff0f5;
    text-align:center;
    padding-top:100px;
}

.box{
    background:white;
    padding:30px;
    width:350px;
    margin:auto;
    border-radius:25px;
}
</style>
</head>

<body>

<div class="box">

<h2>💖 Thank You!</h2>

<p>⭐ Rating: <b><%= rating %></b></p>

<p>💬 "<%= feedback %>"</p>

<br>

<a href="home.jsp">
<button style="background:#ff8c00;color:white;padding:10px 20px;border:none;border-radius:20px;">
🏠 Back to Home
</button>
</a>

</div>

</body>
</html>