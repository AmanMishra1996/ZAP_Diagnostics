package zapdiag.servlet;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import zapdiag.dbutils.CrudOperation;


@WebServlet("/UploadReport")
@MultipartConfig
public class UploadReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PreparedStatement ps;
	Connection con;  
   
    public UploadReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path=getServletContext().getRealPath("/");   // getRealPath returns path of server
		System.out.println(path);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 response.setContentType("text/html;charset=UTF-8");
		 
		 	String workerid=	request.getParameter("workerid");
			String patientid=	request.getParameter("patientid");
			String testid=	request.getParameter("testid");
			String doctorid=	request.getParameter("doctorid");
			String reportremark=	request.getParameter("reportremark");
			String reportstatus=	request.getParameter("reportstatus");

			

		 ServletContext sc=getServletContext();
		 String path=sc.getRealPath("/");
		 
         System.out.println(path);

         String reportsfolder = path + "reports";
         
         
         File npfolder = new File(reportsfolder);
         if(!npfolder.exists())
		 {	
			npfolder.mkdir();	
		 }

	   String newpath=path+"reports/"+ patientid;
	
		File f=new File(newpath);
			if(!f.exists())
			{
				
				f.mkdir();
			}
			
			System.out.println("directorycreated" );
			
		
	/*String description = request.getParameter("txtdesc");
		System.out.println(description);*/
		
		final Part filePart = request.getPart("reportname");  //to retrieve file with name
	    	final String fileName = getFileName(filePart);
	    	
	    	
	    String strupdate="insert into patientreport(workerId,patientId,testId,reportName,doctorId,remarks,status)  value(?,?,?,?,?,?,?)";
	   
	   
	   try{
		   con=CrudOperation.createConnection();
		   ps=con.prepareStatement(strupdate);
		   ps.setString(1, workerid);
		   ps.setString(2, patientid);
		   ps.setString(3, testid);
		   ps.setString(4, fileName);
		   
		   
		   
		   ps.setString(5, doctorid);
		   ps.setString(6, reportremark);
		   ps.setString(7, reportstatus);
		   
		   System.out.println(ps);
		   int rw=ps.executeUpdate();
		   if(rw>0)
		   {
			   
		   System.out.println("picadded");
			   response.sendRedirect("/ZAPDiagnostics/jsp/workerhome.jsp");
		   }
		   
	   }
	    	catch(SQLException se)
	   {
	    		
	    		
	    		System.out.println(se);
	   }
	    
	   System.out.println(fileName);

	    OutputStream out = null;
	    InputStream filecontent = null;
	    final PrintWriter writer = response.getWriter();

	    try {
	        out = new FileOutputStream(new File(newpath + File.separator
	                + fileName));
	        filecontent = filePart.getInputStream();

	        int read = 0;
	        final byte[] bytes = new byte[1024];

	        while ((read = filecontent.read(bytes)) != -1) {
	            out.write(bytes, 0, read);
	        }
	// writer.println("New file " + fileName + " created at " + newpath);
	        
	    } catch (FileNotFoundException fne) {
	       
	        writer.println("<br/> ERROR: " + fne.getMessage());

	       
	    } finally {
	        if (out != null) {
	            out.close();
	        }
	        if (filecontent != null) {
	            filecontent.close();
	        }
	        if (writer != null) {
	            writer.close();
	        }
	    }
	
	}

	
	
	
	
	
	
	
	
	
	private String getFileName(final Part part) {
		
		
		
		
		 //   final String partHeader = part.getHeader("content-disposition");
		   
		    for (String content : part.getHeader("content-disposition").split(";")) {
		        if (content.trim().startsWith("filename")) {
		            return content.substring(
		                    content.indexOf('=') + 1).trim().replace("\"", "");
		        }
		    }
		    return null;
		}
	
	
	
	
	
	
}
