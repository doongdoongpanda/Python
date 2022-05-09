package DB_1;

import java.sql.Connection;//DriverManager 클래스의 static 메서드인 getConnection() 메서드를 호출
import java.sql.DriverManager; //드라이버로드를 위해 DriverManager를 import한다.
import java.sql.SQLException;//throw 예외처리를 위해 SQLException를 import
import java.sql.Statement;//Statement 객체를 생성하여 질의 수행하기 위해 Statement를 import

public class examtable_1 {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Class.forName("com.mysql.jdbc.Driver"); //Class.forName() 을 이용해서 드라이버를 로드한다. 클래스를 못찾을 경우 ClassNotFoundException예외 처리를 한다.
		Connection k29_conn = DriverManager.getConnection("jdbc:mysql://192.168.23.97:33060/kopoctc", "root", "kopo29");
		// 드라이버 로드가 완료됐다면 연결 객체를 얻는다.
		Statement k29_stmt = k29_conn.createStatement(); //Connection 객체의 createStatement() 메서드를 호출하여, 쿼리를 실행할 수 있는 Statement 객체(k29_stmt)를 얻는다.
		k29_stmt.execute("create table examtable(name varchar(20),studentid int not null primary key,kor int,eng int,mat int)"+
		//create table examtable=>전 페이지와 동일한 형식으로 examtable이란 이름의 table 생성
						"DEFAULT CHARSET=utf8;"); //한글 지원되는 utf8문자를 기본 인코딩 문자로 함.

		k29_stmt.close(); //Statement를 닫는다.
		k29_conn.close(); //Connection을 닫는다.
	}//매인을 닫는다.
}//클래스를 닫는다.
