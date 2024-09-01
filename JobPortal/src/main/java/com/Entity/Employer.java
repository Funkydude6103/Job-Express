package com.Entity;
import com.DB.ConnectorString;			
import java.sql.*;
import java.util.Vector;
public class Employer {
	private String companyName;
    private String companyDescription;
    private String address;
    private String linkedIn;
    private String introduction;
    private String missionStatement;
    private String vision;
    
	public Employer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Vector<Job> postedJobs(String EmpID)
	{
		  Vector<Job> jobs = new Vector<Job>();
          try {
	        String query = "SELECT * FROM Job where employerID="+EmpID;
	        ConnectorString C=new ConnectorString();
   		 Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn = DriverManager.getConnection(C.url, C.username, C.password);
          Statement statement = conn.prepareStatement(query);
            ResultSet resultSet=statement.executeQuery(query);
	            while (resultSet.next()) 
	            {
	                Job job = new Job();
	                job.setID(resultSet.getString("ID"));
	                job.setTitle(resultSet.getString("title"));
	                job.setDescription(resultSet.getString("description"));
	                job.setLocation(resultSet.getString("location"));
	                job.setSalary(resultSet.getString("salary"));
	                job.setRequirements(resultSet.getString("requirements"));
	                job.setDatePosted(resultSet.getDate("datePosted"));
	                job.setStatus(resultSet.getString("status"));
	                job.setCategory(resultSet.getString("category"));
	                job.setEMPID(resultSet.getString("employerID"));
	                job.setApprove(resultSet.getBoolean("approve"));
	                jobs.add(job);
	            }
              }
          catch (SQLException e) 
	    	 {
	             	
	         } 
	    	 catch (ClassNotFoundException e) 
	    	 {
				
			 }
          return jobs;
	}
    public Employer(String ID)
    {
    	 Connection conn = null;
         PreparedStatement stmt = null;
         ResultSet rs = null;

         try {
        	 ConnectorString C=new ConnectorString();
    		 Class.forName("com.mysql.cj.jdbc.Driver");
              conn = DriverManager.getConnection(C.url, C.username, C.password);
             stmt = conn.prepareStatement("SELECT * FROM Employer WHERE userID = ?");
             stmt.setString(1, ID);

             // execute query and retrieve result set
             rs = stmt.executeQuery();

             // if a row is found, retrieve all attributes and store them in instance variables
             if (rs.next()) {
                 this.companyName = rs.getString("companyName");
                 this.companyDescription = rs.getString("companyDescription");
                 this.address = rs.getString("address");
                 this.linkedIn = rs.getString("linkedIn");
                 this.introduction = rs.getString("introduction");
                 this.missionStatement = rs.getString("missionStatement");
                 this.vision = rs.getString("vision");
             }
         } catch (SQLException e) 
         {
             e.printStackTrace();
         } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
         finally 
         {
             // close all resources
             try 
             {
                 if (rs != null) rs.close();
                 if (stmt != null) stmt.close();
                 if (conn != null) conn.close();
             } catch (SQLException e) {
                 e.printStackTrace();
             }
         }
    	
    }
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyDescription() {
		return companyDescription;
	}

	public void setCompanyDescription(String companyDescription) {
		this.companyDescription = companyDescription;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLinkedIn() {
		return linkedIn;
	}

	public void setLinkedIn(String linkedIn) {
		this.linkedIn = linkedIn;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getMissionStatement() {
		return missionStatement;
	}

	public void setMissionStatement(String missionStatement) {
		this.missionStatement = missionStatement;
	}

	public String getVision() {
		return vision;
	}

	public void setVision(String vision) {
		this.vision = vision;
	}

	public Boolean postJob(String id,Job j)
	{
		 try {
			 ConnectorString C=new ConnectorString();
    		 Class.forName("com.mysql.cj.jdbc.Driver");
             Connection conn = DriverManager.getConnection(C.url, C.username, C.password);
		     String sql = "INSERT INTO Job (title, description, location, salary, requirements, datePosted, status, category, approve, employerID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		        PreparedStatement stmt = conn.prepareStatement(sql);
		        stmt.setString(1, j.getTitle());
		        stmt.setString(2, j.getDescription());
		        stmt.setString(3, j.getLocation());
		        stmt.setString(4, j.getSalary());
		        stmt.setString(5, String.join(", ", j.getRequirements()));
		        stmt.setDate(6, new java.sql.Date(j.getDatePosted().getTime()));
		        stmt.setString(7, j.getStatus());
		        stmt.setString(8, j.getCategory());
		        stmt.setBoolean(9, j.getApprove());
		        stmt.setInt(10, Integer.parseInt(id));
		        int rowsInserted = stmt.executeUpdate();

		   
		        stmt.close();
		        conn.close();


		        return (rowsInserted > 0);
		    } catch (Exception e) {
		        e.printStackTrace();
		        return false;
		    }
	}

}
