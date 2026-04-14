<%@ page contentType="text/html; charset=UTF-8" %>

<%
String keyword=request.getParameter("keyword");
String category=request.getParameter("category");

class Item{
String name,cat,img;
int price;
Item(String n,String c,String i,int p){
name=n;cat=c;img=i;price=p;
}
}

Item[] items={

new Item("Classic Waffle","waffle","images/waffle1.jpg",120),
new Item("Chocolate Waffle","waffle","images/waffle2.jpg",150),
new Item("Blueberry Pancake","pancake","images/pancake.jpg",130),
new Item("Ice Cream Dessert","dessert","images/dessert.jpg",180),
new Item("Strawberry Shake","shake","images/shake.jpg",110)

};

for(Item i:items){

if((keyword==null||i.name.toLowerCase().contains(keyword.toLowerCase())) &&
(category==null||category.equals("")||i.cat.equals(category))){
%>

<div class="card">

<img src="<%=i.img%>">

<h4><%=i.name%></h4>

<p>₹<%=i.price%></p>

<button class="addBtn" onclick="addToCart('<%=i.name%>')">Add to Cart</button>

</div>

<%
}
}
%>