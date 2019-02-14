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

@WebServlet("/AddTips")
@MultipartConfig
public class AddTips extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection cn;
	private PreparedStatement ps;
       
    
    public AddTips() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		
		HttpSession hs = request.getSession(false);
		String userid = (String)hs.getAttribute("userkey");
		
		
		String subid=request.getParameter("subid");
		String contentid=request.getParameter("contentid");
	
		//String doctorid=request.getParameter("doctorid");
		java.util.Date sysdate=new java.util.Date();
		java.sql.Date sysdt=new java.sql.Date(sysdate.getTime());
		
		
		String path=getServletContext().getRealPath("/");		 
        System.out.println(path);
        
        String tippicsfolder = path + "tipPics";
        File npfolder = new File(tippicsfolder);
        if(!npfolder.exists())
		{
			
			npfolder.mkdir();
			
			
			
			
		}
        
        String newpath=path+"tipPics/"+subid.toLowerCase();
    	
		File f=new File(newpath);
			if(!f.exists())
			{
				
				f.mkdir();
			}
			
			System.out.println("directorycreated" );
			
			final Part filePart=request.getPart("picname");//to retrieve file with name
	    	final String fileName = getFileName(filePart);	
        
		
		
		
		  cn= CrudOperation.createConnection();
		    try 
		    {
		    	String strinserttip="insert into tips(subject, contents, date, doctorId,tipPic)values(?,?,?,?,?)";
		    	ps=cn.prepareStatement(strinserttip);
		    	
		    	ps.setString(1, subid);
		    	ps.setString(2, contentid);
		    	ps.setDate(3, sysdt);
		    	ps.setString(4, userid);
		    	ps.setString(5, fileName);
		    	
		    	System.out.println(ps);
		    	int row=ps.executeUpdate();
		    	if(row>0)
		    	{
		    		System.out.println("row insterted");
		    		response.sendRedirect("/ZAPDiagnostics/jsp/doctorhome.jsp");
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
