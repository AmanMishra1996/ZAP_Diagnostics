package zapdiag.servlet;

import java.io.IOException;
import zapdiag.dbutils.CrudOperation;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class UpdatePatientProfile
 */
@WebServlet("/UpdatePatientProfile")
public class UpdatePatientProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection cn;
	private PreparedStatement ps;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePatientProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession(false);
		String userid=(String)hs.getAttribute("userkey");
		String name=request.getParameter("name");
		String address=request.getParameter("add");
		String phone=request.getParameter("phno");
		String email=request.getParameter("email");
		String area=request.getParameter("regd");
		cn=CrudOperation.createConnection();
		try {
		String 	strupdate="update patient set name=?,address=?,phoneNo=?,email=?,regDate=? where patientId=? ";
		ps=cn.prepareStatement(strupdate);
		
		//ps.setString(1, userid);
		ps.setString(1, name);
		ps.setString(2,address);
		ps.setString(3, phone);
		ps.setString(4,email);
		ps.setString(5, area);
		ps.setString(6, userid);
		
		int rw=ps.executeUpdate();
		if(rw>0) {
			
			System.out.println("Row Inserted");
			response.sendRedirect("/ZAPDiagnostics/jsp/patientprofile.jsp");
		}
		
			
		System.out.println("pawanhu");	
		}
		catch(SQLException  se)
		{
			System.out.println(se);
			
		}
	}

}
