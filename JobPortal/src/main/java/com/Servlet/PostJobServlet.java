package com.Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import com.Entity.*;
import java.util.Date;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/PostJob")
public class PostJobServlet extends HttpServlet  {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		Job J = new Job(request.getParameter("title"),request.getParameter("description"),request.getParameter("location"),request.getParameter("salary"),request.getParameter("requirements"),new Date(),request.getParameter("status"),request.getParameter("category"),false);
		String id=request.getParameter("id");
		Employer E=new Employer();
		Boolean check=E.postJob(id,J);
		if(check)
		{
			  response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				String message = "Job Posted";
				String script = "<script>alert('" + message + "');window.location='Employer.jsp?id="+id+"';</script>";
				out.println(script);
		}
		else 
		{
			
		}
		
		
	}

}
