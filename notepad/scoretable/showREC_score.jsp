<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--한글깨짐 방지를 위해서 해당 코드를 입력하여 문서에 대한 콘텐츠 보안정책을 지정한다-->
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*, java.net.*"%>
<%@ page errorPage="DataError.jsp"%>
<html>
<head>

<SCRIPT LANGUAGE="JavaScript">

function submitForm(mode){
	if(mode == "update"){
		myform.action = "updateDB_score.jsp";
		//myform.submit();
	}else if(mode == "delete"){
		myform.action = "deleteDB_score.jsp";
		//myform.submit();
	}
}

</SCRIPT>
</head>
<body>
<%

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo29");

Statement stmt =conn.createStatement();

String name="";
String studentid="";

String kor="";
String eng ="";
String mat="";

String ctmp = request.getParameter( "searchid" );
if(ctmp.length()==0) ctmp="0";

ResultSet rset = stmt.executeQuery("select * from examtable where studentid = "+ctmp+";");

name ="해당학번없음";

while (rset.next()){
	name=rset.getString(1);
	studentid=Integer.toString(rset.getInt(2));
	kor=Integer.toString(rset.getInt(3));
	eng=Integer.toString(rset.getInt(4));
	mat=Integer.toString(rset.getInt(5));
}
rset.close();
stmt.close();
conn.close();

%>
<h1>성적 조회후 정정 /삭제</h1>

<button onclick="output()">Back</button> <!--클릭 텍스트 안에 버튼을 만들어 누르면 다른 도큐먼트 객체가 출력되게 만든다-->
<script> <!-- script 생성 -->
 function output() {
history.go(-1); 
 } //펑션구성완료
</script> 
</tr>
</table>
</form>
<form method='post' name='myform'>
<!--성적입력-->
<table width = "470" cellspacing=0  border=1 >
    <tr align="center">
        <td width = "120" align="center" bgcolor ="#BFBFBF">이름</td>
		<td>
		<input type='text' name='name' maxlength=20 value='<%=name%>' maxlength=20 required 
	pattern='^[가-힣a-zA-Z]+$'></td>
    </tr>
    <tr>
        <td align="center" bgcolor ="#BFBFBF">학번</td>
		<td align="center"><input type='text' name ='studentid' value='<%=studentid%>' readonly></td>
    </tr>
    <tr>
        <td width = "120" align="center" bgcolor ="#BFBFBF">국어</td>
		   <td width = "320" align="center"><input type='number'
		     min='0' max='100' name ='kor' value='<%=kor%>'></p></td>
	</tr>
    <tr>
        <td width = "120" align="center" bgcolor ="#BFBFBF">영어</td>
		   <td width = "320" align="center"><input type='number'  min='0' max='100' name ='eng' value='<%=eng%>'>
		   </td>
	</tr>
    <tr>
        <td width = "120" align="center" bgcolor ="#BFBFBF">수학</td>
		<td width = "320" align="center"><input type='number'  min='0' max='100' name ='mat' value='<%=mat%>'></td>
    </tr>
	</table>
	
	
<%	
if (studentid.length() != 0){
	out.println("<table cellspacing=1 width=400 border=0> ");
	out.println("<tr>");
	out.println("<td width=200></td>");
	out.println("<td width=100><p align=center><input type=submit value=\"수정\" OnClick=\"submitForm('update')\"</p></td>");
	out.println("<td width=100><p align=center><input type=submit value=\"삭제\" OnClick=\"submitForm('delete')\"</p></td>");
	out.println("</tr>");
	out.println("</table>");
}
%>
</form>

</body>
</html>