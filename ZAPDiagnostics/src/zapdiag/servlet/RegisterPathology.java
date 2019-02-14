package zapdiag.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zapdiag.dbutils.CrudOperation;


@WebServlet("/RegisterPathology")
public class RegisterPathology extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection cn;
	private PreparedStatement psLoginInfo, psPathology;
    
       
  
    public RegisterPathology() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.sendRedirect("ZAPDiagnostics/jsp/doctorhome.jsp");
		
		String pathologyid=	request.getParameter("pathologyid");
		String pathologypassword=	request.getParameter("pathologypassword");
		String pathologyname=	request.getParameter("pathologyname");
		String pathologyaddress=	request.getParameter("pathologyaddress");
		String pathologyphone=	request.getParameter("pathologyphone");
		String pathologyemail=	request.getParameter("pathologyemail");
		
		//String doctorregistrationnum=request.getParameter("doctorregistrationnumber");
		
		String pathologyecity=	request.getParameter("pathologycity");
		
		String pathologyspeciality=	request.getParameter("pathologyspeciality");
		
		String pathologydescription=	request.getParameter("pathologydescription");
		
		
		
        
		
		
		//System.out.println(doctorid + doctorpassword +doctorregistrationnum+ doctorname+doctoraddress+doctorphone+doctoremail+doctorareaid+doctorskills+doctorqualifictions);
		
		cn=CrudOperation.createConnection();
		
try {
			
			cn.setAutoCommit(false);
			
			String strinsertLoginDetails ="insert into logininfo(userId, userPass, userType) values(?,?,?)";
			psLoginInfo = cn.prepareStatement(strinsertLoginDetails);
			psLoginInfo.setString(1, pathologyid);
			psLoginInfo.setString(2, pathologypassword);
			psLoginInfo.setString(3, "admin");
			int row =psLoginInfo.executeUpdate();
			
	
			String strinsertdoctor ="insert into pathology(pathologyId, name,address,phoneNo,email,city_id,speciality,description) values(?,?,?,?,?,?,?,?)";
			psPathology = cn.prepareStatement(strinsertdoctor);
			psPathology.setString(1, pathologyid);
			psPathology.setString(2, pathologyname);
			
			psPathology.setString(3, pathologyaddress);
			psPathology.setString(4, pathologyphone);
			psPathology.setString(5, pathologyemail);
			psPathology.setString(6, pathologyecity);
			psPathology.setString(7, pathologyspeciality);
			psPathology.setString(8, pathologydescription);
			

			int rows =psPathology.executeUpdate();
			
			
			
			
			if(row >0 && rows>0) {
				cn.commit();
				System.out.println("Row Inserted");
				response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");
			}
			
			psLoginInfo.close();
			psPathology.close();
			
		}
		catch(SQLException se) {
			
			System.out.println(se);
		}
		
		

		
		
		
		
		
	}

}
