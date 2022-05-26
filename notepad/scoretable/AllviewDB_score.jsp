<!DOCTYPE html>
<!-- html과 jsp에서 한글 처리를 지시하는 명령, 필요한 파일 임포트(아래 3개는 반드시 입력) -->
<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%@ page errorPage="DataError.jsp"%>

<!-- jsp파일 형식은 text.html이며 브라우저는 UTF-8로 받게될 것이다.-->
<!--HTML 언어로 작성되어 있다는 것을 알려준다.-->
<html>
<head>

</head>
<body>
<h1>조회</h1><!--이건 그냥 텍스트 출력-->
<!--일반적인 JSP코드임을 알림-->
<%
Class.forName("com.mysql.jdbc.Driver");//Class.forName() 을 이용해서 드라이버 로드
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopoctc","root","kopo29");
//DriverManager.getConnection() 으로 해당 주소 mysql의 사용자명,패스워드로 연결 얻기
Statement stmt =conn.createStatement();//자바랑 동일하게 Statement 객체 생성

     // get 방식으로 받아온 변수 값을 입력한다.
         String cfrom = request.getParameter("from");
         String ccnt = request.getParameter("cnt");
         String cpagemove = request.getParameter("pagemove");
         
         //null값 지정
         if (cfrom == null || "null".equals(cfrom)) {
            cfrom = "1";
         }
         if (ccnt == null || "null".equals(ccnt)) {
            ccnt = "10";
         }
         if (cpagemove == null || "null".equals(cpagemove)) {
            cpagemove = "1";
         }

         //해당페이지의 처음 인원을 계산하다.
         String startpage =  Integer.toString((Integer.parseInt(cfrom) - 1) * Integer.parseInt(ccnt));
         String QueryTxt;
         String QueryTxt2;

         // select 문을 이용해서 총 데이터 개수 출력
         QueryTxt2 = String.format(" select count(*) from examtable;");
         ResultSet rset2 = stmt.executeQuery(QueryTxt2);
         int total=0;
		 
			
		while (rset2.next()) {
            total = rset2.getInt(1);
			}
			
			if(total == 0){
				out.println("<b>테이블 값이 없습니다.</b>");
			}else{
         //테이블 전체 내용을 보여주는 명령 실행
         QueryTxt = String.format(" select * , kor+eng+mat , (kor+eng+mat)/3 , (select count(*)+1 from examtable as a where (a.kor+a.eng+a.mat)>(b.kor+b.eng+b.mat)) from examtable as b limit "+ startpage +", "+ccnt+";");
         ResultSet rset = stmt.executeQuery(QueryTxt);

out.println("<table cellspacing=0 width=600 border=1 ><tr bgcolor ='#BFBFBF'>");
out.println("<td width=50 align=center>이름</td><td width=50 align=center>학번</td><td width=50 align=center>국어</td><td width=50 align=center>영어</td><td width=50 align=center>수학</td>"+
"<td width=50 align=center>총점</td><td width=50 align=center>평균</td><td width=50 align=center>등수</td></tr>");
	   while (rset.next()) {   //rset이 끝날 때 까지
      out.println("<tr>");   //테이블에 아래 내용으로 내용 넣기
      out.println("<td width=50 align=center ><a href='oneview_score.jsp?key="
            +rset.getString(1)+"'>"+rset.getString(1)+"</a></td>");
      out.println("<td width=50 align=center>" + Integer.toString(rset.getInt(2)) + "</td>");
        out.println("<td width=50 align=center>" + Integer.toString(rset.getInt(3)) + "</td>");
        out.println("<td width=50 align=center>" + Integer.toString(rset.getInt(4)) + "</td>");
        out.println("<td width=50 align=center>" + Integer.toString(rset.getInt(5)) + "</td>");
      out.println("<td width=50 align=center>" + Integer.toString(rset.getInt(6)) + "</td>");
      out.println("<td width=50 align=center>" + Double.toString(Math.round(rset.getDouble(7)*100)/100.0) + "</td>");
      out.println("<td width=50 align=center>" + Integer.toString(rset.getInt(8)) + "</td>");
      out.println("</tr>");
   }
 
   
       int inpagemove = (Integer.parseInt(cpagemove));   //페이지 이동
         int intcnt = (Integer.parseInt(ccnt));   //한페이지당 출력 자료수
         int pageprintnum = intcnt;   //숫자로 변환
         int lastpage = intcnt;
         int firstpage = 0;
         // 1페이지 이하에선 1로 출력
         if (inpagemove <= 1) {
            inpagemove = 1;
            firstpage = 0;
         } else {
            firstpage = 10;
         }

         //마지막 페이지에선 마지막페이지만 출력
         if (total < 100){
            firstpage=0;
            lastpage =  (total/intcnt);
            inpagemove = 1;
            if ((total%intcnt) == 0) {
               pageprintnum = (total/intcnt);
               lastpage =  (total/intcnt)-1;
            } else {
               pageprintnum = (total/intcnt) + 1;
               lastpage =  (total/intcnt);
            }
			if (total==0){
				lastpage=0;
			}
         } else {
            if(inpagemove>=((total/100)*10 + 1)){
               pageprintnum = (total/10)%intcnt + 1;
               inpagemove = (total/100)*10 + 1;
               lastpage = (total/10)%intcnt;
            } 
         }
     
         // 테이블을 제작하여 안에 페이지 이동할 숫자를 작성한다. 작성하면서 get방식으로 값을 보낸다.
         out.print("</table><br> <table border=0><br>");
         out.print("<tr><td width = 650 align = center ><b><a href = 'AllviewDB_score.jsp?from="+(inpagemove-firstpage)+"&cnt="+intcnt+"&pagemove="+(inpagemove-10)+"'> &lt&lt  </a></b>");      
         for (int i = inpagemove; i < inpagemove + pageprintnum; i++) {
            out.print("<b><a href = 'AllviewDB_score.jsp?from="+i+"&cnt="+intcnt+"&pagemove="+(inpagemove)+"'> "+i+" </a></b>");         
         }
         out.print("<b><a href = 'AllviewDB_score.jsp?from="+(inpagemove+lastpage)+"&cnt="+intcnt+"&pagemove="+(inpagemove+10)+"'> &gt&gt </a></b>");

         out.print("</td></tr></table>");
            
         // 사용후 종료 
         rset2.close();
         rset.close();
         stmt.close();
         conn.close();
			}

      %>
</table>
</body><!--body를 닫는다.-->
</html><!--역슬레시 html을 작성하여 html를 닫는다.-->