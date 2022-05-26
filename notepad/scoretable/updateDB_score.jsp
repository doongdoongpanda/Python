<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--한글깨짐 방지를 위해서 해당 코드를 입력하여 문서에 대한 콘텐츠 보안정책을 지정한다-->
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*, java.net.*"%>
<%@ page errorPage = "DataError.jsp" %>

<html>
<head>
<style>
table,th,td{
border:1px solid black;
border-collapse:collapse;
}
</style>
<%

String str1 = null;

String str2 = null;
String str3 = null;
int first = 0;

int result = 0;

int second = 0;
int third = 0;
	try{

	str1 = request.getParameter("kor");
	str2 = request.getParameter("eng");
	str3 = request.getParameter("mat");
	 first = Integer.parseInt(str1);                  // 숫자만 받을 수 있고 문자열은 못받음.
	 second = Integer.parseInt(str2);              // 문자 입력 시, 에러
	third = Integer.parseInt(str3); 
	 result = first + second +third;

	}catch(Exception e){

		RequestDispatcher dispatcher  = request.getRequestDispatcher("DataError.jsp");
		dispatcher.forward(request, response);
	}
%>
</head>
<body>
<h1>레코드 수정</h1>
<%

Class.forName("com.mysql.jdbc.Driver");//Class.forName() 을 이용해서 드라이버 로드
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo29");

Statement stmt =conn.createStatement();


String cTmp = request.getParameter( "name" );
String cTmpHan = new String(cTmp.getBytes( "8859_1" ), "utf-8");
String sql=" update examtable set "+
"name ='"+cTmpHan+"', "+
"kor = "+ request.getParameter("kor")+", "+
"eng = "+ request.getParameter("eng")+", "+
"mat = "+ request.getParameter("mat")+
" where studentid = "+request.getParameter("studentid")+";";

stmt.executeUpdate( sql );
ResultSet rset = stmt.executeQuery("select * from examtable;");

%>


<table width=600 cellspacing=0  border=1 ><!--넓이 60에 공가 1 굵기 1인 테이블을 생성한다.-->
<tr bgcolor ="#BFBFBF">
<td width=50><p align=center>이름</p></td><!--넓이 50인 셀에 이름 텍스트 중앙배치-->
<td width=50><p align=center>학번</p></td><!--넓이 50인 셀에 학번 텍스트 중앙배치-->
<td width=50><p align=center>국어</p></td><!--넓이 50인 셀에 국어 텍스트 중앙배치-->
<td width=50><p align=center>영어</p></td><!--넓이 50인 셀에 영어 텍스트 중앙배치-->
<td width=50><p align=center>수학</p></td><!--넓이 50인 셀에 수학 텍스트 중앙배치-->
</tr>
<%
while (rset.next()){
	if( request.getParameter("studentid").equals(Integer.toString(rset.getInt(2)))){
		out.println("<tr bgcolor = '#ffff00'>");
		out.println("<td width=50><p align=center><a href='oneview_score.jsp?key="
		+rset.getString(1)+"'>"+rset.getString(1)+"</a></p></td>");
		out.println("<td width=50><p align center>"+Integer.toString(rset.getInt(2))+"</p></td>");
		out.println("<td width=50><p align center>"+Integer.toString(rset.getInt(3))+"</p></td>");
		out.println("<td width=50><p align center>"+Integer.toString(rset.getInt(4))+"</p></td>");
		out.println("<td width=50><p align center>"+Integer.toString(rset.getInt(5))+"</p></td>");
		out.println("</tr>");
	
} else{
	out.println("<tr>");
	out.println("<td width=50><p align=center><a href='oneview_score.jsp?key="
		+rset.getString(1)+"'>"+rset.getString(1)+"</a></p></td>");
		out.println("<td width=50><p align center>"+Integer.toString(rset.getInt(2))+"</p></td>");
		out.println("<td width=50><p align center>"+Integer.toString(rset.getInt(3))+"</p></td>");
		out.println("<td width=50><p align center>"+Integer.toString(rset.getInt(4))+"</p></td>");
		out.println("<td width=50><p align center>"+Integer.toString(rset.getInt(5))+"</p></td>");
		out.println("</tr>");
}
}
rset.close();
stmt.close();
conn.close();
%>
</body>
</html>