package com.Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import com.DB.ConnectorString;		
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/deleteJob")
public class DeleteJobServlet extends HttpServlet  {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		 int id = Integer.parseInt(request.getParameter("jobID"));
		    
		    try {
		      
		    	 ConnectorString C=new ConnectorString();
		   		 Class.forName("com.mysql.cj.jdbc.Driver");
		         Connection conn = DriverManager.getConnection(C.url, C.username, C.password);
		        PreparedStatement stmt = conn.prepareStatement("DELETE FROM JobApplication WHERE jobID = ?");
		        stmt.setInt(1, id);
		       
		        int rowsAffected = stmt.executeUpdate();
		        
		        stmt = conn.prepareStatement("DELETE FROM Job WHERE ID = ?");
		        stmt.setInt(1, id);
		       
		        rowsAffected = stmt.executeUpdate();
		        
		        if (rowsAffected > 0) {
		        	response.setContentType("text/html");
					PrintWriter out = response.getWriter();
					String message = "Job Deleted";
					String script = "<script>alert('" + message + "');window.location='PostedJobs.jsp?id="+request.getParameter("id")+"';</script>";
					out.println(script);
		        } else {
		           
		        	response.setContentType("text/html");
					PrintWriter out = response.getWriter();
					String message = "Error";
					String script = "<script>alert('" + message + "');window.location='PostedJobs.jsp?id="+request.getParameter("id")+"';</script>";
					out.println(script);
		        }
		        
		      
		        conn.close();
		    } catch (SQLException e) {
		        
		        response.getWriter().println("Error: " + e.getMessage());
		    } catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	}

}
