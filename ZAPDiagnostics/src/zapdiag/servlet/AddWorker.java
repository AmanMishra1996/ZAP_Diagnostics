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

//import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import zapdiag.dbutils.CrudOperation;


@WebServlet("/AddWorker")
@MultipartConfig
public class AddWorker extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PreparedStatement psLoginInfo,pspathologyWorker;
	Connection cn;  
   
    public AddWorker() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path=getServletContext().getRealPath("/");   // getRealPath returns path of server
		System.out.println(path);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// response.setContentType("text/html;charset=UTF-8");
		 
		String workerid=	request.getParameter("workerid");
		String workerpassword=	request.getParameter("workerpassword");
		String workername=	request.getParameter("workerrname");
		String workeraddress=	request.getParameter("workeraddress");
		String workerphone=	request.getParameter("workerphone");
		String workeremail=	request.getParameter("workeremail");
		String workercity=	request.getParameter("workercity");
		//String workerpathologyid=	request.getParameter("workerpathologyid");
		HttpSession hs=request.getSession(false);
		String workerpathologyid=(String)hs.getAttribute("userkey");
		 	
		String workertype=	request.getParameter("workertype");
		 
		 String path=getServletContext().getRealPath("/");
		 
         System.out.println(path);

        String profilepicsfolder = path + "profilepics";
         File npfolder = new File(profilepicsfolder);
          if(!npfolder.exists())
		 {	
			npfolder.mkdir();	
		 }
        

		
	   String newpath=path+"profilepics/"+workerid;
	
		File f=new File(newpath);
			if(!f.exists())
			{
				
				f.mkdir();
			}
			
			System.out.println("directorycreated" );
			
		
	/*String description = request.getParameter("txtdesc");
		System.out.println(description);*/
		
			final Part filePart=request.getPart("picname");//to retrieve file with name
	    	final String fileName = getFileName(filePart);
	    	cn=CrudOperation.createConnection();

	   try{
		   cn.setAutoCommit(false);
		   String strinsertLoginDetails ="insert into logininfo(userId, userPass, userType) values(?,?,?)";
			psLoginInfo = cn.prepareStatement(strinsertLoginDetails);
			psLoginInfo.setString(1, workerid);
			psLoginInfo.setString(2, workerpassword);
			psLoginInfo.setString(3, "worker");
			System.out.println(psLoginInfo);
			
			int row =psLoginInfo.executeUpdate();
			
			psLoginInfo.close();
			String strinsertManagerDetails ="insert into pathologyworker(workerId,pathologyId , name,address,phoneNo,email,city_id,photo,workertype) values(?,?,?,?,?,?,?,?,?)";
			pspathologyWorker = cn.prepareStatement(strinsertManagerDetails);
			pspathologyWorker.setString(1, workerid);
			pspathologyWorker.setString(2, workerpathologyid);
			pspathologyWorker.setString(3,workername );
			pspathologyWorker.setString(4,workeraddress);
			pspathologyWorker.setString(5, workerphone);
			pspathologyWorker.setString(6, workeremail );
			pspathologyWorker.setString(7, workercity);
			pspathologyWorker.setString(8, fileName);
			pspathologyWorker.setString(9, workertype);
			System.out.println(pspathologyWorker);
			
			
			int rows =pspathologyWorker.executeUpdate();
			if(row >0 && rows>0) {
				cn.commit();
				System.out.println("picadded");
				System.out.println("Row Inserted");
				response.sendRedirect("/ZAPDiagnostics/jsp/viewworkerdetails.jsp");
			}
			
			psLoginInfo.close();
			pspathologyWorker.close();
				
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
