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
<h1>테이블만들기 OK</h1><!--이건 그냥 텍스트 출력-->
<%

Class.forName("com.mysql.jdbc.Driver"); //Class.forName() 을 이용해서 드라이버 로드
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo29");
//DriverManager.getConnection() 으로 해당 주소 mysql의 사용자명,패스워드로 연결 얻기
Statement stmt =conn.createStatement();//자바랑 동일하게 Statement 객체 생성
//execute()라는 메소드는 crud 모두 사용
// 질의문의 결과값을 얻어야할 경우에는 getResultSet()라는 메소드를 사용
try{
stmt.execute("create table examtable("+
"name varchar(20),"+
"studentid int not null primary key,"+
"kor int,"+
"eng int,"+
"mat int)DEFAULT CHARSET=utf8;");
}catch(Exception e){
%>
<script>
alert("표가 이미 존재합니다.");
history.go(-1);
</script>
<% }
stmt.close(); //Statement 함수를 닫는다.
conn.close(); //Connection  함수를 닫는다.
%>
</body><!--body를 닫는다.-->
</html><!--역슬레시 html을 작성하여 html를 닫는다.-->