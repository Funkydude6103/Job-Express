<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="com.Entity.JobSeeker"%>
<%@page import="com.Entity.Job"%>
<%@page import="java.util.Vector"%>
<%@page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <style>
        .intro img{
    position: absolute;
    width:1520px;
    height:650px;
    opacity:0.9;
    z-index: 0;
}
.intro p1 {
    position: absolute;
    margin-top: 0px;
    margin-left: 100px;
    font-weight: 700;
    width: 800px;
    text-align:start;
    color: #2ee8b6;
    font-size: 24px;
  }
  .intro h1{
    margin-bottom: 0px;
    color: white;
    text-align: start;
    width: 500px;
  }
 
* {
	box-sizing: border-box;
}
body {
	font-family: 'Montserrat', sans-serif;
	line-height: 1.6;
	margin: 0;
	min-height: 100vh;
    background-color: #F2eeeb;
  
}
ul {
  margin: 0;
  padding: 0;
  list-style: none;
}
.maindiv
{
margin-top: 20px;
    width: fit-content;
    height: fit-content;
}

h2,
h3,
a {
	color: #F2eeeb;
    margin-left: 30px
}

a {
	text-decoration: none;
}



.logo {
	margin-left: 0;
	font-size: 1.45em;
}

.main-nav {
	margin-top: 5px;

}
.logo a,
.main-nav a {
	padding: 10px 15px;
	text-transform: uppercase;
	text-align: center;
	display: block;
}

.main-nav a {
   
	color: #F2eeeb;
	font-size: .99em;
}

.main-nav a:hover {
	color: #2ee8b6;
}



.header {
	padding-top: .5em;
	padding-bottom: .5em;
	border: 1px solid #a2a2a2;
	background-color: #412b76;
	-webkit-box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.75);
	-moz-box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.75);
	box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.75);
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}


/* ================================= 
  Media Queries
==================================== */




@media (min-width: 769px) {
	.header,
	.main-nav {
		display: flex;
	}
	.header {
		flex-direction: column;
		align-items: center;


}
}

@media (min-width: 1025px) {
	.header {
		flex-direction: row;
		justify-content: space-between;
	}

}
/* Style for the page header */
h1.special-heading {
  font-size: 36px;
  text-align: center;
  margin-top: 50px;
}

/* Style for the section headers */
h2.special-heading {
  font-size: 24px;
  margin-top: 30px;
  color:black;
}

/* Style for the tables */
table {
  border-collapse: collapse;
  width: 100%;
  margin-top: 20px;
}

th, td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: left;
}

th {
  background-color: #007bff;
  color: #fff;
}

a.job-action-link { 
   color: #007bff;
   text-decoration: none; 
}

a:hover {
  text-decoration: underline;
}

/* Style for the approve and reject links */
a.approve, a.reject {
  color: #28a745;
}

a.approve:hover, a.reject:hover {
  text-decoration: none;
  color: #fff;
}

a.approve {
  background-color: #28a745;
  padding: 6px 10px;
  border-radius: 5px;
}

a.reject {
  background-color: #dc3545;
  padding: 6px 10px;
  border-radius: 5px;
}

/* Style for the view and delete links */
a.view, a.delete {
  color: #007bff;
}

a.view:hover, a.delete:hover {
  text-decoration: none;
  color: #fff;
}

a.view {
  background-color: #007bff;
  padding: 6px 10px;
  border-radius: 5px;
}

a.delete {
  background-color: #dc3545;
  padding: 6px 10px;
  border-radius: 5px;
}

    </style>
</head>
<body>
    <header class="header">
		<h1 class="logo"><a href="#">JOB EXPRESS</a></h1>
      <ul class="main-nav">
       <li><a href="Admin.jsp?id=<%=request.getParameter("id")%>">Home</a></li>
          <li><a href="ManageJob.jsp?id=<%=request.getParameter("id")%>">Manage Jobs</a></li>
          <li><a href="Insight.jsp?id=<%=request.getParameter("id")%>">Insights</a></li>
           <li><a href="Login-Registration.jsp">Logout</a></li>
      </ul>
	</header> 
	
	<h1 class="special-heading">Job Listings - Admin Panel</h1>

	<%
		

	      JobSeeker js=new JobSeeker();
         Vector<Job> jobs=js.adminViewJobs();
		// Filter jobs by approval status (false = not approved)
		Vector<Job> unapprovedJobs = new Vector<Job>();
		Vector<Job> approvedJobs = new Vector<Job>();
		for (Job job : jobs) {
			if (!job.getApprove()) {
				unapprovedJobs.add(job);
			} else {
				approvedJobs.add(job);
			}
		}
	%>

	<h2 class="special-heading">Unapproved Jobs</h2>
	<table>
		<tr>
			<th>ID</th>
			<th>Title</th>
			<th>Location</th>
			<th>Category</th>
			<th>Date Posted</th>
			<th>Action</th>
		</tr>
		<%
			// Display unapproved jobs
			for (Job job : unapprovedJobs) {
				// Format date
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				String datePosted = dateFormat.format(job.getDatePosted());

				// Create links for actions
				String approveLink = "AdminApproveJob?jobid=" + job.getID()+"&id="+request.getParameter("id");
				String viewLink = "AdminJobView.jsp?jobID=" + job.getID()+"&empID="+job.getEMPID()+"&id="+request.getParameter("id");
				String deleteLink = "AdminDelete?jobID=" + job.getID()+"&id="+request.getParameter("id");

				// Display job information
				out.println("<tr>");
				out.println("<td>" + job.getID() + "</td>");
				out.println("<td>" + job.getTitle() + "</td>");
				out.println("<td>" + job.getLocation() + "</td>");
				out.println("<td>" + job.getCategory() + "</td>");
				out.println("<td>" + datePosted + "</td>");
				out.println("<td>");
				out.println("<a href=\"" + approveLink + "\" class=\"job-action-link\">Approve</a> | ");
				out.println("<a href=\"" + viewLink + "\" class=\"job-action-link\">View</a> | ");
				out.println("<a href=\"" + deleteLink + "\" class=\"job-action-link\">Delete</a>");
				out.println("</td>");
				out.println("</tr>");
			}
		%>
	</table>

	<h2 class="special-heading">Approved Jobs</h2>
	<table>
		<tr>
			<th>ID</th>
			<th>Title</th>
			<th>Location</th>
			<th>Category</th>
			<th>Date Posted</th>
			<th>Action</th>
		</tr>
		<%
			// Display approved jobs
			for (Job job : approvedJobs) {
				// Format date
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				String datePosted = dateFormat.format(job.getDatePosted());

				// Create links for actions
				String viewLink = "AdminJobView.jsp?jobID=" + job.getID()+"&empID="+job.getEMPID()+"&id="+request.getParameter("id");
				String deleteLink = "AdminDelete?jobID=" + job.getID()+"&id="+request.getParameter("id");
				// Display job information
				out.println("<tr>");
				out.println("<td>" + job.getID() + "</td>");
				out.println("<td>" + job.getTitle() + "</td>");
				out.println("<td>" + job.getLocation() + "</td>");
				out.println("<td>" + job.getCategory() + "</td>");
				out.println("<td>" + datePosted + "</td>");
				out.println("<td>");
				out.println("<a href=\"" + viewLink + "\" class=\"job-action-link\">View</a> | ");
				out.println("<a href=\"" + deleteLink + "\" class=\"job-action-link\">Delete</a>");
				out.println("</td>");
				out.println("</tr>");
			}
		%>
	</table>

   
  
 
 
</body>
</html>