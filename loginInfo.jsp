<%@ page session="true" %>
<%@ page import="java.util.*" %>

<%
String username=(String)session.getAttribute("user");

Integer visitCount=(Integer)session.getAttribute("visitCount");
Date lastVisit=(Date)session.getAttribute("lastVisit");

String sessionId=session.getId();
%>

<html>
<head>

<title>Login Info</title>

<style>

body{
font-family:Segoe UI;
background:#111;
color:white;
display:flex;
justify-content:center;
align-items:center;
height:100vh;
}

.box{
background:#ff8c00;
padding:40px;
border-radius:20px;
width:400px;
text-align:center;
}

.info{
background:white;
color:black;
padding:20px;
border-radius:10px;
margin-top:20px;
}

.btn{
margin-top:20px;
background:black;
color:white;
padding:10px 20px;
border-radius:20px;
text-decoration:none;
}

</style>

</head>

<body>

<div class="box">

<h2>Login Details</h2>

<div class="info">

<p><b>User:</b> <%=username%></p>

<p><b>Total Visits:</b> <%=visitCount%></p>

<p><b>Last Visit:</b> <%=lastVisit%></p>

<p><b>Session ID:</b> <%=sessionId%></p>

</div>

<a class="btn" href="home.jsp">⬅ Back to Home</a>

</div>

</body>
</html>