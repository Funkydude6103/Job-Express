<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.Entity.Insight"%>
<%@ page import="java.io.*"%>
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
    </style>
    	<%
    // Import the Insight class and calculate insights
    Insight insight = new Insight();
    insight.calculateInsights();
    
    // Create a new dataset
%>
   <script src="https://cdn.anychart.com/releases/8.0.1/js/anychart-core.min.js"></script>
     <script src="https://cdn.anychart.com/releases/8.0.1/js/anychart-pie.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
      <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load Charts and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

   
      
      google.charts.setOnLoadCallback(drawBarChart);
      google.charts.setOnLoadCallback(drawScatterChart);
   
      function drawBarChart() 
      {
    	  var data = google.visualization.arrayToDataTable([
    	        ["Element", "Count", { role: "style" } ],
    	        ["Total Users",<%=insight.getTotalUsers()%>, "#b87333"],
    	        ["Employer",<%=insight.getNoOfEmployers()%>, "silver"],
    	        ["Job Seeker", <%=insight.getNoOfJobSeeker()%>, "gold"],
    	      ]);

    	      var view = new google.visualization.DataView(data);
    	      view.setColumns([0, 1,
    	                       { calc: "stringify",
    	                         sourceColumn: 1,
    	                         type: "string",
    	                         role: "annotation" },
    	                       2]);

    	      var options = {
    	        title: "Users Chart",
    	        width: 1000,
    	        height: 500,
    	        bar: {groupWidth: "45%"},
    	        legend: { position: "none" },
    	      };
    	      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
    	      chart.draw(view, options);
          }
      
      function drawScatterChart() 
      {
    	  var data = google.visualization.arrayToDataTable([
    	        ['Category', 'Application Accpeted', 'Application Rejected', 'Application Pending', { role: 'annotation' } ],
    	        ['Part Time', <%=insight.getPartTimeAccepted()%>,<%=insight.getPartTimeRejected()%>,<%=insight.getPartTimePending()%>, ''],
    	        ['Remote',<%=insight.getRemoteAccepted()%>, <%=insight.getRemoteRejected()%>, <%=insight.getRemotePending()%>, ''],
    	        ['Full Time',<%=insight.getFullTimeAccepted()%>, <%=insight.getFullTimeRejected()%>, <%=insight.getFullTimePending()%>,''],
    	        ['Internship', <%=insight.getInternshipAccepted()%>, <%=insight.getInternshipRejected()%>, <%=insight.getInternshipPending()%>,'']
    	      ]);

    	      var view = new google.visualization.DataView(data);
    	      view.setColumns([0, 1,
    	                       { calc: "stringify",
    	                         sourceColumn: 1,
    	                         type: "string",
    	                         role: "annotation" },
    	                       2]);
    	      
    	      var options = {
    	    	        width: 1000,
    	    	        height: 500,
    	    	        legend: { position: 'top', maxLines: 3 },
    	    	        bar: { groupWidth: '75%' },
    	    	        isStacked: true
    	    	      };


    	     
    	      var chart = new google.visualization.BarChart(document.getElementById("columnchart2_values"));
    	      chart.draw(data, options);
          }

      
    </script>
  
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
	<br>
	<br>
	<br>
<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pie Chart</h1>
<br>
<div id="container" style="width: 1000px; height: 500px; margin:0px auto;"></div>
      
<br><br>
<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Column Chart</h1>
<br>
        <div id="columnchart_values" style="width: 1000px; height: 500px; margin:0px auto;"></div>
  <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Stacked Bar Chart</h1>
<br>      
        <div id="columnchart2_values" style="width: 1000px; height: 500px; margin:0px auto;"></div>

    <script>
    anychart.onDocumentReady(function() {

    	  
    	  var data = [
    	      {x: "Total Rejected Application", value:<%=insight.getTotalRejectedApplication()%>},
    	      {x: "Total Jobs Posted;", value: <%=insight.getTotalJobsPosted()%>},
    	      {x: "Total Intransit Application", value: <%=insight.getTotalIntransitApplication()%>},
    	      {x: "Average Application Per Job", value: <%=insight.getAvgApplicationPerJob()%>},
    	      {x: "Total Accepted Application;", value: <%=insight.getTotalAcceptedApplication()%>}
    	  ];

    	  // create the chart
    	  var chart = anychart.pie();

    	  // set the chart title
    	  chart.title("Job Express Insights");

    	  // add the data
    	  chart.data(data);
    	 

    	  // display the chart in the container
    	  chart.container('container');
    	  chart.draw();
    	  


    	});
    </script>

 
</body>
</html>