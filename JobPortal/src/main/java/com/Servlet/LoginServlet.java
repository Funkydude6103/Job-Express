package com.Servlet;
import com.Entity.User;					
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("Username");
		String Password=request.getParameter("Password");
		User u=new User();
		String ret=u.login(name, Password);
		if(ret!="denied")
		{
        String[] separatedStrings = ret.split(",");
        String id = separatedStrings[0];
        String role = separatedStrings[1];
        if(role.contentEquals("Job Seeker"))
        {
		response.sendRedirect("JobSeeker.jsp?id="+id);
        }
        else if(role.contentEquals("Employer"))
        {
		response.sendRedirect("Employer.jsp?id="+id);
        }
        else if(role.contentEquals("Admin"))
        {
		response.sendRedirect("Admin.jsp?id="+id);
        }
		}
		else
		{
		//HttpSession session=request.getSession();
		//session.setAttribute("succMsg", "Wrong Credentials");
	   response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String message = "Wrong Credentials";
			String script = "<script>alert('" + message + "');window.location='Login-Registration.jsp';</script>";
			out.println(script);
			
		}	
        
        
	}

}
