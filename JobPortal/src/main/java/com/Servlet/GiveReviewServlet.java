package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Entity.Review;

@WebServlet("/GiveReview")
public class GiveReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String text=request.getParameter("review");
		String ratingParam = request.getParameter("rating");
		int rating = Integer.parseInt(ratingParam);
		String jid=request.getParameter("id");
		String eid=request.getParameter("EmpID");
		Review r=new Review(text,rating,jid,eid);
		r.Save();
	    response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				String message = "Review Recorded";
				String script = "<script>alert('" + message + "');window.location='AppliedJobs.jsp?id="+jid+"';</script>";
				out.println(script);
	}

}
