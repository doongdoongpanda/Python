<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<%@page contentType = "text/html; charset=utf-8"%>
<%@page import="java.sql.*, javax.sql.*, java.io.*, java.net.*"%>
<%@page import="javax.xml.parsers.*, org.w3c.dom.*"%>
<html>
<title>날씨 조회</title>
<head>

</head><body>
<h1>날씨 조회</h1>
<%	
	String seq = "";//48시간 중 순서		
	String hour = "";	//동네예보 3시간 단위	
	String day = "";//날짜 순서(오늘:0, 내일:1, 모레:2)	
	String temp = "";	//현재 시간 온도	
	String tmx = "";//최고온도	
	String tmn = "";		//최저온도
	String sky = "";	//하늘 상태 (1:맑음, 2:구름조금, 3:구름많음, 4:흐림)		
	String pty = "";	//강수 상태 (0: 없음, 1:비, 2:비/눈, 3:눈/비, 4:눈)
	String wfKor = "";		//날씨(한글)
	String wfEn = "";		//날씨 (영어)	
	String pop = "";	//강수 확률	
	String r12 = "";	//12시간 예상 강수량
	String s12 = "";	//12시간 예상 적설량
	String ws = "";	//풍속(m/s)
	String wd = "";	//풍향(0:북, 1:북동, 2:동, 3:남동, 4:남, 5:남서, 6:서, 7:북서)
	String wdKor = "";	//풍향 (한글)
	String wdEn = "";//풍향 (영어)
	String reh = "";	//습도 (%)
	String r06 = "";	// 6시간 예상 강수량
	String s06 = "";	//6시간 예상 적설량

	
	DocumentBuilder docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
	Document doc = docBuilder.parse( "http://www.kma.go.kr/wid/queryDFS.jsp?gridx=61&gridy=123");
	Element root = doc.getDocumentElement();
	NodeList infoweather = doc.getElementsByTagName("data");
%>



<table cellspacing=0  border=1>
	<tr >
	<td>seq</td>
	<td>hour</td>
	<td>day</td>
	<td>temp</td>
	<td>tmx</td>
	<td>tmn</td>
	<td>sky</td>
	<td>pty</td>
	<td>wfKor</td>
	<td>wfEn</td>
	<td>pop</td>
	<td>r12</td>
	<td>s12</td>
	<td>ws</td>
	<td>wd</td>
	<td>wdKor</td>
	<td>wdEn</td>
	<td>reh</td>
	<td>r06</td>	
	<td>s06</td>
	</tr>
<%	
	for(int i=0;i<infoweather.getLength(); i++){
		Element elmt=(Element)infoweather.item(i);
		
		seq=infoweather.item(i).getAttributes().getNamedItem("seq").getNodeValue();
		
		hour=elmt.getElementsByTagName("hour").item(0).getFirstChild().getNodeValue();
		day=elmt.getElementsByTagName("day").item(0).getFirstChild().getNodeValue();
		temp=elmt.getElementsByTagName("temp").item(0).getFirstChild().getNodeValue();
		tmx=elmt.getElementsByTagName("tmx").item(0).getFirstChild().getNodeValue();
		tmn=elmt.getElementsByTagName("tmn").item(0).getFirstChild().getNodeValue();
		sky=elmt.getElementsByTagName("sky").item(0).getFirstChild().getNodeValue();
		pty=elmt.getElementsByTagName("pty").item(0).getFirstChild().getNodeValue();
		wfKor=elmt.getElementsByTagName("wfKor").item(0).getFirstChild().getNodeValue();
		wfEn=elmt.getElementsByTagName("wfEn").item(0).getFirstChild().getNodeValue();
		pop=elmt.getElementsByTagName("pop").item(0).getFirstChild().getNodeValue();
		r12=elmt.getElementsByTagName("r12").item(0).getFirstChild().getNodeValue();
		s12=elmt.getElementsByTagName("s12").item(0).getFirstChild().getNodeValue();
		ws=elmt.getElementsByTagName("ws").item(0).getFirstChild().getNodeValue();
		wd=elmt.getElementsByTagName("wd").item(0).getFirstChild().getNodeValue();
		wdKor=elmt.getElementsByTagName("wdKor").item(0).getFirstChild().getNodeValue();
		wdEn=elmt.getElementsByTagName("wdEn").item(0).getFirstChild().getNodeValue();
		reh=elmt.getElementsByTagName("reh").item(0).getFirstChild().getNodeValue();
		r06=elmt.getElementsByTagName("r06").item(0).getFirstChild().getNodeValue();
		s06=elmt.getElementsByTagName("s06").item(0).getFirstChild().getNodeValue();

		//코드에 따른 스트링 값 
		switch(day){
			case "0": 
			day="오늘";
			hour="오늘"+hour+"시";
			break;
			case "1": 
			day="내일";
			hour="내일"+hour+"시";
			break;
			case "2": 
			day="모레";
			hour="모레"+hour+"시";
			break;
		}
		
		if(sky.equals("1")){
			sky= "/ch6/sky_1.png";
		}else if(sky.equals("2")){
			sky= "/ch6/sky_2.png";
		}else if(sky.equals("3")){
			sky= "/ch6/sky_3.png";
		}else if(sky.equals("4")){
			sky= "/ch6/sky_4.png";
		}
		
		if(pty.equals("0")){
			pty="/ch6/pty_0.png";
		} else if(pty.equals("1")){
			pty="/ch6/pty_1.png";
		} else if(pty.equals("2")){_
			pty="/ch6/pty_2.png";
		} else if(pty.equals("3")){
			pty="/ch6/pty_3.png";
		} else if(pty.equals("4")){
			pty="/ch6/pty_4.png";
		}
		
		if( wd.equals("0")){
			wd="/ch6/wd_0.png";
		} else if ( wd.equals("1")){
			wd="/ch6/wd_1.png";
		} else if (wd.equals("2")){
			wd="/ch6/wd_2.png";
		} else if ( wd.equals("3")){
			wd="/ch6/wd_3.png";
		} else if ( wd.equals("4")){
			wd="/ch6/wd_4.png";
		} else if ( wd.equals("5")){
			wd="/ch6/wd_5.png";
		} else if (wd.equals("6")){
			wd="/ch6/wd_6.png";
		} else if ( wd.equals("7")){
			wd="/ch6/wd_7.png";
		}
%>		
	<tr>
	<!--
	getFirstChild():element node에 접근
	getNodeeValue(): 해당 node의 값 가져오는 메서드
	-->
	<td><%=seq%></td>
	<td><%=hour%></td>
	<td><%=day%></td>
	<td><%=temp%> ºC</td>
	<td><%=tmx%></td>
	<td><%=tmn%></td>
	<td><img src='<%=sky%>' width=50 height=50></td>
	<td><img src='<%=pty%>' width=50 height=50></td>
	<td><%=wfKor%></td>
	<td><%=wfEn%></td>
	<td><%=pop%></td>
	<td><%=r12%></td>
	<td><%=s12%></td>
	<td><%=ws%></td>
	<td><img src='<%=wd%>' width=50 height=50></td>
	<td><%=wdKor%></td>
	<td><%=wdEn%></td>
	<td><%=reh%></td>
	<td><%=r06%></td>
	<td><%=s06%></td>
	</tr>
<%	
	}
	
%>
</table>
</body>
</html>
