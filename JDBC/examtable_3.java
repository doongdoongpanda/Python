package DB_1;

import java.sql.Connection;//DriverManager Ŭ������ getConnection() �޼��带 ȣ��
import java.sql.DriverManager;//����̹��ε带 ���� DriverManager�� import�Ѵ�.
import java.sql.SQLException;//throw ����ó���� ���� SQLException�� import
import java.sql.Statement;//Statement ��ü�� �����Ͽ� ���� �����ϱ� ���� Statement�� import

public class examtable_3 {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Class.forName("com.mysql.jdbc.Driver"); //Class.forName() �� �̿��ؼ� ����̹��� �ε��Ѵ�. Ŭ������ ��ã�� ��� ClassNotFoundException���� ó���� �Ѵ�.
		Connection k29_conn = DriverManager.getConnection("jdbc:mysql://192.168.23.97:33060/kopoctc", "root", "kopo29");
		// ����̹� �ε尡 �Ϸ�ƴٸ� ���� ��ü�� ��´�.
		Statement k29_stmt = k29_conn.createStatement(); //Connection ��ü�� createStatement() �޼��带 ȣ���Ͽ�, ������ ������ �� �ִ� Statement ��ü(k29_stmt)�� ��´�.
		k29_stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values ('����', 209901, 95, 100, 95);"); //examtable ������ ������ values���� �Է��Ѵ�.
		k29_stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values ('����', 209902, 100, 100, 100);"); //examtable ������ ������ values���� �Է��Ѵ�.
		k29_stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values ('���', 209903, 100, 90, 100);");//examtable ������ ����� values���� �Է��Ѵ�.
		k29_stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values ('�糪', 209904, 100, 95, 90);"); //examtable ������ �糪�� values���� �Է��Ѵ�.
		k29_stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values ('��ȿ', 209905, 80, 100, 70);"); //examtable ������ ��ȿ�� values���� �Է��Ѵ�.
		k29_stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values ('�̳�', 209906, 95, 90, 95);");//examtable ������ �̳��� values���� �Է��Ѵ�.
		k29_stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values ('����', 209907, 100, 90, 100);"); //examtable ������ ������ values���� �Է��Ѵ�.
		k29_stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values ('ä��', 209908, 100, 75, 90);"); //examtable ������ ä���� values���� �Է��Ѵ�.
		k29_stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values ('����', 209909, 100, 100, 70);"); //examtable ������ ������ values���� �Է��Ѵ�.
		
		k29_stmt.close(); //Statement�� �ݴ´�.
		k29_conn.close(); //Connection�� �ݴ´�.
	} //������ �ݴ´�.
} //Ŭ������ �ݴ´�.
