<%@ page import="java.io.*,java.util.*,javax.xml.parsers.*,org.w3c.dom.*,javax.xml.transform.*,javax.xml.transform.dom.*,javax.xml.transform.stream.*" %>

<%
String amount = request.getParameter("amount");
String method = request.getParameter("method");

String xmlPath = application.getRealPath("/") + "confirmedOrders.xml";

File xmlFile = new File(xmlPath);

DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
DocumentBuilder builder = factory.newDocumentBuilder();
Document doc = builder.parse(xmlFile);

Element root = doc.getDocumentElement();

/* create new order */

Element order = doc.createElement("order");

Element id = doc.createElement("id");
id.appendChild(doc.createTextNode(String.valueOf(System.currentTimeMillis())));

Element amt = doc.createElement("amount");
amt.appendChild(doc.createTextNode(amount));

Element pay = doc.createElement("payment");
pay.appendChild(doc.createTextNode(method));

Element status = doc.createElement("status");
status.appendChild(doc.createTextNode("Confirmed"));

Element date = doc.createElement("date");
date.appendChild(doc.createTextNode(new Date().toString()));

order.appendChild(id);
order.appendChild(amt);
order.appendChild(pay);
order.appendChild(status);
order.appendChild(date);

root.appendChild(order);

/* save XML */

TransformerFactory tf = TransformerFactory.newInstance();
Transformer transformer = tf.newTransformer();
DOMSource source = new DOMSource(doc);
StreamResult result = new StreamResult(xmlFile);

transformer.transform(source,result);

/* redirect to success page */

response.sendRedirect("orderSuccess.jsp");
%>