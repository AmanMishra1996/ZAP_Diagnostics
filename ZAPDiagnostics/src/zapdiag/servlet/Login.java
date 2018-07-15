package zapdiag.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import zapdiag.dbutils.CrudOperation;

import java.sql.*;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection cn;
	private PreparedStatement pslogin;
	private ResultSet rs;
	
       
    
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	String ui=	request.getParameter("txtuserid");
	String up=	request.getParameter("txtuserpass");
	
	System.out.println(ui);
	System.out.println(up);
	cn=CrudOperation.createConnection();
	String strsql="select * from logininfo where userId=? and userPass=?";
	try {
		pslogin=cn.prepareStatement(strsql);
		pslogin.setString(1, ui);
		pslogin.setString(2, up);
		
		rs=pslogin.executeQuery();
		
			if(rs.next()) {
				
				HttpSession hs = request.getSession();//new session created
						hs.setAttribute("userkey", ui);
				

				
				String utype = rs.getString("usertype");
				
				if(utype.equals("owner")) {
					response.sendRedirect("/ZAPDiagnostics/jsp/ownerhome.jsp");
				}
				
				if(utype.equals("superadmin")) {
					response.sendRedirect("/ZAPDiagnostics/jsp/superadminhome.jsp");
				}
				
				if(utype.equals("admin")) {
					response.sendRedirect("/ZAPDiagnostics/jsp/adminhome.jsp");	
				}
				
				if(utype.equals("doctor")) {
					response.sendRedirect("/ZAPDiagnostics/jsp/doctorhome.jsp");	
				}	
				
				if(utype.equals("worker")) {
					response.sendRedirect("/ZAPDiagnostics/jsp/workerhome.jsp");	
				}	
				
				if(utype.equals("patient")) {
					response.sendRedirect("/ZAPDiagnostics/jsp/patienthome.jsp");	
				}
				
				
			}
			else{
				//response.sendRedirect("/touristportal/jsp/login.jsp");
				//Servlet to jsp communication requires following code
				
				//request.setAttribute("ms","invalid userid or password" );
				RequestDispatcher rd = request.getRequestDispatcher("jsp/login.jsp");
				rd.forward(request, response);
				
			}
			pslogin.close();
			

		
	}
	catch(SQLException se) {
		System.out.println(se);
	}
	
	
	
	
	
	/*if(ui.equals("aman")&&up.equals("123456789")) {
		response.sendRedirect("/touristportal/jsp/welcome.jsp");
	}
	else {
		response.sendRedirect("/touristportal/jsp/login.jsp");
	}
	*/
	
		
	}

}
