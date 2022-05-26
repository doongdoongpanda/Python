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
후보등록</td>
<td width=50 align=center> <font size = "4" color="#000000">
투표</td>
<td width=50 align=center bgcolor=#FFFF24> <font size = "4" color="#000000">
개표결과</td>
</tr>
</table>

<%
DocumentBuilder docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
Document doc = docBuilder.parse("http://192.168.23.97:8081/ch6/hubo/ReportAll.jsp");

Element root =doc.getDocumentElement();
NodeList tag_001= doc.getElementsByTagName("data");


String name="";
String id="";
String count_Id="";
String count_All="";
String bar="";
String pyo="";
String ratio="";
int barInt = 0;


%>
<!--막대그래프그리기-->
<table cellspacing=1 width=600  border=1 style="font-size:20;">
<%
//개표결과

for(int i =0; i < tag_001.getLength(); i++){
	Element elmt = (Element)tag_001.item(i);
	
	
	name = elmt.getElementsByTagName("name").item(0).getFirstChild().getNodeValue();
	id = elmt.getElementsByTagName("id").item(0).getFirstChild().getNodeValue();
	count_Id = elmt.getElementsByTagName("count_Id").item(0).getFirstChild().getNodeValue();
	count_All = elmt.getElementsByTagName("count_All").item(0).getFirstChild().getNodeValue();
	bar = elmt.getElementsByTagName("bar").item(0).getFirstChild().getNodeValue();
	pyo = elmt.getElementsByTagName("pyo").item(0).getFirstChild().getNodeValue();
	ratio = elmt.getElementsByTagName("ratio").item(0).getFirstChild().getNodeValue();
	
	
	out.println("<tr height = 50><td width=200><p align=center><a href='UIReportOne.jsp?key="+id+"&name="+name+"'>"+id+name+"</p></td>");
	out.println("<td width=400><img src='bar.jpg' width="+bar+" height=20>" +pyo+ "("+ ratio+"%)</td></tr>");

}

%>
</table>
</body>
</html>