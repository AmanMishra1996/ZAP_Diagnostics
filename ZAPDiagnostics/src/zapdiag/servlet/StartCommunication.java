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

@WebServlet("/StartCommunication")
public class StartCommunication extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection cn;
	private PreparedStatement ps,pse;
	
    public StartCommunication() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession(false);
		String userid=(String)hs.getAttribute("userkey");
		String receiverid=request.getParameter("rid");
		String subject=request.getParameter("sub");
		String message=request.getParameter("msg");
		java.util.Date sysdate = new java.util.Date();
		java.sql.Date sysdt =  new java.sql.Date(sysdate.getTime());
cn=CrudOperation.createConnection();
   

System.out.println(receiverid+" "+subject+" "+message);

		
		try {
			
			cn.setAutoCommit(false);
			
			String strinsertsentitems ="insert into sentitems(senderId,recieverId,subject,message,dateOFMessage) values(?,?,?,?,?)";
			ps = cn.prepareStatement(strinsertsentitems);
			ps.setString(1, userid);
			ps.setString(2, receiverid);
			ps.setString(3, subject);
			ps.setString(4, message);
			ps.setDate(5, sysdt);
			
			
			int row =ps.executeUpdate();
			
		
			ps.close();
			
			String strinsertinbox ="insert into inbox(senderId,recieverId,subject,message,dateOFMessage ) values(?,?,?,?,?)";
			pse = cn.prepareStatement(strinsertinbox);
			pse.setString(1, userid);
			pse.setString(2, receiverid);
			pse.setString(3, subject);
			pse.setString(4, message);
			pse.setDate(5, sysdt);
			System.out.println(userid + receiverid + subject +message+ sysdt);
			
			
			
			
			int rows =pse.executeUpdate();
			if(  rows>0 && row>0) {
				cn.commit();
				System.out.println("Row Inserted");
				response.sendRedirect("/ZAPDiagnostics/jsp/startcommunication.jsp");
			}
			pse.close();
			ps.close();
			
			
		}
		catch(SQLException se) {
			
			System.out.println(se);
		}

	}

}
