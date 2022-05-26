<!DOCTYPE html>
<!-- html과 jsp에서 한글 처리를 지시하는 명령, 필요한 파일 임포트(아래 3개는 반드시 입력) -->
<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>

<html>
   <head>
      <title> 레코드 삭제 </title>
   </head>
 
   <body>
   <h1> 레코드 삭제 </h1>
      <%
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo29");
         Statement stmt = conn.createStatement();
          
         String ctmp = request.getParameter("studentid");
         
         String sql = "delete from examtable where studentid = " + ctmp;
         stmt.executeUpdate(sql);
         
         ResultSet rset = stmt.executeQuery("select * , kor+eng+mat , (kor+eng+mat)/3 , (select count(*)+1 from examtable as a where (a.kor+a.eng+a.mat)>(b.kor+b.eng+b.mat)) from examtable as b;");
      %>
      
      <table cellspacing=0 border=1>
         <tr <tr bgcolor ="#BFBFBF">
            <td width=50 align=center>이름</td>
            <td width=50 align=center>학번</td>
            <td width=50 align=center>국어</td>
            <td width=50 align=center>영어</td>
            <td width=50 align=center>수학</td>
            <td align="center">합 계</td>
            <td align="center">평 균</td>
            <td align="center">등 수</td>
         </tr>
      
         <%
            while (rset.next()) {
               out.println("<tr>");
               out.println("<td width=70 align=center><a href='oneview_score.jsp?key="
                        + rset.getString(1)+"'> " + rset.getString(1) + "</a></td>");
               out.println("<td width=70 align=center>" + Integer.toString(rset.getInt(2)) + "</td>");
               out.println("<td width=70 align=center>" + Integer.toString(rset.getInt(3)) + "</td>");
               out.println("<td width=70 align=center>" + Integer.toString(rset.getInt(4)) + "</td>");
               out.println("<td width=70 align=center>" + Integer.toString(rset.getInt(5)) + "</td>");
               out.println("<td width=100 align=center>" + Integer.toString(rset.getInt(6)) + "</td>"); //합계
               out.println("<td width=100 align=center>" + Double.toString(Math.round(rset.getDouble(7)*100)/100.0) + "</td>"); //평균점수 정리하기
               out.println("<td width=100 align=center>" + Integer.toString(rset.getInt(8)) + "</td>"); //등수
               out.println("</tr>");
            }
            
             // 사용후 종료
            rset.close();
            stmt.close();
            conn.close();
         %>      
      </table>
   </body>
</html>