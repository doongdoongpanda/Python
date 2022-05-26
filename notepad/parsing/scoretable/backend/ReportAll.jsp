<?xml version="1.0" encoding="UTF-8"?>
<%@ page contentType="text/xml; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*, java.net.*"%>

<html>
<head>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo29");
Statement stmt =conn.createStatement();
Statement stmt2 = conn.createStatement();
Statement stmt3 =conn.createStatement();

	
ResultSet rset2 = stmt2.executeQuery("select count(*) from tupyo_table;");
int totalpyo=0;
String info= "";

while(rset2.next()) {
	totalpyo=rset2.getInt(1);
	} 
	if(totalpyo == 0){
	info = "집계된 표가 없습니다.";
	}

//그전에 
stmt3.execute("SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));");	

ResultSet rset = 
stmt.executeQuery("select a.id, a.name, count(b.id), count(*) from vote_table as a left join tupyo_table as b on a.id = b.id group by a.id order by a.id;");	


 out.println("<datas>");
 
 while(rset.next()){
	 
	int pyo = rset.getInt(3);
		//ratio: pyo/totalpyo 득표율(후보 당 득표수/전체 투표수)
	double ratio = Math.round(((double)pyo/(double)totalpyo*100));
		//막대그래프 그리기
	double bar=2.8*ratio;
	  
	 out.println("<data>");
	 out.println("<id>"+Integer.toString(rset.getInt(1))+"</id>");//기호
	 out.println("<name>"+rset.getString(2)+"</name>");//이름
	 out.println("<count_Id>"+Integer.toString(rset.getInt(3))+"</count_Id>");//후보 카운트
	 out.println("<count_All>"+Integer.toString(rset.getInt(4))+"</count_All>");//후보 카운트
	 out.println("<bar>"+bar+"</bar>"); //
	 out.println("<pyo>"+pyo+"</pyo>");
	 out.println("<ratio>"+ratio+"</ratio>");
	 out.println("</data>");
 }
out.println("</datas>");

rset.close();
rset2.close();
stmt.close();
stmt2.close();
stmt3.close();
conn.close();
%>
</body>
</html>