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

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import zapdiag.dbutils.CrudOperation;


@WebServlet("/AddNews")
@MultipartConfig
public class AddNews extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	private Connection cn;
	private PreparedStatement ps;
    public AddNews() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession hs = request.getSession(false);
		String userid = (String)hs.getAttribute("userkey");
		
		
		
		String subId = request.getParameter("subjectId");
		String message = request.getParameter("messageBox");
		//String doctorId = request.getParameter("doctorId");
		
		java.util.Date sysdate = new java.util.Date();
		java.sql.Date sysdt =  new java.sql.Date(sysdate.getTime());
		
		
		String path=getServletContext().getRealPath("/");		 
        System.out.println(path);
        
        String newspicsfolder = path + "newsPics";
        File npfolder = new File(newspicsfolder);
        
        
        String newpath=path+"newsPics/"+subId.toLowerCase();
        if(!npfolder.exists())
		{
			
			npfolder.mkdir();
			
			
			
			
		}
		File f=new File(newpath);
			if(!f.exists())
			{
				
				f.mkdir();
			}
			
			System.out.println("directorycreated" );
			
			final Part filePart=request.getPart("picname");//to retrieve file with name
	    	final String fileName = getFileName(filePart);	
		
		
		
		
		
		
		
		
		//System.out.println(subId+message+doctorId+sysdt);
		
		cn = CrudOperation.createConnection();
		try {
			String strinsert ="insert into news(title, contents, date,doctorId,newsPic) values(?,?,?,?,?)";
			ps = cn.prepareStatement(strinsert);
			ps.setString(1, subId);
			ps.setString(2, message);
			ps.setDate(3, sysdt);
			ps.setString(4, userid);
			ps.setString(5, fileName);
			int row =ps.executeUpdate();
			if(row>0) {
				System.out.println("Row Inserted");
				response.sendRedirect("/ZAPDiagnostics/jsp/doctorhome.jsp");
			}
			
			ps.close();
		}
		catch(SQLException se) {
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
