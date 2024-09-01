package com.Entity;
import java.util.Date;	

import com.DB.ConnectorString;

import java.sql.*;

public class Job {
	    private String ID;
	    private String title;
	    private String EMPID;
	    
	    public String getEMPID() {
			return EMPID;
		}


		public void setEMPID(String eMPID) {
			EMPID = eMPID;
		}


		public Job() {
			super();
			
		}


		public String getID() {
			return ID;
		}


		public void setID(String iD) {
			ID = iD;
		}

		private String description;
	    private String location;
	    private String salary;
	    private String requirements;
	    private Date datePosted;
	    private String status;
	    private String category;
	    private Boolean approve;
	    
	    public Job(String title, String description, String location, String salary, String requirements,
				Date datePosted, String status, String category, Boolean approve) 
	    {
			super();
			this.title = title;
			this.description = description;
			this.location = location;
			this.salary = salary;
			this.requirements = requirements;
			this.datePosted = datePosted;
			this.status = status;
			this.category = category;
			this.approve = approve;
		}
	    public Job(String ID) {
	        Connection conn = null;
	        PreparedStatement stmt = null;
	        ResultSet rs = null;
	        
	        try {
	        	ConnectorString C=new ConnectorString();
	    		 Class.forName("com.mysql.cj.jdbc.Driver");
	             conn = DriverManager.getConnection(C.url, C.username, C.password);
	            stmt = conn.prepareStatement("SELECT * FROM Job WHERE ID = ?");
	            stmt.setString(1, ID);
	            rs = stmt.executeQuery();
	            if (rs.next()) {
	                this.ID = rs.getString("ID");
	                this.title = rs.getString("title");
	                this.description = rs.getString("description");
	                this.location = rs.getString("location");
	                this.salary = rs.getString("salary");
	                this.requirements = rs.getString("requirements");
	                this.datePosted = rs.getDate("datePosted");
	                this.status = rs.getString("status");
	                this.category = rs.getString("category");
	                this.approve = rs.getBoolean("approve");
	                this.EMPID = rs.getString("employerID");
	            } else {
	                throw new RuntimeException("Job not found: " + ID);
	            }
	        } catch (SQLException e) {
	            throw new RuntimeException("Error retrieving Job: " + e.getMessage(), e);
	        } catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
	            // Close the resources
	            if (rs != null) {
	                try { rs.close(); } catch (SQLException e) { /* ignored */ }
	            }
	            if (stmt != null) {
	                try { stmt.close(); } catch (SQLException e) { /* ignored */ }
	            }
	            if (conn != null) {
	                try { conn.close(); } catch (SQLException e) { /* ignored */ }
	            }
	        }
	    }


		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public String getLocation() {
			return location;
		}

		public void setLocation(String location) {
			this.location = location;
		}

		public String getSalary() {
			return salary;
		}

		public void setSalary(String salary) {
			this.salary = salary;
		}

		public String getRequirements() {
			return requirements;
		}

		public void setRequirements(String requirements) {
			this.requirements = requirements;
		}

		public Date getDatePosted() {
			return datePosted;
		}

		public void setDatePosted(Date datePosted) {
			this.datePosted = datePosted;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public String getCategory() {
			return category;
		}

		public void setCategory(String category) {
			this.category = category;
		}

		public Boolean getApprove() {
			return approve;
		}

		public void setApprove(Boolean approve) {
			this.approve = approve;
		}

}
