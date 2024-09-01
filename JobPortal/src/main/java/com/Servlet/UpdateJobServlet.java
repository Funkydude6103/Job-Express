package com.Servlet;
import com.DB.ConnectorString;				
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet("/UpdateJob")
public class UpdateJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		 // Get the form values
	    String id = request.getParameter("jobID");
	    String title = request.getParameter("title");
	    String description = request.getParameter("description");
	    String location = request.getParameter("location");
	    int salary = Integer.parseInt(request.getParameter("salary"));
	    String requirements = request.getParameter("requirements");
	    String status = request.getParameter("status");
	    String category = request.getParameter("category");
	    
	    // Update the job in the database
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    
	    try {
	     
	    	ConnectorString C=new ConnectorString();
   		     Class.forName("com.mysql.cj.jdbc.Driver");
   		     Boolean f=false;
            conn = DriverManager.getConnection(C.url, C.username, C.password);
	        String sql = "UPDATE Job SET title=?, description=?, location=?, salary=?, requirements=?, status=?, category=?, approve=0 WHERE ID=?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, title);
	        pstmt.setString(2, description);
	        pstmt.setString(3, location);
	        pstmt.setInt(4, salary);
	        pstmt.setString(5, requirements);
	        pstmt.setString(6, status);
	        pstmt.setString(7, category);
	        
	        pstmt.setString(8, id);
	        

	        int rowsUpdated = pstmt.executeUpdate();
	        
	        if (rowsUpdated > 0) {
	        	  response.setContentType("text/html");
					PrintWriter out = response.getWriter();
					String message = "Job Updated";
					String script = "<script>alert('" + message + "');window.location='PostedJobs.jsp?id="+request.getParameter("id")+"';</script>";
					out.println(script);
	        	
	          
	        } 
	        else 
	        {
	        	 response.setContentType("text/html");
					PrintWriter out = response.getWriter();
					String message = "Error";
					String script = "<script>alert('" + message + "');window.location='PostedJobs.jsp?id="+request.getParameter("id")+"';</script>";
					out.println(script);
	            
	        }
	    } catch (SQLException e) {
	        // Handle SQL exception
	        // ...
	    } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
	

}
