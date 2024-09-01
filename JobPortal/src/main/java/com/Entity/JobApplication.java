package com.Entity;

	
import com.DB.ConnectorString;			
import java.sql.*;
import java.util.Vector;

public class JobApplication {
    private String id;
    private String jobID;
    private String description;
    private String applicationStatus;
    private int jobSeekerID;
    private int empID;
	public JobApplication(String id, String jobID, String description, String applicationStatus, int jobSeekerID,
			int empID) {
		super();
		this.id = id;
		this.jobID = jobID;
		this.description = description;
		this.applicationStatus = applicationStatus;
		this.jobSeekerID = jobSeekerID;
		this.empID = empID;
	}
	public int getEmpID() {
		return empID;
	}
	public void setEmpID(int empID) {
		this.empID = empID;
	}
	public JobApplication() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getJobID() {
		return jobID;
	}
	public void setJobID(String jobID) {
		this.jobID = jobID;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getApplicationStatus() {
		return applicationStatus;
	}
	public void setApplicationStatus(String applicationStatus) {
		this.applicationStatus = applicationStatus;
	}
	public int getJobSeekerID() {
		return jobSeekerID;
	}
	public void setJobSeekerID(int jobSeekerID) {
		this.jobSeekerID = jobSeekerID;
	}
	 public Vector<JobApplication> getApplicationsByJobID(String jobID) {
	        Vector<JobApplication> applications = new Vector<JobApplication>();

	        try {
	        	ConnectorString C=new ConnectorString();
		   		 Class.forName("com.mysql.cj.jdbc.Driver");
		        Connection conn = DriverManager.getConnection(C.url, C.username, C.password);
	            String sql = "SELECT * FROM JobApplication WHERE jobID = ?";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setString(1, jobID);
	            ResultSet rs = stmt.executeQuery();

	            while (rs.next()) {
	                String id = rs.getString("ID");
	                String description = rs.getString("description");
	                String applicationStatus = rs.getString("applicationStatus");
	                int jobSeekerID = rs.getInt("jobSeekerID");
	                

	                JobApplication application = new JobApplication(jobID, description, applicationStatus, jobSeekerID);
	                application.setId(id);
	                applications.add(application);
	            }

	            conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	        return applications;
	    }
	 public Vector<JobApplication> getApplicationsByJobSeekerID(String jobID) {
	        Vector<JobApplication> applications = new Vector<JobApplication>();

	        try {
	        	ConnectorString C=new ConnectorString();
		   		 Class.forName("com.mysql.cj.jdbc.Driver");
		        Connection conn = DriverManager.getConnection(C.url, C.username, C.password);
	            String sql = "SELECT * FROM JobApplication join Job on JobApplication.jobID=Job.ID WHERE jobSeekerID = ? ";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setString(1, jobID);
	            ResultSet rs = stmt.executeQuery();

	            while (rs.next()) {
	                String id = rs.getString("ID");
	                String description = rs.getString("description");
	                String applicationStatus = rs.getString("applicationStatus");
	                int jobSeekerID = rs.getInt("jobSeekerID");
	                int empID=rs.getInt("employerID");
	                String jID=rs.getString("jobID");

	                JobApplication application = new JobApplication(id,jID, description, applicationStatus, jobSeekerID,empID);
	                application.setId(id);
	                applications.add(application);
	            }

	            conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	        return applications;
	    }
	public JobApplication(String jobID, String description, String applicationStatus, int jobSeekerID) {
		super();
		this.jobID = jobID;
		this.description = description;
		this.applicationStatus = applicationStatus;
		this.jobSeekerID = jobSeekerID;
	}

}
