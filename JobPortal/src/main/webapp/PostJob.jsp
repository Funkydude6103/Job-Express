<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post Job</title>
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
 h1 {
      text-align: center;
      color: #333333;
      margin-top: 50px;
    }
form {
      max-width: 600px;
      margin: 0 auto;
      background-color: #ffffff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 0 10px #cccccc;
    }
    
    
    label {
      display: inline-block;
      margin-bottom: 10px;
      font-weight: bold;
    }
    
    input[type="text"], textarea, select,number {
      width: 100%;
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #cccccc;
      border-radius: 5px;
      font-size: 16px;
      box-sizing: border-box;
    }
    
     input[type="number"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #cccccc;
      border-radius: 5px;
      font-size: 16px;
      box-sizing: border-box;
    }
    
    input[type="file"] {
      margin-top: 10px;
    }
    
    select {
      height: 40px;
    }
    
    input[type="submit"] {
      background-color: #333333;
      color: #ffffff;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
      margin-left:220px;
    }
    
    input[type="submit"]:hover {
      background-color: #555555;
    }
    
    .error-message {
      color: #ff0000;
      font-size: 14px;
      margin-bottom: 10px;
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
	  <h1>Post Job</h1>
	 <form action="PostJob" method="post">
	<input type="hidden" name="id" value="<%= request.getParameter("id") %>">
    <label>Title:</label>
    <input type="text" name="title" required>
    
    <label>Description:</label>
    <textarea name="description" rows="5" cols="40" required></textarea>
    
    <label>Location:</label>
    <input type="text" name="location" required>
    
    <label>Salary:</label>
    <input type="number" name="salary" required>
    
    <label>Requirements:</label>
    <textarea name="requirements" rows="5" cols="40" required></textarea>
    
    <label>Status:</label>
    <select name="status" required>
      <option value="">Select status</option>
      <option value="open">Open</option>
      <option value="closed">Closed</option>
    </select>
    
    <label>Category:</label>
    <select name="category" required>
      <option value="">Select category</option>
      <option value="full_time">Full Time</option>
      <option value="part_time">Part Time</option>
      <option value="remote">Remote</option>
      <option value="internship">Internship</option>
    </select>
    
    <input type="submit" value="Submit">
  </form>

</body>
</html>