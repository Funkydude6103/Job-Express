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

@WebServlet("/Register")
public class RegisterationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String email = request.getParameter("reg_E");
	    String password = request.getParameter("reg_P");
	    String name = request.getParameter("reg_U");
	    int age = Integer.parseInt(request.getParameter("reg_A"));
	    int userID=-1;
	    String role = request.getParameter("user_type");
	    String query = "SELECT * FROM User WHERE email = ?";
	    ResultSet resultSet=null;
	    try 
	    {
	    	{
	    ConnectorString C=new ConnectorString();
		Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(C.url, C.username, C.password);
	    PreparedStatement statement = conn.prepareStatement(query);
	    statement.setString(1, email);
	    resultSet = statement.executeQuery();
	    	}
	    if (resultSet.next()) 
	    {
	    	response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String message = "Email Already Registered";
			String script = "<script>alert('" + message + "');window.location='Login-Registration.jsp';</script>";
			out.println(script);
	    } 
	    else 
	    {
	    ConnectorString C=new ConnectorString();
	 	Class.forName("com.mysql.cj.jdbc.Driver");
	 	query="INSERT INTO User (email, password, name, age, role) VALUES (?, ?, ?, ?, ?)";
        Connection conn = DriverManager.getConnection(C.url, C.username, C.password);
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        stmt.setString(1, email);
        stmt.setString(2, password);
        stmt.setString(3, name);
        stmt.setInt(4, age);
        stmt.setString(5, role);
        stmt.executeUpdate();
        resultSet = stmt.getGeneratedKeys();
        
        String getUserIdSql = "SELECT ID from User where email='"+email+"'";
        stmt = conn.prepareStatement(getUserIdSql);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) 
        {
            userID = rs.getInt(1);
        }
        
        if (role.equals("Job Seeker"))
        {
        	query="INSERT INTO JobSeeker (userID,Gender) VALUES (?,?)";
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, userID);
            stmt.setString(2,"M");
            stmt.executeUpdate();
            response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String message = "Job Seeker Account Created	";
			String script = "<script>alert('" + message + "');window.location='Login-Registration.jsp';</script>";
			out.println(script);
            
        }
        if (role.equals("Employer"))
        {
        	query="INSERT INTO Employer (userID) VALUES (?)";
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, userID);
            stmt.executeUpdate();
            response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String message = "Employer Account created";
			String script = "<script>alert('" + message + "');window.location='Login-Registration.jsp';</script>";
			out.println(script);
            
        }
	    }
	    }
	    catch (SQLException e)
	    {
	    	System.out.println("Error: " + e.getMessage());
	    }
	    catch (ClassNotFoundException e) 
   	    {
	    	System.out.println("Error: " + e.getMessage());
		}
		
		
	}

}
