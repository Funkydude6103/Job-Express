<%@page import="com.Entity.JobSeeker"%>
<%@page import="com.Entity.Job"%>
<%@page import="com.Entity.Employer"%>
<%@page import="com.Entity.Review"%>
<%@page import="java.util.Vector"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
h3 {
    color:#0000;
}
a {
	color: #ffffff;
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
#reviews {
        display: flex;
        flex-direction: column;
        margin-top: 20px;
        margin-left:40px;
    }
    .review {
        border: 1px solid #ccc;
        padding: 10px;
        margin-bottom: 10px;
        width: 500px;
    }
    .review h3 {
        font-size: 18px;
        margin-bottom: 5px;
    }
    .review p {
        font-size: 14px;
        margin-bottom: 10px;
    }
    .review .rating {
        font-size: 16px;
        font-weight: bold;
        color: #ffc107;
    }
</style>
<html lang="en">
<!-- Navbar Start -->
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
  <div class="maindiv" >

  </div>

</body>
<!-- Navbar End -->


<head>
    <meta charset="utf-8">
    <title>One Job View</title>
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
    <link href="bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <div class="container-xxl bg-white p-0">

     
        <%Employer E=new Employer(request.getParameter("empID"));
         Job j=new Job(request.getParameter("jobID"));
        %>
        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container">
                <div class="row gy-5 gx-4">
                    <div class="col-lg-8">
                        <div class="d-flex align-items-center mb-5">
                     
                            <div class="text-start ps-4">
                                <h3 class="mb-3"><%=j.getTitle()%></h3>
                                <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i><%=j.getLocation()%></span>
                                <span class="text-truncate me-3"><i class="far fa-clock text-primary me-2"></i><%=j.getCategory()%></span>
                                <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i><%=j.getSalary()%></span>
                            </div>
                        </div>

                        <div class="mb-5">
                            <h4 class="mb-3">Job description</h4>
                            <p><%=j.getDescription()%></p>
                          
                            <h4 class="mb-3">Requirements</h4>
                            <p><%=j.getRequirements()%></p>

                        </div>
                    </div>
        
                    <div class="col-lg-4">
                        <div class="bg-light rounded p-5 mb-4 wow slideInUp" data-wow-delay="0.1s">
                            <h4 class="mb-4">Job Summary</h4>
                            <p><i class="fa fa-angle-right text-primary me-2"></i>Published On: <%=j.getDatePosted() %></p>
                          
                            <p><i class="fa fa-angle-right text-primary me-2"></i>Job Nature: <%=j.getCategory()%></p>
                            <p><i class="fa fa-angle-right text-primary me-2"></i>Salary: <%=j.getSalary() %></p>
                            <p><i class="fa fa-angle-right text-primary me-2"></i>Location: <%=j.getLocation() %></p>
   
                        </div>
                        <div class="bg-light rounded p-5 wow slideInUp" data-wow-delay="0.1s">
                            <h4 class="mb-4">Company Detail</h4>
                            <p class="m-0"><strong>Company Name: </strong><%=E.getCompanyName()%><br><strong>Company Description: </strong><%=E.getCompanyDescription() %><br><strong>Office Address: </strong><%=E.getAddress()%><br><strong>Company LinkedIn: </strong><%=E.getLinkedIn()%><br><strong>Company Introduction: </strong><%=E.getIntroduction()%><br><strong>Mission Statement: </strong><%=E.getMissionStatement()%><br><strong>Vision: </strong><%=E.getVision()%><br></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <h2>&nbsp;&nbsp;Reviews</h2>
        <div id="reviews">
          <%
        Review r=new Review();
        Vector<Review> reviews=r.getReviewsByEmployerID(request.getParameter("empID"));
        for(Review rs:reviews)
        {
        %>
    <div class="review">
        <h3>Name: <%=rs.getName()%></h3>
        <p>Review: <%=rs.getReviewText()%></p>
        <span class="rating">Rating: <%=rs.getStar()%> stars</span>
    </div>
    <%}%>
</div>
        <!-- Job Detail End -->