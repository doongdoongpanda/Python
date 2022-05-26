<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--한글깨짐 방지를 위해서 해당 코드를 입력하여 문서에 대한 콘텐츠 보안정책을 지정한다-->


<%@ page contentType="text/html; charset=utf-8" %>

<%@ page import="java.sql.*,javax.sql.*,java.io.*, java.net.*"%>
<%@ page errorPage="DataError.jsp"%>
<!-- jsp파일 형식은 text.html이며 브라우저는 UTF-8로 받게될 것이다.-->
<!--HTML 언어로 작성되어 있다는 것을 알려준다.-->
<html>
<head>
<style>
table,th,td{
border:1px solid black;
border-collapse:collapse;
}
</style>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");//Class.forName() 을 이용해서 드라이버 로드
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo29");

  Statement stmt = conn.createStatement();

	
            int NewStdId = 209901;
            int minStdId = 209901;
            int maxStdId = 209901;
            
            ResultSet rset = stmt.executeQuery("select max(studentid) from examtable"); // 가장 높은 학번 찾기
            while (rset.next()) {
              maxStdId = rset.getInt(1); 
            }
            
			
			 ResultSet rset2 = stmt.executeQuery("select studentid from examtable"); // 모든 학번 조회
            while (rset2.next()) {
              NewStdId = rset2.getInt(1);
              if (minStdId != NewStdId ) {
                NewStdId = minStdId;
                break;
              }
              if(minStdId == maxStdId){
                NewStdId = maxStdId +1;
                break;
              }
              minStdId++;
            }




//request.setCharacterEncoding("UTF-8");
String cTmp = request.getParameter( "name" );
String cTmpHan = new String(cTmp.getBytes( "8859_1" ), "utf-8");

String kor =request.getParameter("kor");
String eng =request.getParameter("eng");
String mat =request.getParameter("mat");


stmt.execute("insert into examtable(name, studentid, kor, eng, mat) values('"+
cTmpHan+ "', "+
NewStdId +", "+
kor +", "+
eng +", "+
mat +" );");
rset.close();
rset2.close();

stmt.close();

conn.close();
%>
<h1>성적 입력 추가 완료</h1><!--이건 그냥 텍스트 출력-->
<!--일반적인 JSP코드임을 알림-->


<table width = "470" cellspacing=0 border=1 >
    <tr>
        <td width = "120" align="center" bgcolor ="#BFBFBF">이름</td><td width = "320" align="center">
            <% out.println("<input type=text name='name' value='"+cTmpHan+"' align='center' style = 'text-align:center;' readonly>"); %>
        </td>
    </tr>
    <tr>
        <td width = "120" align="center" bgcolor ="#BFBFBF">학번</td><td width = "320" align="center">
            <% out.println("<input type=text name='studentid' value='"+Integer.toString(NewStdId)+"' style = 'text-align:center;' readonly>"); %>
        </td>
    </tr>
    <tr>
        <td width = "120" align="center" bgcolor ="#BFBFBF">국어</td><td width = "320" align="center">
            <% out.println("<input type='number' min='0' max='100' name='kor' value='"+kor+"' style = 'text-align:center;' readonly>"); %>
        </td>
    </tr>
    <tr>
        <td width = "120" align="center" bgcolor ="#BFBFBF">영어</td><td width = "320" align="center">
            <% out.println("<input type='number' min='0' max='100' name='eng' value='"+eng+"' style = 'text-align:center;' readonly>"); %>
        </td>
    </tr>
    <tr>
        <td width = "120" align="center" bgcolor ="#BFBFBF">수학</td><td width = "320" align="center">
            <% out.println("<input type='number' min='0' max='100' name='mat' value='"+mat+"' style = 'text-align:center;' readonly>"); %>
        </td>
    </tr>
</table>


<button onclick="output()">Back</button> <!--클릭 텍스트 안에 버튼을 만들어 누르면 다른 도큐먼트 객체가 출력되게 만든다-->

<script> <!-- script 생성 -->
 function output() {
history.go(-1); 
 } //펑션구성완료

</script>
</body><!--body를 닫는다.-->
</html><!--역슬레시 html을 작성하여 html를 닫는다.-->