<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.Entity.JobSeeker"%>
<%@page import="com.Entity.Job"%>
<%@page import="java.util.Vector"%>
    
<!DOCTYPE html>
<style>
  
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
	color: #ffffff;
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

.search-bar {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
  }
  
  form {
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #f0f0f0;
    padding: 10px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  }
  
  input[type="text"], select {
    padding: 10px;
    border: none;
    background-color: #f5f5f5;
    border-radius: 5px;
    margin-right: 10px;
  }
  
  button[type="submit"] {
    padding: 10px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }
  
  button[type="submit"]:hover {
    background-color: #3e8e41;
  }

</style>
<html lang="en">
<!-- Navbar Start -->
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
  <div class="maindiv" >
     
  </div>
  <br>
  <div class="search-bar">
  <h4>Search Bar:&nbsp;&nbsp;&nbsp;&nbsp;</h4>
  <form action="SearchJobs.jsp" method="get">
    <input type="text" name="keyword" placeholder="Search by keyword...">
    <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
      <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
    <select name="category">
      <option value="">Select category</option>
      <option value="full_time">Full Time</option>
      <option value="part_time">Part Time</option>
      <option value="remote">Remote</option>
      <option value="internship">Internship</option>
    </select>
      <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
    <input type="text" name="location" placeholder="Search by location...">
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
    <button type="submit">Search</button>
  </form>
</div>
<br>

</body>
<!-- Navbar End -->
<head>
    <meta charset="utf-8">
    <title>JobExpress - Job List</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <!-- <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div> -->
        <!-- Spinner End -->


        


        


        <!-- Jobs Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <h1 id= "gay"class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">Job Listing</h1>
                <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.3s">
                    <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                    
                    </ul>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                         <%
                        JobSeeker js=new JobSeeker();
                        Vector<Job> jobs=js.viewJobs();
                        for(Job j:jobs)
                        {
                        %>
                            <div class="job-item p-4 mb-4">
                                <div class="row g-4">
                                <input type="hidden" name="Jobid" value=<%=j.getID()%>>
                                    <div class="col-sm-12 col-md-8 d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid border rounded" src="logo.png" alt="" style="width: 80px; height: 80px;">
                                        <div class="text-start ps-4">
                                            <h5 class="mb-3"><%=j.getTitle()%></h5>
                                            <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i><%=j.getLocation()%></span>
                                            <span class="text-truncate me-3"><i class="far fa-clock text-primary me-2"></i><%=j.getCategory()%></span>
                                            <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i><%=j.getSalary()%></span>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-4 d-flex flex-column align-items-start align-items-md-end justify-content-center">
                                        <div class="d-flex mb-3">
                                            <a class="btn btn-light btn-square me-3" href=""><i class="far fa-heart text-primary"></i></a>
                                            <a class="btn btn-primary" href="OneJob.jsp?id=<%=request.getParameter("id")%>&empID=<%=j.getEMPID()%>&jobID=<%=j.getID()%>">Apply Now</a>
<!--                                     </div> -->
                                        </div>
                                        <small class="text-truncate"><i class="far fa-calendar-alt text-primary me-2"></i>Date Line: <%=j.getDatePosted()%></small>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                            
                            
                        </div>
                       
                           
                           
                            
                            <!-- <a class="btn btn-primary py-3 px-5" href="">Browse More Jobs</a>
                        </div>
                        <div id="tab-3" class="tab-pane fade show p-0">
                           
                           
                            
                            <a class="btn btn-primary py-3 px-5" href="">Browse More Jobs</a>
                        </div> -->
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