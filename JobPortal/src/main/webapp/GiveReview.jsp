<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
.review-form {
  background-color: #f2f2f2;
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 20px;
  width: 400px;
  margin: 0 auto;
}
.review-form h2 {
  text-align: center;
  font-size: 28px;
  margin-bottom: 20px;
}
.form-group {
  margin-bottom: 20px;
}
label {
  font-weight: bold;
  display: block;
  margin-bottom: 5px;
}
input[type="number"], textarea {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  font-size: 16px;
  resize: vertical;
}
button[type="submit"] {
  background-color: #008CBA;
  color: white;
  border: none;
  padding: 8px 16px;
  cursor: pointer;
  border-radius: 4px;
  margin-right: 4px;
  display: inline-block;
  font-size: 16px;
}
button[type="submit"]:hover {
  background-color: #007399;
}
    
    </style>
</head>
<body>
    <header class="header">
		<h1 class="logo"><a href="#">JOB EXPRESS</a></h1>
      <ul class="main-nav">
      <li><a href="JobSeeker.jsp?id=<%=request.getParameter("id")%>">Home</a></li>
          <li><a href="ViewJob.jsp?id=<%=request.getParameter("id")%>">View Jobs</a></li>
          <li><a href="AppliedJobs.jsp?id=<%=request.getParameter("id")%>">Applied Jobs</a></li>
          <li><a href="ProfileJobSeeker.jsp?id=<%=request.getParameter("id")%>">Profile</a></li>
          <li><a href="Login-Registration.jsp">Logout</a></li>
      </ul>
	</header> 
	<br>
	<br>
	<br>
	
	<form action="GiveReview" method="post" class="review-form">
  <h2 style="color:black;">Leave a Review</h2>
  <div class="form-group">
   <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
    <input type="hidden" name="EmpID" value="<%=request.getParameter("EmpID")%>">
    <label for="review">Review:</label>
    <textarea id="review" name="review" required></textarea>
  </div>
  <div class="form-group">
    <label for="rating">Rating:</label>
    <input type="number" id="rating" name="rating" min="1" max="5" required>
  </div>
  <button type="submit" class="btn-submit">Submit Review</button>
</form>
	
   
   
 
</body>
</html>