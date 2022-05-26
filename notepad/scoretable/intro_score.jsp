<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<!--한글깨짐 방지를 위해서 해당 코드를 입력하여 문서에 대한 콘텐츠 보안정책을 지정한다-->
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.io.*, java.net.*" %>
<!-- jsp파일 형식은 text.html이며 브라우저는 UTF-8로 받게될 것이다.-->
<!--HTML 언어로 작성되어 있다는 것을 알려준다.-->
<html>
<head>
</head>
<body>
<h1><center>JSP Database 실습 1</center></h1><!--이건 그냥 텍스트 출력-->
<h4><center>생성-> 삭제->생성->값넣기 후 전체조회해주세요</center></h4><!--이건 그냥 텍스트 출력-->
<!--일반적인 JSP코드임을 알림-->
<%
String data;
int cnt=0;
FileReader fl = new FileReader("/home/cnt.txt");
StringBuffer sb = new StringBuffer();
int ch = 0;
while((ch = fl.read()) != -1){
	sb.append((char)ch);
}
data=sb.toString().trim().replace("\n","");
fl.close();

cnt=Integer.parseInt(data);
cnt++;
data=Integer.toString(cnt);
out.println("<br><br>현재 홈페이지 방문조회수는["+data+"] 입니다.</br>");
FileWriter fl2= new FileWriter("/home/cnt.txt", false);
fl2.write(data);
fl2.close();
%>
</body><!--body를 닫는다.-->
</html><!--역슬레시 html을 작성하여 html를 닫는다.-->