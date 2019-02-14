package zapdiag.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zapdiag.dbutils.CrudOperation;


@WebServlet("/BookAppointment")
public class BookAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	private PreparedStatement pstest_appointmentInfo;
    public BookAppointment() {
        super();
        // TODO Auto-generated constructor stub
    }    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String patientid=	request.getParameter("patientid");
		String testid=	request.getParameter("cmbcity");
		String workersid="";		
		String getworkerId="Select workerId from pathologyworker where workertype='appointment' and pathologyId=(select pathologyId from tests where testId=?)";
		ResultSet  rsgetworkerId =CrudOperation.getData(getworkerId, testid);
		try {
			while( rsgetworkerId.next()) {
				workersid = rsgetworkerId.getString("workerId");
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}		
		
		
		String dateofappointment = request.getParameter("testdate");
	    SimpleDateFormat sd = new SimpleDateFormat("yyyy-mm-dd");
	    java.util.Date dt=null;
	    java.sql.Date sqdate = null;
			    try {
					dt = sd.parse(dateofappointment);
				} catch (ParseException e) {
					
					e.printStackTrace();
				}
		long d= dt.getTime();			    
		sqdate = new java.sql.Date(d);

       connection=CrudOperation.createConnection();
		
		try {
			
			//connection.setAutoCommit(false);
			
			String strinserttestappointment ="insert into test_appointment(patientId, testId,date,workerId,status) values(?,?,?,?,?)";
			pstest_appointmentInfo = connection.prepareStatement(strinserttestappointment);
			pstest_appointmentInfo.setString(1, patientid);
			pstest_appointmentInfo.setString(2, testid);
			pstest_appointmentInfo.setDate(3, sqdate);
			pstest_appointmentInfo.setString(4, workersid);
			pstest_appointmentInfo.setString(5, "false");
			
			int row =pstest_appointmentInfo.executeUpdate();

			
			if(row >0 ) {
				//connection.commit();
				System.out.println("Row Inserted");
				response.sendRedirect("/ZAPDiagnostics/jsp/patienthome.jsp");
			}
			
			
			pstest_appointmentInfo.close();
			
		}
		catch(SQLException se) {
			
			System.out.println(se);
		}
		
	
	}

}
