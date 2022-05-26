<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*,java.net.*,org. w3c.dom.*,javax.xml.parsers.DocumentBuilder,javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.ParserConfigurationException"%><html>
<html>
<head>
<style>
table,th,td{
border:1px solid black;
border-collapse:collapse;
}
</style>
</head>
<body link="#000000" vlink="#000000" alink="#ff0000">

<table cellspacing=1 width=600 border=1>
<tr>
<td width=50 align=center border-color=#0054FF border="2"> <font size = "4" color="#000000">
후보등록</a></td>
<td width=50 align=center> <font size = "4" color="#000000">
투표</a></td>
<td width=50 align=center bgcolor=#FFFF24> <font size = "4" color="#000000">
<a href="http://192.168.23.97:8082/ch6/ReportAll.jsp" style="text-decoration:none">개표결과</a></td>
</tr>
</table>
<%
String id = request.getParameter("key");

DocumentBuilder docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
Document doc = docBuilder.parse("http://192.168.23.97:8081/ch6/hubo/ReportOne.jsp?key="+id);

Element root =doc.getDocumentElement();
NodeList tag_001= doc.getElementsByTagName("data");

String age="";
String count="";
String per="";


%>

<table cellspacing=1 width=600  border=1 style="font-size:20;">

<%

for(int i =0; i < tag_001.getLength(); i++){
	Element elmt = (Element)tag_001.item(i);
	
	age = elmt.getElementsByTagName("age").item(0).getFirstChild().getNodeValue();
	count = elmt.getElementsByTagName("count").item(0).getFirstChild().getNodeValue();
	per = elmt.getElementsByTagName("per").item(0).getFirstChild().getNodeValue();
	
	
	
	out.println("<td align=center>"+age+"0대</td>"+
				"<td ><img src='bar.jpg' width= "+per+" height=20>"+ count+"표 ( "+per+"%)</td></tr>");
	

}
%>	
</table>
</html>  
