package com.Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.DB.ConnectorString;


@WebServlet("/BuildEmployerProfile")
public class BuildEmployerProfile  extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userID = request.getParameter("id");
        String companyName = request.getParameter("companyName");
        String companyDescription = request.getParameter("companyDescription");
        String address = request.getParameter("address");
        String linkedIn = request.getParameter("linkedIn");
        String introduction = request.getParameter("introduction");
        String missionStatement = request.getParameter("missionStatement");
        String vision = request.getParameter("vision");
        
        Connection connection = null;
        PreparedStatement statement = null;
        try {
        	  ConnectorString C=new ConnectorString();
   		    Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(C.url, C.username, C.password);
            String sql = "UPDATE Employer SET companyName=?, companyDescription=?, address=?, linkedIn=?, "
                       + "introduction=?, missionStatement=?, vision=? WHERE userID=?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, companyName);
            statement.setString(2, companyDescription);
            statement.setString(3, address);
            statement.setString(4, linkedIn);
            statement.setString(5, introduction);
            statement.setString(6, missionStatement);
            statement.setString(7, vision);
            statement.setString(8, userID);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
  	  response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String message = "Updated";
		String script = "<script>alert('" + message + "');window.location='EmployerProfile.jsp?id="+userID+"';</script>";
		out.println(script);
	
	}
	
}
