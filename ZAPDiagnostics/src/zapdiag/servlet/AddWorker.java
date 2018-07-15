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

@WebServlet("/AddWorker")
public class AddWorker extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection cn;
	private PreparedStatement psLoginInfo, pspathologyWorker;
       
       
    
    public AddWorker() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String workerid=	request.getParameter("workerid");
		String workerpassword=	request.getParameter("workerpassword");
		String workername=	request.getParameter("workerrname");
		String workeraddress=	request.getParameter("workeraddress");
		String workerphone=	request.getParameter("workerphone");
		String workeremail=	request.getParameter("workeremail");
		String workercity=	request.getParameter("workercity");
		String workerpathologyid=	request.getParameter("workerpathologyid");
        
		//System.out.println(workeraddress+workercity+workeremail+workerid+workername+workerpassword+workerphone+workerpathologyid);
		
		
		
		
		
	cn=CrudOperation.createConnection();
		
try {
			
			cn.setAutoCommit(false);
			
			String strinsertLoginDetails ="insert into logininfo(userId, userPass, userType) values(?,?,?)";
			psLoginInfo = cn.prepareStatement(strinsertLoginDetails);
			psLoginInfo.setString(1, workerid);
			psLoginInfo.setString(2, workerpassword);
			psLoginInfo.setString(3, "worker");
			
			int row =psLoginInfo.executeUpdate();
			
			
		
			psLoginInfo.close();
			String strinsertManagerDetails ="insert into pathologyworker(workerId,pathologyId , name,address,phoneNo,email,city) values(?,?,?,?,?,?,?)";
			pspathologyWorker = cn.prepareStatement(strinsertManagerDetails);
			pspathologyWorker.setString(1, workerid);
			pspathologyWorker.setString(2, workerpathologyid);
			pspathologyWorker.setString(3,workername );
			pspathologyWorker.setString(4,workeraddress);
			pspathologyWorker.setString(5, workerphone);
			pspathologyWorker.setString(6, workeremail );
			pspathologyWorker.setString(7, workercity);
			
			
			
			int rows =pspathologyWorker.executeUpdate();
			if(row >0 && rows>0) {
				cn.commit();
				System.out.println("Row Inserted");
				response.sendRedirect("/ZAPDiagnostics/jsp/login.jsp");
			}
			
			psLoginInfo.close();
			pspathologyWorker.close();
			
		}
		catch(SQLException se) {
			
			System.out.println(se);
		}
		
	

		
		
		
	}

}
