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

/**
 * Servlet implementation class WEditAppointment
 */
@WebServlet("/WEditAppointment")
public class WEditAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection cn;
	private PreparedStatement ps;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WEditAppointment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid = request.getParameter("uid");
		String remark=	request.getParameter("changeremark");
		String status=	request.getParameter("changestatus");
		cn=CrudOperation.createConnection();
try {
			String strupdate ="update test_appointment set remarks=?,status=? where patientId=?";
			ps = cn.prepareStatement(strupdate);
			ps.setString(1, remark);
			ps.setString(2, status);
			ps.setString(3, userid);
			int row =ps.executeUpdate();
			if(row>0)
	    	{
	    		System.out.println("row inserted");
	    		response.sendRedirect("/ZAPDiagnostics/jsp/weditappointment.jsp");
	    	}
	    }
	    catch(SQLException se)
	    {
	    	System.out.println(se);
	    }
	}

}
