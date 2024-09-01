package com.Entity;
import com.DB.ConnectorString;				
import java.sql.*;
import java.util.Base64;
import java.util.Vector;


public class JobSeeker 
{
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public byte[] getResume() {
		return resume;
	}
	public void setResume(byte[] resume) {
		this.resume = resume;
	}
	public String getProfilePhoto() {
		return profilePhoto;
	}
	public void setProfilePhoto(String profilePhoto) {
		this.profilePhoto = profilePhoto;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
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
	public Date getDOB() {
		return DOB;
	}
	public void setDOB(Date dOB) {
		DOB = dOB;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getEmployment() {
		return employment;
	}
	public void setEmployment(String employment) {
		this.employment = employment;
	}
	public String getSkills() {
		return skills;
	}
	public void setSkills(String skills) {
		this.skills = skills;
	}
	public String getLanguages() {
		return languages;
	}
	public void setLanguages(String languages) {
		this.languages = languages;
	}
	public String getHobbies() {
		return hobbies;
	}
	public void setHobbies(String hobbies) {
		this.hobbies = hobbies;
	}
	public String getQualities() {
		return qualities;
	}
	public void setQualities(String qualities) {
		this.qualities = qualities;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	private int userID;
	   private byte []resume;
	   private String profilePhoto;
	   private String phoneNumber;
	   private String address;
	   private String linkedIn;
	   private Date DOB;
	   private String gender;
	   private String education;
	   private String employment;
	   private String skills;
	   private String languages;
	   private String hobbies;
	   private String qualities;
	   private String email;
	   private String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public JobSeeker(String uID)
	{
	    Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
        	ConnectorString C=new ConnectorString();
    		 Class.forName("com.mysql.cj.jdbc.Driver");
             conn = DriverManager.getConnection(C.url, C.username, C.password);
             stmt = conn.prepareStatement("SELECT * FROM JobSeeker WHERE userID = ?");
             stmt.setString(1, uID);
             rs = stmt.executeQuery();
            if (rs.next()) {
            	this.resume=null;
            	    
                    Blob resumeBlob = rs.getBlob("resume");
                    if(resumeBlob!=null)
                    {
                    byte[] resumeBytes = resumeBlob.getBytes(1, (int) resumeBlob.length());
                    this.resume = resumeBytes;
                    }
            	    
            	    this.profilePhoto=null;
            	    
                    Blob profilePhotoBlob = rs.getBlob("profilePhoto");
                    if(profilePhotoBlob!=null)
                    {
                    byte[] profilePhotoBytes = profilePhotoBlob.getBytes(1, (int) profilePhotoBlob.length());
                    this.profilePhoto = Base64.getEncoder().encodeToString(profilePhotoBytes);
                    }
            	    
                    this.phoneNumber = rs.getString("phoneNumber");
                    this.address = rs.getString("address");
                    this.linkedIn = rs.getString("linkedIn");
                    this.DOB = rs.getDate("DOB");
                    this.gender = rs.getString("Gender");
                    this.education = rs.getString("education");
                    this.employment = rs.getString("employment");
                    this.skills = rs.getString("skills");
                    this.languages = rs.getString("languages");
                    this.hobbies = rs.getString("hobbies");
                    this.qualities = rs.getString("qualities");
            	stmt.close();
            	rs.close();
            	stmt = conn.prepareStatement("SELECT * FROM user WHERE ID = ?");
            	stmt.setString(1, uID);
            	rs = stmt.executeQuery();
            	 if (rs.next()) {
            		 this.email = rs.getString("email");
            		 this.name = rs.getString("name");
            	 }
            	
            } 
            else 
            {
                throw new RuntimeException("Job not found: ");
            }
        } 
        catch (SQLException e)
        {
            throw new RuntimeException("Error retrieving Job: " + e.getMessage(), e);
        } 
        catch (ClassNotFoundException e) 
        {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
        finally 
        {
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
	public JobSeeker() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Boolean appliedCheck(String jobId,String jobSeekerID)
	{
		Boolean result = false;
	    try {
	    	ConnectorString C=new ConnectorString();
	   		 Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection conn = DriverManager.getConnection(C.url, C.username, C.password);
	        String query = "SELECT * FROM JobApplication WHERE jobID = ? AND jobSeekerID = ?";
	        PreparedStatement stmt = conn.prepareStatement(query);
	        stmt.setString(1, jobId);
	        stmt.setString(2, jobSeekerID);
	        ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            result = true;
	        }
	        conn.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return result;
	}
	public String applyJob(String jobId,String jobSeekerID,String coverLetter)
	{
		String applicationStatus = "pending";
		Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
       	 ConnectorString C=new ConnectorString();
   		 Class.forName("com.mysql.cj.jdbc.Driver");
   		 connection = DriverManager.getConnection(C.url, C.username, C.password);
         String query = "INSERT INTO JobApplication (jobID, description, applicationStatus, jobSeekerID) VALUES (?, ?, ?, ?)";
         statement = connection.prepareStatement(query);
         statement.setInt(1, Integer.parseInt(jobId));
         statement.setString(2, coverLetter);
         statement.setString(3, applicationStatus);
         statement.setInt(4, Integer.parseInt(jobSeekerID));
         int rowsInserted = statement.executeUpdate();

         if (rowsInserted > 0) {
             return "Applied";
         }

   		
        }catch (SQLException e) 
        {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
        finally 
        {
           
            try 
            {
                if (rs != null) rs.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
		return "Error";
	}
	public Vector<Job> adminViewJobs()
	{
		  Vector<Job> jobs = new Vector<Job>();
          try {
	        String query = "SELECT * FROM Job";
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
	public Vector<Job> viewJobs()
	{
		  Vector<Job> jobs = new Vector<Job>();
          try {
	        String query = "SELECT * FROM Job where approve=true and status='open'";
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
	public Vector<Job> viewJobs(String a,String b,String c)
	{
		  Vector<Job> jobs = new Vector<Job>();
          try {
        	  String query = "SELECT * FROM Job where approve=true and status='open' ";
        	 if(!a.isEmpty())
        	 {
        		 query=query+"And title like '%"+a+"%' ";
        	 }
        	 if(!b.isEmpty())
        	 {
        		 query=query+"And location like '%"+b+"%' ";
        	 }
        	 if(!c.isEmpty())
        	 {
        		 query=query+"And category='"+c+"' ";
        	 }
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
}


