<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>💖 Feedback</title>

<style>
body{
    font-family:'Segoe UI';
    background:#ffe6f2;
    text-align:center;
}

.box{
    width:40%;
    margin:80px auto;
    background:white;
    padding:30px;
    border-radius:25px;
    box-shadow:0 10px 25px rgba(0,0,0,0.2);
}

h2{
    color:#ff3399;
}

textarea{
    width:90%;
    height:100px;
    border-radius:15px;
    padding:10px;
    border:1px solid #ccc;
}

button{
    background:#ff8c00;
    color:white;
    padding:10px 25px;
    border:none;
    border-radius:20px;
    cursor:pointer;
    margin-top:15px;
}

.star{
    font-size:25px;
    cursor:pointer;
}

</style>

<script>
function setRating(val){
    document.getElementById("rating").value = val;
}
</script>

</head>

<body>

<div class="box">

<h2>💖 Give Your Feedback 💖</h2>

<form action="feedbackSave.jsp" method="post">

<!-- ⭐ STARS -->
<div>
<span class="star" onclick="setRating(1)">⭐</span>
<span class="star" onclick="setRating(2)">⭐</span>
<span class="star" onclick="setRating(3)">⭐</span>
<span class="star" onclick="setRating(4)">⭐</span>
<span class="star" onclick="setRating(5)">⭐</span>
</div>

<input type="hidden" name="rating" id="rating">

<br>

<textarea name="feedback" placeholder="💬 Write your sweet experience..."></textarea>

<br>

<button type="submit">💖 Submit Feedback</button>

</form>

<br>

<a href="home.jsp">
<button>🏠 Back to Home</button>
</a>

</div>

</body>
</html>