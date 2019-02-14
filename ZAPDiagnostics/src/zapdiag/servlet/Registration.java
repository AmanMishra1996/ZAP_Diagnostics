package zapdiag.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zapdiag.dbutils.CrudOperation;

//import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection cn;
	private PreparedStatement psLoginDatailsOfPatient, psPatientDetails;   
    
    public Registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        String user= request.getParameter("user");
		
		cn=CrudOperation.createConnection();
		String strsqle="select * from logininfo where userId=?";
		ResultSet rse = CrudOperation.getData(strsqle, user);
	//	PrintWriter out = new PrintWriter(null);
		PrintWriter out = response.getWriter();
		try {
			if(rse.next()) {
				 
				 out.println("UserId Already Exist");
				
			}
			else {
				out.println("");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String username=	request.getParameter("patid");
		
		String firstname=	request.getParameter("Name");
		String email=	request.getParameter("regEmail");
		String phone=	request.getParameter("regPh");
		String password=request.getParameter("pass");
		
		
		
	    
		java.util.Date sysdate = new java.util.Date();
		java.sql.Date sysdt =  new java.sql.Date(sysdate.getTime());
	    
	    
	    
	    
	    String city=request.getParameter("address");
	  
		cn=CrudOperation.createConnection();
		
		try {
			
			cn.setAutoCommit(false);
			
			String strinsertLoginDetails ="insert into logininfo(userId, userPass, userType) values(?,?,?)";
			psLoginDatailsOfPatient = cn.prepareStatement(strinsertLoginDetails);
			psLoginDatailsOfPatient.setString(1, username);
			psLoginDatailsOfPatient.setString(2, password);
			psLoginDatailsOfPatient.setString(3, "patient");
			
			
			int row =psLoginDatailsOfPatient.executeUpdate();
			
		
			psLoginDatailsOfPatient.close();
			
			String strinsertManagerDetails ="insert into patient(patientId, name,address,phoneNo,email,regDate ) values(?,?,?,?,?,?)";
			psPatientDetails = cn.prepareStatement(strinsertManagerDetails);
			psPatientDetails.setString(1, username);
			psPatientDetails.setString(2, firstname);
			psPatientDetails.setString(3, city);
			psPatientDetails.setString(4, phone);
			psPatientDetails.setString(5, email);
			
			psPatientDetails.setDate(6, sysdt);
			
			
			
			
			int rows =psPatientDetails.executeUpdate();
			if(  rows>0 && row>0) {
				cn.commit();
				System.out.println("Row Inserted");
				response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");
			}
			
			psLoginDatailsOfPatient.close();
			psPatientDetails.close();
			
		}
		catch(SQLException se) {
			
			System.out.println(se);
		}
		
	}

}
