<%@ page import="javax.xml.parsers.*,org.w3c.dom.*,javax.xml.transform.*,javax.xml.transform.dom.*,javax.xml.transform.stream.*" %>
<%@ page import="java.io.*,java.util.*" %>

<%
String username = (String) session.getAttribute("user");

Map<String,Integer> cart =
(Map<String,Integer>) session.getAttribute("cart");

if(cart != null && !cart.isEmpty()){

    // PRICE LIST
    Map<String,Integer> prices = new HashMap<>();

    prices.put("Belgian Waffle",120);
    prices.put("Blueberry Waffle",140);
    prices.put("Bubblegum Waffle",130);
    prices.put("Butterscotch Waffle",150);
    prices.put("Coffee Waffle",160);
    prices.put("Honey Waffle",140);
    prices.put("Ice Cream Waffle",180);

    prices.put("Banana Pancake",120);
    prices.put("Buttermilk Pancake",130);
    prices.put("Chocolate Chip Pancake",150);
    prices.put("Chocolate Strawberry",170);
    prices.put("Double Chocolate",180);
    prices.put("Double Berry",170);
    prices.put("Double Vanilla",160);
    prices.put("Red Velvet Pancake",190);
    prices.put("Tres Leches Pancake",200);

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

    prices.put("KitKat Shake",199);
    prices.put("Strawberry Shortcake Shake",199);
    prices.put("Banana Cream Pie Shake",199);
    prices.put("Fruity Pebble Shake",199);
    prices.put("Peanut Butter Brownie Shake",219);
    prices.put("S'mores Shake",219);
    prices.put("Mint White Chocolate Shake",199);
    prices.put("Cherry Vanilla Shake",199);
    prices.put("Salted Caramel Pretzel Shake",219);

    // combos ⭐
    prices.put("Waffle Lover Combo",249);
    prices.put("Mega Sweet Combo",299);

    int total = 0;

    for(String item : cart.keySet()){
        total += cart.get(item) * prices.getOrDefault(item,0);
    }
session.setAttribute("lastOrderTotal", total);
session.setAttribute("lastOrderItems", cart.toString());
session.setAttribute("lastOrderId", System.currentTimeMillis());
    // XML PATH
    String path = application.getRealPath("/orders.xml");
    File file = new File(path);

    Document doc;

    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
    DocumentBuilder builder = factory.newDocumentBuilder();

    if(file.exists()){
        doc = builder.parse(file);
    } else {
        doc = builder.newDocument();
        Element root = doc.createElement("orders");
        doc.appendChild(root);
    }

    Element root = doc.getDocumentElement();

    // NEW ORDER
    Element order = doc.createElement("order");

    Element id = doc.createElement("id");
    id.appendChild(doc.createTextNode(String.valueOf(System.currentTimeMillis())));

    Element amount = doc.createElement("amount");
    amount.appendChild(doc.createTextNode(String.valueOf(total)));

    Element status = doc.createElement("status");
    status.appendChild(doc.createTextNode("Confirmed"));

    Element date = doc.createElement("date");
    date.appendChild(doc.createTextNode(new Date().toString()));

    // ADD
    order.appendChild(id);
    order.appendChild(amount);
    order.appendChild(status);
    order.appendChild(date);

    root.appendChild(order);

    // SAVE
    TransformerFactory tf = TransformerFactory.newInstance();
    Transformer transformer = tf.newTransformer();

    DOMSource source = new DOMSource(doc);
    StreamResult result = new StreamResult(file);

    transformer.transform(source, result);

    // CLEAR CART AFTER ORDER
    session.removeAttribute("cart");
}
%>