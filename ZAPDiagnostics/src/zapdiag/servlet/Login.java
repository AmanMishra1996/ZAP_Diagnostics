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
		
	String userid=	request.getParameter("userid");
	String userpassword=	request.getParameter("userpass");
	
	System.out.println(userid);
	System.out.println(userpassword);
	cn=CrudOperation.createConnection();
	String strsql="select * from logininfo where userId=? and userPass=?";
	try {
		pslogin=cn.prepareStatement(strsql);
		pslogin.setString(1, userid);
		pslogin.setString(2, userpassword);
		
		rs=pslogin.executeQuery();
		
			if(rs.next()) {
				
				HttpSession httpsession = request.getSession();//new session created
				httpsession.setAttribute("userkey", userid);
				
				

				
				String utype = rs.getString("usertype");
				
				httpsession.setAttribute("userkey_for_usertypevalidation", utype);
				if(utype.equals("superadmin")) {
					//httpsession.setAttribute("userkey_for_usertypevalidation", utype);
					response.sendRedirect("/ZAPDiagnostics/jsp/superadminhome.jsp");
					
				}
				
				if(utype.equals("admin")) {
					//httpsession.setAttribute("userkey_for_usertypevalidation", utype);
					response.sendRedirect("/ZAPDiagnostics/jsp/adminhome.jsp");	
					
				}
				
				if(utype.equals("doctor")) {
					//httpsession.setAttribute("userkey_for_usertypevalidation", utype);
					response.sendRedirect("/ZAPDiagnostics/jsp/doctorhome.jsp");
					
				}	
				
				if(utype.equals("worker")) {
					//httpsession.setAttribute("userkey_for_usertypevalidation", utype);
					response.sendRedirect("/ZAPDiagnostics/jsp/workerhome.jsp");	
					
				}	
				
				if(utype.equals("patient")) {
					//httpsession.setAttribute("userkey_for_usertypevalidation", utype);
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
