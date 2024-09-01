<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.Entity.Employer"%>
<%@page import="com.Entity.JobSeeker"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Base64"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Seeker</title>
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

form {
  margin: 0 auto;
  max-width: 600px;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-family: Arial, sans-serif;
}

label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}

input[type="text"],
input[type="email"],
textarea {
  display: block;
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  margin-bottom: 20px;
  box-sizing: border-box;
  font-size: 16px;
}

input[type="file"] {
  margin-bottom: 20px;
}

button[type="button"],
input[type="submit"] {
  background-color: #4CAF50;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 16px;
  margin-right: 10px;
}

input[type="submit"] {
  background-color: #4CAF50;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 16px;
  margin-right: 10px;
}

button[type="button"]:hover,
input[type="submit"]:hover {
  background-color: #3e8e41;
}

button[type="button"] {
  background-color: #f44336;
}

button[type="button"]:hover {
  background-color: #da190b;
}

img {
  display: block;
  margin-bottom: 20px;
  height:200px;
  width:200px;
}

/* a { */
/*   display: block; */
/*   margin-bottom: 20px; */
/*   font-size: 16px; */
/* } */

textarea {
  height: 100px;
}

/* disabled styles */
input:disabled {
  background-color: #f2f2f2;
  color: #555;
  cursor: not-allowed;
}

textarea:disabled {
  background-color: #f2f2f2;
  color: #555;
  cursor: not-allowed;
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
          <li><a href="employerProfile.jsp">Profile</a></li>
           <li><a href="Login-Registration.jsp">Logout</a></li>
      </ul>
	</header> 
   <h1>Profile</h1>
   <%JobSeeker js=new JobSeeker(request.getParameter("JSID"));%>
   <form>
    <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
    <label>Profile Photo:</label>
    <br>
    <img src="data:image/png;base64,<%= js.getProfilePhoto() %>" alt="Profile Photo" width="100"><br>
    <input type="file" name="profilePhoto" accept="image/png" disabled required><br>
    
      <label>Email:</label>
        <input type="text" name="email" value="<%= js.getEmail() %>" disabled><br>
        
          <label>Name:</label>
        <input type="text" name="name" value="<%=js.getName()%>" disabled><br>
    
    <label>Resume:</label>
    <br>
    <%if(js.getResume()!=null) {%>
    <p>Click here</p>
    <a href="data:application/pdf;base64,<%= Base64.getEncoder().encodeToString(js.getResume()) %>" style="display: block; width: 200px; height: 50px; border: none;" target="_blank" >View Resume</a><br>
    <p>****************</p>
    <%} %>
    <input type="file" name="resume" accept="application/pdf" disabled><br>
    
    
    <label>Phone Number:</label>
    <input type="text" name="phoneNumber" value="<%= js.getPhoneNumber() %>" disabled><br>
    
         <label>Address:</label>
        <input type="text" name="address" value="<%=js.getAddress()%>" disabled><br>
        
        <label>LinkedIn:</label>
        <input type="text" name="linkedIn" value="<%=js.getLinkedIn()%>" disabled><br>
        
        <label>Date of Birth:</label>
        <input type="date" name="dob" value="<%=js.getDOB()%>" disabled required><br>
        
       
        
        <label>Education:</label><br>
        <textarea name="education" disabled><%=js.getEducation()%></textarea><br>
        
        
    
    <label>Gender:</label>
    <select name="gender" required disabled>
      <option value="">Select status</option>
      <option value="M" <% if(!js.getGender().isEmpty()){if(js.getGender().equals("M")){ %>selected<% } }%>>M</option>
      <option value="F" <% if(!js.getGender().isEmpty()){if(js.getGender().equals("F")){ %>selected<% } }%>>F</option>
    </select>
    
     <label>Employment:</label><br>
       <textarea name="employment" disabled><%= js.getEmployment() %></textarea><br>
        
         <label>Skill:</label><br>
        <textarea name="skill" disabled><%= js.getSkills() %></textarea><br>
        
         <label>Languages:</label><br>
        <textarea name="languages" disabled><%= js.getLanguages() %></textarea><br>
        
         <label>Hobbies:</label><br>
        <textarea name="hobbies" disabled><%= js.getHobbies()%></textarea><br>
    
           <label>Qualities:</label><br>
        <textarea name="qualities" disabled><%= js.getQualities() %></textarea><br>
    
  
  </form>
  

 
</body>
</html>