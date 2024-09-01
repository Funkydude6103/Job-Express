<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.Entity.Employer"%>
<%@page import="com.Entity.Job"%>
<%@page import="java.util.Vector"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Posted Jobs</title>
	  <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <link href="img/favicon.ico" rel="icon">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
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
    width: 20px;
    height: fit-content;
}
#gay
{
color: #412b76;

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
.logo a
{
    color:#ffffff;
}
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
/*** Job Listing ***/
.nav-pills .nav-item .active {
    border-bottom: 6px solid var(--primary);
}

.job-item {
    border: 1px solid transparent;
    border-radius: 2px;
 box-shadow: none;
    transition: .5s;
}

.job-item:hover {
    border-color: #2ee8b6;
    box-shadow: 0 0 45px #2ee8b6;
}


.cat-item {
    display: block;
    box-shadow: 0 0 45px rgba(0, 0, 0, .08);
    border: 1px solid transparent;
    transition: .5s;
}

.cat-item:hover {
    border-color: rgb(241, 3, 3);
    box-shadow: none;
}
:root {
    --primary: #00B074;
    --secondary: #2B9BFF;
    --light: #EFFDF5;
    --dark: #2B3940;
}

.back-to-top {
    position: fixed;
    color: #412b76;
    border-color: #412b76;
    display: none;
    right: 45px;
    bottom: 45px;
    z-index: 99;
}


/*** Spinner ***/
#spinner {
    opacity: 0;
    visibility: hidden;
    transition: opacity .5s ease-out, visibility 0s linear .5s;
    z-index: 99999;
}

#spinner.show {
    transition: opacity .5s ease-out, visibility 0s linear 0s;
    visibility: visible;
    opacity: 1;
}


/*** Button ***/
.btn {
    font-family: 'Inter', sans-serif;
    font-weight: 600;
    transition: .5s;
}

.btn.btn-primary,
.btn.btn-secondary {
    color: #412b76;
}

.btn-square {
    width: 38px;
    height: 38px;
}

.btn-sm-square {
    width: 32px;
    height: 32px;
}

.btn-lg-square {
    width: 48px;
    height: 48px;
}

.btn-square,
.btn-sm-square,
.btn-lg-square {
    padding: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: normal;
    border-radius: 2px;
}
/*** Testimonial ***/
.testimonial-carousel .owl-item .testimonial-item,
.testimonial-carousel .owl-item.center .testimonial-item * {
    transition: .5s;
}

.testimonial-carousel .owl-item.center .testimonial-item {
    background: var(--primary) !important;
}

.testimonial-carousel .owl-item.center .testimonial-item * {
    color: #FFFFFF !important;
}

.testimonial-carousel .owl-dots {
    margin-top: 24px;
    display: flex;
    align-items: flex-end;
    justify-content: center;
}

.testimonial-carousel .owl-dot {
    position: relative;
    display: inline-block;
    margin: 0 5px;
    width: 15px;
    height: 15px;
    border: 5px solid var(--primary);
    border-radius: 2px;
    transition: .5s;
}

.testimonial-carousel .owl-dot.active {
    background: var(--dark);
    border-color: var(--primary);
}

}

	</style>
	<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
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
	
 <div class="container-xxl bg-white p-0">
        <div class="container-xxl py-5">
            <div class="container">
                <h1 id= "gay"class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">Posted Jobs</h1>
                <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.3s">
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                        <%
                         Employer js=new Employer();
                        Vector<Job> jobs=js.postedJobs(request.getParameter("id"));
                        for(Job j:jobs)
                        {
                        %>
                            <input type="hidden" name="Jobid" value=<%=j.getID()%>>
                            <div class="job-item p-4 mb-4">
                                <div class="row g-4">
                                    <div class="col-sm-12 col-md-8 d-flex align-items-center">
                                        <div class="text-start ps-4">
                                        <h2 style="color: black;"><%=j.getTitle()%></h2>
                                            <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>&nbsp;&nbsp;<%=j.getLocation()%>&nbsp;&nbsp;</span>
                                            <span class="text-truncate me-3"><i class="far fa-clock text-primary me-2"></i>&nbsp;&nbsp;<%=j.getCategory()%>&nbsp;&nbsp;</span>
                                            <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>&nbsp;&nbsp;<%=j.getSalary()%>&nbsp;&nbsp;</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
                                        <small class="text-truncate"><i class="far fa-calendar-alt text-primary me-2"></i>&nbsp;&nbsp;<%=j.getDatePosted()%></small>
                                        
                                        <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
                                     <input type="hidden" name="jobID" value="<%= j.getID() %>">
                                         <a style="background-color: #4CAF50; /* Green */
                                                  border: none;
                                                 color: white;
                                                padding: 15px 32px;
                                                text-align: center;
                                                text-decoration: none;
                                                display: inline-block;
                                                font-size: 14px;
                                                margin: 4px 2px;
                                               cursor: pointer;
                                               border-radius: 10px; margin-left:1300px; position: relative; top: -70px;"  href="EditJob.jsp?id=<%=request.getParameter("id")%>&jobID=<%=j.getID()%>">Edit</a>
                                     
                                  
                                    </div>
                                    <form action="deleteJob" method="post">
                                    <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
                                     <input type="hidden" name="jobID" value="<%= j.getID() %>">
                                     <input style="background-color: #4CAF50; /* Green */
                                                  border: none;
                                                 color: white;
                                                padding: 15px 32px;
                                                text-align: center;
                                                text-decoration: none;
                                                display: inline-block;
                                                font-size: 14px;
                                                margin: 4px 2px;
                                               cursor: pointer;
                                               border-radius: 10px; margin-left:1300px; position: relative; top: -70px;" type="submit" value="Delete">
                                      </form>
                                    </div>
                                    
                                    <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
                                     <input type="hidden" name="jobID" value="<%= j.getID() %>">
                                     <a style="background-color: #4CAF50; /* Green */
                                                  border: none;
                                                 color: white;
                                                padding: 15px 32px;
                                                text-align: center;
                                                text-decoration: none;
                                                display: inline-block;
                                                font-size: 14px;
                                                margin: 4px 2px;
                                               cursor: pointer;
                                               border-radius: 10px; margin-left:1300px; position: relative; top: -70px;"  href="JobApplication.jsp?id=<%=request.getParameter("id")%>&jobID=<%=j.getID()%>">Applications</a>
                                      
                                    </div>
                                </div>
                            </div>
                            <br>
                            <%}%>
  
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>

</body>
</html>