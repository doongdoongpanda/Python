<?xml version="1.0" encoding="UTF-8"?>
<%@ page contentType="text/xml; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*, java.net.*"%>

<html>
	<head>
	</head>
	<body>
		<%
			Class.forName("com.mysql.jdbc.Driver");//Class.forName() 을 이용해서 드라이버 로드
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo29");

			String id= request.getParameter("key");

			Statement stmt4 =conn.createStatement();//자바랑 동일하게 Statement 객체 생성	

			double per=0;
			
			out.println("<datas>");
			
			for(int i=1; i<=9; i++){			
				ResultSet rset4 = stmt4.executeQuery("select "+i+",count(b.id),round(count(b.id)/(select count(*) from tupyo_table where id="+id+")*100,2) from tupyo_table as b where b.age="+i+" and b.id="+id+";");				
				
				while(rset4.next()){
					per=rset4.getDouble(3);
					out.println("<data>");
					out.println("<age>"+Integer.toString(rset4.getInt(1))+"</age>");//연령
					out.println("<count>"+Integer.toString(rset4.getInt(2))+"</count>");//기호 카운트
					out.println("<per>"+per+"</per>");//비율
					out.println("</data>");
				}
				
				rset4.close();
			}
			
			out.println("</datas>");

			stmt4.close();
			conn.close();
		%>
	</body>
</html>