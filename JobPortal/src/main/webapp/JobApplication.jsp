<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.Entity.Employer"%>
<%@page import="com.Entity.JobApplication"%>
<%@page import="java.util.Vector"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employer</title>
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
table {
  border-collapse: collapse;
  width: 100%;
  table-layout: fixed;
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
  border-right: 1px solid #ddd; /* Add right border */
  width: 25%;
}

th:first-child, td:first-child {
  border-left: 1px solid #ddd; /* Add left border to first column */
}

th {
  background-color: #4CAF50;
  color: white;
}

tr:hover {
  background-color: #f5f5f5;
}d-color: #f5f5f5;
}

a.button,
input.button {
    background-color: #008CBA;
    color: white;
    border: none;
    padding: 8px 16px;
    cursor: pointer;
    border-radius: 4px;
    margin-right: 4px;
}

a.button:hover,
input.button:hover {
    background-color: #006f8c;
}

 
    </style>
</head>
<body>
    <header class="header">
		<h1 class="logo"><a href="#">JOB EXPRESS</a></h1>
      <ul class="main-nav">
            <li><a href="Employer.jsp?id=<%=request.getParameter("id")%>">Home</a></li>
          <li><a href="PostJob.jsp?id=<%=request.getParameter("id")%>">Post a Job</a></li>
          <li><a href="PostedJobs.jsp?id=<%=request.getParameter("id")%>">Posted Jobs</a></li>
          <li><a href="EmployerProfile.jsp?id=<%=request.getParameter("id")%>">Profile</a></li>
           <li><a href="Login-Registration.jsp">Logout</a></li>
      </ul>
	</header> 
   
    <table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Cover Letter</th>
            <th>Application Status</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <% 
        JobApplication ja=new JobApplication();
        Vector<JobApplication> applications =ja.getApplicationsByJobID(request.getParameter("jobID"));
        for (int i = 0; i < applications.size(); i++) { 
      
        %>
           <%if(applications.get(i).getApplicationStatus().equals("pending"))
                         {
                        	%>
            <tr>
                <td><%= applications.get(i).getId() %></td>
                <td><%= applications.get(i).getDescription() %></td>
                <td><%= applications.get(i).getApplicationStatus() %></td>
               
                <td>
                        <input type="hidden" name="appID" value="<%= applications.get(i).getId() %>">
                        <input type="hidden" name="jID" value="<%=applications.get(i).getJobID()%>">
                         <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
                        <form action="AcceptJob" method="post" style="display: inline-block;">
                          <input type="hidden" name="appID" value="<%= applications.get(i).getId() %>">
                        <input type="hidden" name="jID" value="<%=applications.get(i).getJobID()%>">
                         <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
                        <input style="    background-color: #008CBA;
    color: white;
    border: none;
    padding: 8px 16px;
    cursor: pointer;
    border-radius: 4px;
    margin-right: 4px ;display: inline-block;"class="button" type="submit" name="action" value="Accept">
    
                        </form>
                        <form action="RejectJob" method="post" style="display: inline-block;">  
                          <input type="hidden" name="appID" value="<%= applications.get(i).getId() %>">
                        <input type="hidden" name="jobID" value="<%=applications.get(i).getJobID()%>">
                         <input type="hidden" name="id" value="<%=request.getParameter("id")%>">                 
                        <input style="    background-color: #008CBA;
    color: white;
    border: none;
    padding: 8px 16px;
    cursor: pointer;
    border-radius: 4px;
    margin-right: 4px; display: inline-block;"class="button" type="submit" name="action" value="Reject">
                        </form>
                       
                        <a style="    background-color: #008CBA;
    color: white;
    border: none;
    padding: 6px 10px;
    cursor: pointer;
    border-radius: 4px;
    margin-right: 4px; display: inline-block;"class="button" href="EmployerJobSeekerProfileView.jsp?id=<%=request.getParameter("id")%>&JSID=<%=applications.get(i).getJobSeekerID()%>">View-Profile</a>
                                      
                </td>
           
        <% } %>
         <%} %>
         <% 
         for (int i = 0; i < applications.size(); i++) { 
      
        %>
           <%if(!applications.get(i).getApplicationStatus().equals("pending"))
                         {
                        	%>
                <td><%= applications.get(i).getId() %></td>
                <td><%= applications.get(i).getDescription() %></td>
                <td><%= applications.get(i).getApplicationStatus() %></td>
               
                <td>
                  
                       
                        <a style="    background-color: #008CBA;
    color: white;
    border: none;
    padding: 6px 10px;
    cursor: pointer;
    border-radius: 4px;
    margin-right: 4px; display: inline-block;"class="button" href="EmployerJobSeekerProfileView.jsp?id=<%=request.getParameter("id")%>&JSID=<%=applications.get(i).getJobSeekerID()%>">View-Profile</a>
                                      
                </td>
           
        <% } %>
         <%} %>
     
    </tbody>
</table>
 
</body>
</html>