package DB_1;

import java.sql.Connection; //DriverManager Ŭ������ static �޼����� getConnection() �޼��带 ȣ��
import java.sql.DriverManager; //����̹��ε带 ���� DriverManager�� import�Ѵ�.
import java.sql.ResultSet; //execteQuery�� ���� ��ȯ���� ���� ���� ResultSet�� import
import java.sql.SQLException;//throw ����ó���� ���� SQLException�� import
import java.sql.Statement;//Statement ��ü�� �����Ͽ� ���� �����ϱ� ���� Statement�� import

public class db_test {

	public static void main(String[] args) throws ClassNotFoundException, SQLException { 
		//ClassNotFoundException : �������� Ŭ������ ���ڿ��� �ε��� �õ��ϴٰ� Ŭ������ ���� ��� �߻�, �̶� throw ����ó��
		//SQLException :SQL Server���� ��� �Ǵ� ������ ��ȯ�� �� throw�Ǵ� ����ó��
		// TODO Auto-generated method stub
	Class.forName("com.mysql.jdbc.Driver"); //Class.forName() �� �̿��ؼ� ����̹��� �ε��Ѵ�.
	Connection k29_conn = DriverManager.getConnection("jdbc:mysql://192.168.23.97:33060/kopoctc", "root", "kopo29");
	// ����̹� �ε尡 �Ϸ�ƴٸ� ���� ��ü�� ��´�.
	Statement k29_stmt = k29_conn.createStatement();
	//������ �Ϸ� �ƴٸ� ���൵���� �����Ѵ�.
	ResultSet k29_rset = k29_stmt.executeQuery("show databases;");
	//������ ���� �� �� ����� rset ������ ��´�.ResultSet�� execteQuery�� ���� ��ȯ���̶� �����ϸ� �ȴ�. �տ� �빮�� R.
	while (k29_rset.next()) { //rset�� ��� �ڷ���� Before of FIle ���� End of FIle�� ����ų �� ���� ���������� ����Ű�鼭 �ڷḦ ����� �غ� �Ѵ�
		System.out.println("�� : " +k29_rset.getString(1)); //re.next();�� ���� �� ���� ������ �ڷ�(���ڵ�)�� �Ӽ����� get�Ͽ� Java �ڵ忡 �����Ѵ�.
	}//�ݺ����� �����Ѵ�. 
	k29_rset.close(); //�ݺ����� ����Ǹ� ResultSet�� �ݴ´�. 
	k29_stmt.close(); //Statement�� �ݴ´�. 
	k29_conn.close(); //Connection�� �ݴ´�.
	}//������ �ݴ´�.
}//Ŭ������ �ݴ´�.
