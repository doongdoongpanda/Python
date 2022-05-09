package DB_1;

import java.sql.Connection; //DriverManager 클래스의 static 메서드인 getConnection() 메서드를 호출
import java.sql.DriverManager; //드라이버로드를 위해 DriverManager를 import한다.
import java.sql.ResultSet; //execteQuery에 대한 반환값을 얻어내기 위해 ResultSet를 import
import java.sql.SQLException;//throw 예외처리를 위해 SQLException를 import
import java.sql.Statement;//Statement 객체를 생성하여 질의 수행하기 위해 Statement를 import

public class db_test {

	public static void main(String[] args) throws ClassNotFoundException, SQLException { 
		//ClassNotFoundException : 동적으로 클래스를 문자열로 로딩을 시도하다가 클래스가 없는 경우 발생, 이때 throw 예외처리
		//SQLException :SQL Server에서 경고 또는 오류를 반환할 때 throw되는 예외처리
		// TODO Auto-generated method stub
	Class.forName("com.mysql.jdbc.Driver"); //Class.forName() 을 이용해서 드라이버를 로드한다.
	Connection k29_conn = DriverManager.getConnection("jdbc:mysql://192.168.23.97:33060/kopoctc", "root", "kopo29");
	// 드라이버 로드가 완료됐다면 연결 객체를 얻는다.
	Statement k29_stmt = k29_conn.createStatement();
	//연결이 완료 됐다면 실행도구를 생성한다.
	ResultSet k29_rset = k29_stmt.executeQuery("show databases;");
	//쿼리를 실행 한 뒤 결과를 rset 변수에 얻는다.ResultSet은 execteQuery에 대한 반환값이라 생각하면 된다. 앞에 대문자 R.
	while (k29_rset.next()) { //rset에 담긴 자료들을 Before of FIle 부터 End of FIle을 가르킬 때 까지 순차적으로 가르키면서 자료를 사용할 준비를 한다
		System.out.println("값 : " +k29_rset.getString(1)); //re.next();를 수행 한 이후 가져온 자료(레코드)의 속성값을 get하여 Java 코드에 저장한다.
	}//반복문을 종료한다. 
	k29_rset.close(); //반복문이 종료되면 ResultSet을 닫는다. 
	k29_stmt.close(); //Statement을 닫는다. 
	k29_conn.close(); //Connection을 닫는다.
	}//매인을 닫는다.
}//클래스를 닫는다.
