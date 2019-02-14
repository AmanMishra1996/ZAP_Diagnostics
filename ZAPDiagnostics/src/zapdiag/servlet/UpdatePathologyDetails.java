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
import javax.servlet.http.HttpSession;

import zapdiag.dbutils.CrudOperation;
@WebServlet("/UpdatePathologyDetails")
public class UpdatePathologyDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection cn;
	private PreparedStatement ps;
    public UpdatePathologyDetails() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid=request.getParameter("pid");
		String name=request.getParameter("name");
		String address=request.getParameter("add");
		String phone=request.getParameter("phno");
		String email=request.getParameter("email");
		String area=request.getParameter("city");
		String regno=request.getParameter("regno");
		String skill=request.getParameter("skill");
		cn=CrudOperation.createConnection();
		try {
		String 	strupdate="update pathology set name=?,address=?,phoneNo=?,email=?,city_id=?, speciality=?,description=? where pathologyId=? ";
		ps=cn.prepareStatement(strupdate);
		
		//ps.setString(1, userid);
		ps.setString(1, name);
		ps.setString(2,address);
		ps.setString(3, phone);
		ps.setString(4,email);
		ps.setString(5, area);
		ps.setString(6, regno);
		ps.setString(7, skill);
		ps.setString(8, userid);
		
		int rw=ps.executeUpdate();
		if(rw>0) {
			
			System.out.println("Row updated");
			response.sendRedirect("/ZAPDiagnostics/jsp/updatepathologydetails.jsp");
		}
		
			
		System.out.println("pawanhu");	
		}
		catch(SQLException  se)
		{
			System.out.println(se);
			
		}

		
	}

}
