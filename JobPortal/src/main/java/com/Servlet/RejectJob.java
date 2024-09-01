package com.Servlet;
import com.DB.ConnectorString;	
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RejectJob")
public class RejectJob extends HttpServlet  {
	private static final long serialVersionUID = 1L;
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		 String applicationID = (request.getParameter("appID"));
	        String status = "Rejected";
	        String jobID=null;
	        
	        try {
	           
	            ConnectorString C=new ConnectorString();
	    		Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection conn = DriverManager.getConnection(C.url, C.username, C.password);
	            String updateSql = "UPDATE JobApplication SET applicationStatus=? WHERE ID=?";
	            PreparedStatement updateStmt = conn.prepareStatement(updateSql);
	            updateStmt.setString(1, status);
	            updateStmt.setString(2, applicationID);
	            updateStmt.executeUpdate();
	            String Sql = "select jobID from JobApplication WHERE ID=?";
	            PreparedStatement Stmt = conn.prepareStatement(Sql);
	            Stmt.setString(1, applicationID);
	            ResultSet rs=Stmt.executeQuery();
	            
	            if(rs.next())
	            {
	            	jobID = rs.getString("jobID");
	            }
	            
	      
	            conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	            // Handle database errors
	        } catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        
	        response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String message = "Request Accepted";
			String script = "<script>alert('" + message + "');window.location='JobApplication.jsp?id="+request.getParameter("id")+"&jobID="+jobID+"';</script>";
			out.println(script);
	
	
	}

}
