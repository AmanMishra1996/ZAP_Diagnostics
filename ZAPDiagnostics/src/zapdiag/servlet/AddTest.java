package zapdiag.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;

import zapdiag.dbutils.CrudOperation;

/**
 * Servlet implementation class AddTest
 */
@WebServlet("/AddTest")
public class AddTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection cn;
	private PreparedStatement ps;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTest() {
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
		
		String pathid= request.getParameter("pathid");
		String testname= request.getParameter("testname");
		String testcond= request.getParameter("testcond");
		String charges= request.getParameter("charges");
		
		//System.out.println(testid+pathid+testname+testcond+charges);
		
		
		  cn= CrudOperation.createConnection();
		    try 
		    {	
		    	String strinsert="insert into tests( pathologyId, testName, conditions, charges) values(?,?,?,?)";
		    	ps=cn.prepareStatement(strinsert);
		    	
		    	ps.setString(1, pathid);
		    	ps.setString(2, testname);
		    	ps.setString(3, testcond);
		    	ps.setString(4, charges);
		    	
		    	System.out.println(ps);
		    	int row=ps.executeUpdate();
		    	if(row>0)
		    	{
		    		System.out.println("row insterted");
		    		response.sendRedirect("/ZAPDiagnostics/jsp//workerhome.jsp");
		    	}
		    }
		    catch(SQLException se)
		    {
		    	System.out.println(se);
		    	
		    }
		
	}

}
