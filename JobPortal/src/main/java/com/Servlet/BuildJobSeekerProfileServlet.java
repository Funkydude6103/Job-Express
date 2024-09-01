package com.Servlet;
				
import java.io.File	;	
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Entity.*;
import com.DB.ConnectorString;


@MultipartConfig
@WebServlet("/BuildJobSeekerProfile")
public class BuildJobSeekerProfileServlet  extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	    int userID = Integer.parseInt(request.getParameter("id"));
	    Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
        	
        	JobSeeker js=new JobSeeker(request.getParameter("id"));
        	ConnectorString C=new ConnectorString();
    		 Class.forName("com.mysql.cj.jdbc.Driver");
             conn = DriverManager.getConnection(C.url, C.username, C.password);
             String query = "UPDATE JobSeeker SET education=?, employment=?, skills=?, languages=?, hobbies=?, qualities=?, resume=?, profilePhoto=? ,address=? ,DOB=?, Gender=? , linkedIn=?, phoneNumber=? WHERE userID=?";
             stmt = conn.prepareStatement(query);
             String str = js.getProfilePhoto();
             byte[] bytes=null;
             if(str!=null)
             {
                bytes = str.getBytes("UTF-8");
             }
             Blob profilePhotoBlob=null;	
             Blob resumeBlob=null;
             try {
            	 if(bytes!=null)
            	 profilePhotoBlob= new javax.sql.rowset.serial.SerialBlob(bytes);
            	 profilePhotoBlob.setBytes(1, bytes);
             } catch (SQLException e) {
                 e.printStackTrace();
             }
             if(js.getResume()!=null)
             {
            	resumeBlob=new javax.sql.rowset.serial.SerialBlob(js.getResume());
             }
            
            
             
             InputStream resume = request.getPart("resume").getInputStream();
             if (resume.available() > 0) {
                 byte[] resumeBytes = new byte[resume.available()];
                 resume.read(resumeBytes);
                 resumeBlob = new javax.sql.rowset.serial.SerialBlob(resumeBytes);
             }

             InputStream profilePhoto = request.getPart("profilePhoto").getInputStream();
             if (profilePhoto.available() > 0) {
                 byte[] profilePhotoBytes = new byte[profilePhoto.available()];
                 profilePhoto.read(profilePhotoBytes);
                 profilePhotoBlob = new javax.sql.rowset.serial.SerialBlob(profilePhotoBytes);
             }

             stmt.setString(1,request.getParameter("education"));
             stmt.setString(2, request.getParameter("employment"));
             stmt.setString(3, request.getParameter("skill"));
             stmt.setString(4,request.getParameter("languages"));
             stmt.setString(5, request.getParameter("hobbies"));
             stmt.setString(6, request.getParameter("qualities"));
             stmt.setBlob(7, resumeBlob);
             stmt.setBlob(8, profilePhotoBlob);
             stmt.setString(9, request.getParameter("address"));
             
             stmt.setString(10, request.getParameter("dob"));
             stmt.setString(11, request.getParameter("gender"));
             stmt.setString(12, request.getParameter("linkedIn"));
             stmt.setString(13, request.getParameter("phoneNumber"));
             stmt.setInt(14, userID);      
             int row=stmt.executeUpdate();
             if(row>0)
             {
            	  response.setContentType("text/html");
      			PrintWriter out = response.getWriter();
      			String message = "Updated";
      			String script = "<script>alert('" + message + "');window.location='ProfileJobSeeker.jsp?id="+userID+"';</script>";
      			out.println(script);
             }
             else
             {
            	  response.setContentType("text/html");
      			PrintWriter out = response.getWriter();
      			String message = "Error";
      			String script = "<script>alert('" + message + "');window.location='ProfileJobSeeker.jsp?id="+userID+"';</script>";
      			out.println(script);
            	 
             }
             
        } catch (SQLException e)
        {
            throw new RuntimeException("Error retrieving Job: " + e.getMessage(), e);
        } 
        catch (ClassNotFoundException e) 
        {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
        finally 
        {
            // Close the resources
            if (rs != null) {
                try { rs.close(); } catch (SQLException e) { /* ignored */ }
            }
            if (stmt != null) {
                try { stmt.close(); } catch (SQLException e) { /* ignored */ }
            }
            if (conn != null) {
                try { conn.close(); } catch (SQLException e) { /* ignored */ }
            }
        }
		
		

	}

}
