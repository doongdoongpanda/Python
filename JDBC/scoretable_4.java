package DB_1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class scoretable_4 {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Class.forName("com.mysql.jdbc.Driver"); //Class.forName() �� �̿��ؼ� ����̹��� �ε��Ѵ�. Ŭ������ ��ã�� ��� ClassNotFoundException���� ó���� �Ѵ�.
		Connection k29_conn = DriverManager.getConnection("jdbc:mysql://192.168.23.97:33060/kopoctc", "root", "kopo29");
		// ����̹� �ε尡 �Ϸ�ƴٸ� ���� ��ü�� ��´�.
		Statement k29_stmt = k29_conn.createStatement(); //Connection ��ü�� createStatement() �޼��带 ȣ���Ͽ�, ������ ������ �� �ִ� Statement ��ü(k29_stmt)�� ��´�.
		ResultSet rset = k29_stmt.executeQuery("select * from examtable;");
		System.out.printf("  �̸�   �й�   ���� ���� ����\n");
		while (rset.next()) {
			System.out.printf("%4s  %6d  %3d  %3d  %3d \n", rset.getString(1), rset.getInt(2), rset.getInt(3), rset.getInt(4),rset.getInt(5));
		}
		rset.close();
		k29_stmt.close();
		k29_conn.close();
	}
}
