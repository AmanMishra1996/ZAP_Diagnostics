package zapdiag.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import zapdiag.dbutils.CrudOperation;


@WebServlet("/AddDoctor")
public class AddDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection cn;
	private PreparedStatement psLoginInfo, psDoctor,psarea;
       
    
    public AddDoctor() {
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
	//	response.sendRedirect("ZAPDiagnostics/jsp/doctorhome.jsp");
		String doctorid=	request.getParameter("doctorid");
		String doctorpassword=	request.getParameter("doctorpassword");
		String doctorname=	request.getParameter("doctorname");
		String doctoraddress=	request.getParameter("doctoraddress");
		String doctorphone=	request.getParameter("doctorphone");
		String doctoremail=	request.getParameter("doctoremail");
		
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
		
		HttpSession hs=request.getSession(false);
		String pathologyid=(String)hs.getAttribute("userkey");
		
		//String pathologyid=	request.getParameter("userid");
		String doctorareaid=	request.getParameter("doctorareaid");
		String doctorareaname=	request.getParameter("doctorareaname");
		String doctorarearemarks=	request.getParameter("doctorarearemarks");
		
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
			
	
			String strinsertdoctor ="insert into doctor(doctorId, name,address,phoneNo,email,areaId,registrationNo,skills,higherQualification,pathologyId ) values(?,?,?,?,?,?,?,?,?,?)";
			psDoctor = cn.prepareStatement(strinsertdoctor);
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
			
			
			String strinsertarea ="insert into areas(areaId, areaName, remarks) values(?,?,?)";
			psarea = cn.prepareStatement(strinsertarea);
			psarea.setString(1, doctorareaid);
			psarea.setString(2, doctorareaname);
			psarea.setString(3, doctorarearemarks);
			
			int rowss =psarea.executeUpdate();
			
			
			
			
			
			
			if(row >0 && rows>0 && rowss>0) {
				cn.commit();
				System.out.println("Row Inserted");
				response.sendRedirect("/ZAPDiagnostics/jsp/viewdoctordetails.jsp");
			}
			
			psLoginInfo.close();
			psDoctor.close();
			
		}
		catch(SQLException se) {
			
			System.out.println(se);
		}
		
		
		
	}

}
