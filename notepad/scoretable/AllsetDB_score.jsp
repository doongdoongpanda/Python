<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<!--한글깨짐 방지를 위해서 해당 코드를 입력하여 문서에 대한 콘텐츠 보안정책을 지정한다-->
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
<%@ page errorPage="DataError.jsp"%>
<!-- jsp파일 형식은 text.html이며 브라우저는 UTF-8로 받게될 것이다.-->
<!--HTML 언어로 작성되어 있다는 것을 알려준다.-->
<html>
<head>
</head>
<body>
<h1>테이블 값넣기 OK</h1><!--이건 그냥 텍스트 출력-->
<!--일반적인 JSP코드임을 알림-->

<%

Class.forName("com.mysql.jdbc.Driver");//Class.forName() 을 이용해서 드라이버 로드
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo29");
//DriverManager.getConnection() 으로 해당 주소 mysql의 사용자명,패스워드로 연결 얻기
Statement stmt =conn.createStatement();//자바랑 동일하게 Statement 객체 생성
try{
stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('나연', 209901,95,100,95);");
stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('나연', 209910,100,100,95);");
stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('정연', 209902,95,95,95);");
stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('모모', 209903,100,100,100);");
stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('사나', 209904,100,95,90);");
stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('지효', 209905,80,100,70);");
stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('미나', 209906,100,100,70);");
stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('다현', 209907,70,70,70);");
stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('채영', 209908,80,75,72);");
stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('쯔위', 209909,78,79,82);");

}catch(Exception e){
%>
<script>
alert("TBL 생성 후 값넣기가 가능합니다.");
history.go(-1);
</script>
<% }


stmt.close(); //Statement 함수를 닫는다.
conn.close(); //Connection  함수를 닫는다.

%>
</body><!--body를 닫는다.-->
</html><!--역슬레시 html을 작성하여 html를 닫는다.-->