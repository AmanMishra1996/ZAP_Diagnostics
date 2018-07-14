package zapdiag.dbutils;

import java.sql.*;
public class CrudOperation {
	
	private static Connection cn;
	
	/*private static PreparedStatement ps;
	
	private static ResultSet rs;*/

	public static Connection createConnection() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			cn= DriverManager.getConnection("jdbc:mysql://localhost:3306/zap_edp","root","MYSQL");
		}
		
		catch(SQLException |ClassNotFoundException cse) {
			System.out.println(cse);
			
		}
		
		return cn;
	
}
	
	
}
