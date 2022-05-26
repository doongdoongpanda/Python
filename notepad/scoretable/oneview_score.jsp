<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<!--한글깨짐 방지를 위해서 해당 코드를 입력하여 문서에 대한 콘텐츠 보안정책을 지정한다-->
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<!-- jsp파일 형식은 text.html이며 브라우저는 UTF-8로 받게될 것이다.-->
<!--HTML 언어로 작성되어 있다는 것을 알려준다.-->
<html>
<head>

</head>
<body>
<!--일반적인 JSP코드임을 알림-->
<%
Class.forName("com.mysql.jdbc.Driver");//Class.forName() 을 이용해서 드라이버 로드
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo29");
//DriverManager.getConnection() 으로 해당 주소 mysql의 사용자명,패스워드로 연결 얻기
Statement stmt =conn.createStatement();//자바랑 동일하게 Statement 객체 생성
// 질의문의 결과값을 얻어야할 경우이기때문에 getResultSet()라는 메소드를 사용
String ckey = request.getParameter( "key" );
//request.getParameter을 통해 문자열을 인자값으로 받아본다. 
ResultSet rset = stmt.executeQuery("select *, kor+eng+mat, (kor+eng+mat)/3 , (select count(*)+1 from examtable as a where (a.kor+a.eng+a.mat)>(b.kor+b.eng+b.mat)) from examtable as b where name = '"+ckey+"'  ;");
//executeQuery 통해서 SELECT 쿼리를 실행할 때 사용되며, SELECT 쿼리의 실행 결과를 객체에 담아서 리턴
%>
<h1>[<%=ckey%>]조회</h1><!--변수ckey값과 조회라는 택스트 출력-->

<table cellspacing=0 width=600 border=1 ><!--넓이 60에 공가 1 굵기 1인 테이블을 생성한다.-->
<tr bgcolor ="#BFBFBF">
<td width=50><p align=center>이름</p></td><!--넓이 50인 셀에 이름 텍스트 중앙배치-->
<td width=50><p align=center>학번</p></td><!--넓이 50인 셀에 학번 텍스트 중앙배치-->
<td width=50><p align=center>국어</p></td><!--넓이 50인 셀에 국어 텍스트 중앙배치-->
<td width=50><p align=center>영어</p></td><!--넓이 50인 셀에 영어 텍스트 중앙배치-->
<td width=50><p align=center>수학</p></td><!--넓이 50인 셀에 수학 텍스트 중앙배치-->
<td width=50><p align=center>총점</p></td><!--넓이 50인 셀에 수학 텍스트 중앙배치-->
<td width=50><p align=center>평균</p></td><!--넓이 50인 셀에 수학 텍스트 중앙배치-->
<td width=50><p align=center>등수</p></td><!--넓이 50인 셀에 수학 텍스트 중앙배치-->
</tr>
<!--일반적인 JSP코드임을 알림-->
<%
while (rset.next()){
	//ResultSet 클래스는 next() 메서드를 제공하는데, next() 메서드를 사용해서 한줄 한줄씩 존재 여부를 확인해나간다.
	out.println("<tr>");
	out.println("<td width=50><p align=center>"+rset.getString(1)+"</p></td>");
	out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(2))+"</p></td>");
	out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(3))+"</p></td>");
	out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(4))+"</p></td>");
	out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(5))+"</p></td>");
    out.println("<td width=50 align=center>" + Integer.toString(rset.getInt(6)) + "</td>");
    out.println("<td width=50 align=center>" + Double.toString(Math.round(rset.getDouble(7)*100)/100.0) + "</td>");
    out.println("<td width=50 align=center>" + Integer.toString(rset.getInt(8)) + "</td>");
	out.println("<tr>");
}//더 읽을 문장이 없으면 반복문을 닫는다. 
rset.close(); //ResultSet 함수를 닫는다. 
stmt.close(); //Statement 함수를 닫는다.
conn.close(); //Connection  함수를 닫는다.
%>

<button onclick="output()">Back</button> <!--클릭 텍스트 안에 버튼을 만들어 누르면 다른 도큐먼트 객체가 출력되게 만든다-->
<script> <!-- script 생성 -->
 function output() {
history.go(-1); 
 } //펑션구성완료
</script>

</body><!--body를 닫는다.-->
</html><!--역슬레시 html을 작성하여 html를 닫는다.-->