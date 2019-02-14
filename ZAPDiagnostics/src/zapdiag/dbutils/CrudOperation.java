package zapdiag.dbutils;

import java.sql.*;
import java.util.ResourceBundle;
public class CrudOperation {	
	private static Connection cn;
	private static PreparedStatement ps;	
	private static ResultSet rs;
		
	public static ResultSet getData (String sql,String id,String ids) {
		cn = createConnection();
		try {
			ps=cn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, ids);
			rs=ps.executeQuery();
		}
		catch(SQLException se){
			System.out.println(se);
		}
		return rs;
		
	}
	
	
	public static ResultSet getData (String sql,String id) {
		cn = createConnection();
		try {
			ps=cn.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
		}
		catch(SQLException se){
			System.out.println(se);
		}
		return rs;
		
	}
	
		
	public static ResultSet getData (String sql,int id) {
		cn = createConnection();
		try {
			ps=cn.prepareStatement(sql);
			ps.setInt(1, id);
			rs=ps.executeQuery();
		}
		catch(SQLException se){
			System.out.println(se);
		}
		return rs;
		
	}
	

	public static ResultSet getData (String sql) {
		cn = createConnection();
		try {
			ps=cn.prepareStatement(sql);
			rs=ps.executeQuery();
		}
		catch(SQLException se){
			System.out.println(se);
		}
		return rs;
		
	}
	
	
	public static Connection createConnection() {
		ResourceBundle resource_bundle = ResourceBundle.getBundle("/zapdiag/dbinfo/propertiesfile");//getting reference of
		String databaseuserid    = resource_bundle.getString("app.dbuserid");
		String databaseuserpassword  = resource_bundle.getString("app.dbuserpass");
		String url     =resource_bundle.getString("app.url");
		try {
			Class.forName("com.mysql.jdbc.Driver");			
			cn= DriverManager.getConnection(url,databaseuserid,databaseuserpassword);
		}
		
		catch(SQLException |ClassNotFoundException cse) {
			System.out.println(cse);
			
		}
		
		return cn;	
	}
	
}
