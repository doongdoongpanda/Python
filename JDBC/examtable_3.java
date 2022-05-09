package DB_1;

import java.sql.Connection;//DriverManager 클래스의 getConnection() 메서드를 호출
import java.sql.DriverManager;//드라이버로드를 위해 DriverManager를 import한다.
import java.sql.SQLException;//throw 예외처리를 위해 SQLException를 import
import java.sql.Statement;//Statement 객체를 생성하여 질의 수행하기 위해 Statement를 import

public class examtable_3 {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Class.forName("com.mysql.jdbc.Driver"); //Class.forName() 을 이용해서 드라이버를 로드한다. 클래스를 못찾을 경우 ClassNotFoundException예외 처리를 한다.
		Connection k29_conn = DriverManager.getConnection("jdbc:mysql://192.168.23.97:33060/kopoctc", "root", "kopo29");
		// 드라이버 로드가 완료됐다면 연결 객체를 얻는다.
		Statement k29_stmt = k29_conn.createStatement(); //Connection 객체의 createStatement() 메서드를 호출하여, 쿼리를 실행할 수 있는 Statement 객체(k29_stmt)를 얻는다.
		k29_stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values ('나연', 209901, 95, 100, 95);"); //examtable 안으로 나연의 values들을 입력한다.
		k29_stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values ('정연', 209902, 100, 100, 100);"); //examtable 안으로 정연의 values들을 입력한다.
		k29_stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values ('모모', 209903, 100, 90, 100);");//examtable 안으로 모모의 values들을 입력한다.
		k29_stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values ('사나', 209904, 100, 95, 90);"); //examtable 안으로 사나의 values들을 입력한다.
		k29_stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values ('지효', 209905, 80, 100, 70);"); //examtable 안으로 지효의 values들을 입력한다.
		k29_stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values ('미나', 209906, 95, 90, 95);");//examtable 안으로 미나의 values들을 입력한다.
		k29_stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values ('다현', 209907, 100, 90, 100);"); //examtable 안으로 다현의 values들을 입력한다.
		k29_stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values ('채영', 209908, 100, 75, 90);"); //examtable 안으로 채영의 values들을 입력한다.
		k29_stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values ('쯔위', 209909, 100, 100, 70);"); //examtable 안으로 쯔위의 values들을 입력한다.
		
		k29_stmt.close(); //Statement를 닫는다.
		k29_conn.close(); //Connection을 닫는다.
	} //매인을 닫는다.
} //클래스를 닫는다.
