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
<a href="http://192.168.23.97:8082/chartnew/vote_chart.jsp" style="text-decoration:none">개표결과</a></td>
</tr>
</table>
<%
DocumentBuilder docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
Document doc = docBuilder.parse("http://192.168.23.97:8081/ch6/hubo/ReportAll.jsp");

Element root =doc.getDocumentElement();
NodeList tag_001= doc.getElementsByTagName("data");

String name="";
String id="";
String pyo="";


String label="";
String value="";

String datas ="";

for(int i =0; i < tag_001.getLength(); i++){
	Element elmt = (Element)tag_001.item(i);
	
	name = elmt.getElementsByTagName("name").item(0).getFirstChild().getNodeValue();
	id = elmt.getElementsByTagName("id").item(0).getFirstChild().getNodeValue();
	pyo = elmt.getElementsByTagName("pyo").item(0).getFirstChild().getNodeValue();
	
	
	label = "'" + id + name + "'";
	value = pyo;
	
	String data = "[" + label + "," + value + "]";
	
	if(i != tag_001.getLength()-1) {
		data = data + ",";
	}
	datas = datas + data;
}

%>


<!--여기서부터 그래프 그릴 것-->	
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['후보', '특표수'],
          <%=datas%>
        ]);

        var options = {
          chart: {
            title: '후보자별 투표 결과',
          },
          bars: 'horizontal' // Required for Material Bar Charts.
        };

        var chart = new google.charts.Bar(document.getElementById('barchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
		

	
// Add our selection handler.
google.visualization.events.addListener(chart, 'select', selectHandler);

// The selection handler.
// Loop through all items in the selection and concatenate
// a single message from all of them.
function selectHandler() {
  var selection = chart.getSelection();
  var message = '';
  for (var i = 0; i < selection.length; i++) {
    var item = selection[i];
    if (item.row != null && item.column != null) {
      var str = data.getFormattedValue(item.row, item.column);//item.row값을 넘겨줘야한다.
      message = item.row+1;
    } 
  }
  if (message == '') {
   alert("다시 클릭하세요.");
  } else{
  window.location.href= "vote_chart2.jsp?key="+message;
  }
}

   }

    </script>
    <div id="barchart_material" style="width: 600px; height: 300px;"></div>
  </body>
</html>
