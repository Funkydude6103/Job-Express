package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DB.ConnectorString;

@WebServlet("/AdminApproveJob")
public class AdminAccept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		 String applicationID = (request.getParameter("jobid"));
	        Boolean status = true;
	        
	        try {
	           
	            ConnectorString C=new ConnectorString();
	    		Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection conn = DriverManager.getConnection(C.url, C.username, C.password);
	            String updateSql = "UPDATE Job SET approve=? WHERE ID=?";
	            PreparedStatement updateStmt = conn.prepareStatement(updateSql);
	            updateStmt.setBoolean(1, status);
	            updateStmt.setString(2, applicationID);
	            updateStmt.executeUpdate();
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
			String script = "<script>alert('" + message + "');window.location='ManageJob.jsp?id="+request.getParameter("id")+"';</script>";
			out.println(script);
		
	}



}
