package DB_1;

import java.sql.Connection;//DriverManager Ŭ������ static �޼����� getConnection() �޼��带 ȣ��
import java.sql.DriverManager; //����̹��ε带 ���� DriverManager�� import�Ѵ�.
import java.sql.SQLException;//throw ����ó���� ���� SQLException�� import
import java.sql.Statement;//Statement ��ü�� �����Ͽ� ���� �����ϱ� ���� Statement�� import

public class examtable_2 { //Ŭ������ ����.

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		//SQLException :SQL Server���� ��� �Ǵ� ������ ��ȯ�� �� throw�Ǵ� ����ó��
		// TODO Auto-generated method stub
		Class.forName("com.mysql.jdbc.Driver"); //Class.forName() �� �̿��ؼ� ����̹��� �ε��Ѵ�. Ŭ������ ��ã�� ��� ClassNotFoundException���� ó���� �Ѵ�.
		Connection k29_conn = DriverManager.getConnection("jdbc:mysql://192.168.23.97:33060/kopoctc", "root", "kopo29");
		// ����̹� �ε尡 �Ϸ�ƴٸ� ���� ��ü�� ��´�.
		Statement k29_stmt = k29_conn.createStatement(); //Connection ��ü�� createStatement() �޼��带 ȣ���Ͽ�, ������ ������ �� �ִ� Statement ��ü( stmt)�� ��´�.
		k29_stmt.execute("delete from examtable;"); //ResultSet�� ���� ���, execute method�� ����.
		k29_stmt.close(); //Statement�� �ݴ´�.
		k29_conn.close(); //Connection�� �ݴ´�.
	}//������ �ݴ´�.
}//Ŭ������ �ݴ´�.
