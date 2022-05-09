package DB_1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class scoretable_4 {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Class.forName("com.mysql.jdbc.Driver"); //Class.forName() 을 이용해서 드라이버를 로드한다. 클래스를 못찾을 경우 ClassNotFoundException예외 처리를 한다.
		Connection k29_conn = DriverManager.getConnection("jdbc:mysql://192.168.23.97:33060/kopoctc", "root", "kopo29");
		// 드라이버 로드가 완료됐다면 연결 객체를 얻는다.
		Statement k29_stmt = k29_conn.createStatement(); //Connection 객체의 createStatement() 메서드를 호출하여, 쿼리를 실행할 수 있는 Statement 객체(k29_stmt)를 얻는다.
		ResultSet rset = k29_stmt.executeQuery("select * from examtable;");
		System.out.printf("  이름   학번   국어 영어 수학\n");
		while (rset.next()) {
			System.out.printf("%4s  %6d  %3d  %3d  %3d \n", rset.getString(1), rset.getInt(2), rset.getInt(3), rset.getInt(4),rset.getInt(5));
		}
		rset.close();
		k29_stmt.close();
		k29_conn.close();
	}
}
