package DB_1;

import java.sql.Connection;//DriverManager Ŭ������ static �޼����� getConnection() �޼��带 ȣ��
import java.sql.DriverManager; //����̹��ε带 ���� DriverManager�� import�Ѵ�.
import java.sql.SQLException;//throw ����ó���� ���� SQLException�� import
import java.sql.Statement;//Statement ��ü�� �����Ͽ� ���� �����ϱ� ���� Statement�� import

public class examtable_1 {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Class.forName("com.mysql.jdbc.Driver"); //Class.forName() �� �̿��ؼ� ����̹��� �ε��Ѵ�. Ŭ������ ��ã�� ��� ClassNotFoundException���� ó���� �Ѵ�.
		Connection k29_conn = DriverManager.getConnection("jdbc:mysql://192.168.23.97:33060/kopoctc", "root", "kopo29");
		// ����̹� �ε尡 �Ϸ�ƴٸ� ���� ��ü�� ��´�.
		Statement k29_stmt = k29_conn.createStatement(); //Connection ��ü�� createStatement() �޼��带 ȣ���Ͽ�, ������ ������ �� �ִ� Statement ��ü(k29_stmt)�� ��´�.
		k29_stmt.execute("create table examtable(name varchar(20),studentid int not null primary key,kor int,eng int,mat int)"+
		//create table examtable=>�� �������� ������ �������� examtable�̶� �̸��� table ����
						"DEFAULT CHARSET=utf8;"); //�ѱ� �����Ǵ� utf8���ڸ� �⺻ ���ڵ� ���ڷ� ��.

		k29_stmt.close(); //Statement�� �ݴ´�.
		k29_conn.close(); //Connection�� �ݴ´�.
	}//������ �ݴ´�.
}//Ŭ������ �ݴ´�.
