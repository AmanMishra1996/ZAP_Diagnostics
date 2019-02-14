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

/**
 * Servlet implementation class DeleteAdminPath
 */
@WebServlet("/DeleteAdminPath")
public class DeleteAdminPath extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection cn;
	private PreparedStatement ps,pse;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAdminPath() {
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
		System.out.println("pawanhu");	
		String pathid=request.getParameter("pid");
		System.out.println(pathid);
		
		cn=CrudOperation.createConnection();
		try {
			//cn.setAutoCommit(false);
		String 	strupdate="DELETE from pathology WHERE pathologyId=? ";
		ps=cn.prepareStatement(strupdate);
		ps.setString(1, pathid);
		
		
		
		
		int rw=ps.executeUpdate();
		ps.close();
		String strupdates="DELETE from logininfo WHERE userId=? and userType=?";
		pse=cn.prepareStatement(strupdates);
			pse.setString(1,pathid);
			pse.setString(2,"admin");
		int rwe=pse.executeUpdate();
		if(rw>0) {
			//cn.commit();
			System.out.println("Row Deleted");
			response.sendRedirect("/ZAPDiagnostics/jsp/adminviewpath.jsp");
		}
		
		ps.close();
		pse.close();
		
			
		
		}
		catch(SQLException  se)
		{
			System.out.println(se);
			
		}

	}

}
