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


@WebServlet("/AddDoctor")
public class AddDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection cn;
	private PreparedStatement psLoginInfo, psDoctor;
       
    
    public AddDoctor() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//	response.sendRedirect("ZAPDiagnostics/jsp/doctorhome.jsp");
		String doctorid=	request.getParameter("doctorid");
		String doctorpassword=	request.getParameter("doctorpassword");
		String doctorname=	request.getParameter("doctorname");
		String doctoraddress=	request.getParameter("doctoraddress");
		String doctorphone=	request.getParameter("doctorphone");
		String doctoremail=	request.getParameter("doctoremail");
		String doctorareaid=	request.getParameter("doctorareaid");
		String doctorregistrationnum=request.getParameter("doctorregistrationnumber");
        
		
		String[]doctorskil = request.getParameterValues("doctorskill");
		
		String doctorskills="";
		
		for(int i=0;i<doctorskil.length;i++) {
			doctorskills =doctorskills+ doctorskil[i]+",";
		}
		
		
        String[]doctorqualifiction = request.getParameterValues("doctorqualification");
		
		String doctorqualifictions="";
		for(int i=0;i<doctorqualifiction.length;i++) {
			doctorqualifictions =doctorqualifictions+ doctorqualifiction[i]+",";
		}
		
		String pathologyid=	request.getParameter("doctorpathologyid");
		
		//System.out.println(doctorid + doctorpassword +doctorregistrationnum+ doctorname+doctoraddress+doctorphone+doctoremail+doctorareaid+doctorskills+doctorqualifictions);
		
		cn=CrudOperation.createConnection();
		
try {
			
			cn.setAutoCommit(false);
			
			String strinsertLoginDetails ="insert into logininfo(userId, userPass, userType) values(?,?,?)";
			psLoginInfo = cn.prepareStatement(strinsertLoginDetails);
			psLoginInfo.setString(1, doctorid);
			psLoginInfo.setString(2, doctorpassword);
			psLoginInfo.setString(3, "doctor");
			
			int row =psLoginInfo.executeUpdate();
			
			
		
			psLoginInfo.close();
			String strinsertManagerDetails ="insert into doctor(doctorId, name,address,phoneNo,email,areaId,registrationNo,skills,higherQualification,pathologyId ) values(?,?,?,?,?,?,?,?,?,?)";
			psDoctor = cn.prepareStatement(strinsertManagerDetails);
			psDoctor.setString(1, doctorid);
			psDoctor.setString(2, doctorname);
			psDoctor.setString(3, doctoraddress);
			psDoctor.setString(4, doctorphone);
			psDoctor.setString(5, doctoremail);
			psDoctor.setString(6, doctorareaid);
			psDoctor.setString(7, doctorregistrationnum);
			psDoctor.setString(8, doctorskills);
			psDoctor.setString(9, doctorqualifictions);
			psDoctor.setString(10, pathologyid);
			
			
			int rows =psDoctor.executeUpdate();
			if(row >0 && rows>0) {
				cn.commit();
				System.out.println("Row Inserted");
				response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");
			}
			
			psLoginInfo.close();
			psDoctor.close();
			
		}
		catch(SQLException se) {
			
			System.out.println(se);
		}
		
		
		
	}

}
