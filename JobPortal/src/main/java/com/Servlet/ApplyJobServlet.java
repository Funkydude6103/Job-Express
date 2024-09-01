package com.Servlet;
import com.Entity.JobSeeker;			
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ApplyJob")
public class ApplyJobServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		JobSeeker js= new JobSeeker();
		
		String answer=js.applyJob(request.getParameter("jobID"),request.getParameter("id"),request.getParameter("coverLetter"));
		if(answer=="Applied")
		{
			    response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				String message = "Applied";
				String script = "<script>alert('" + message + "');window.location='ViewJob.jsp?id="+request.getParameter("id")+"';</script>";
				out.println(script);
				
		}
		else
		{
			    response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				String message = "Error";
				String script = "<script>alert('" + message + "');window.location='ViewJob.jsp?id='"+request.getParameter("id")+"';</script>";
				out.println(script);
				
		}
		
		
	}

}
