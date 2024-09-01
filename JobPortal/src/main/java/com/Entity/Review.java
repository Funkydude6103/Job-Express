package com.Entity;
import com.DB.ConnectorString;			
import java.sql.*;
import java.util.Vector;

public class Review {
	private String reviewText;
	public String getReviewText() {
		return reviewText;
	}
	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getJobSeekerID() {
		return jobSeekerID;
	}
	public void setJobSeekerID(String jobSeekerID) {
		this.jobSeekerID = jobSeekerID;
	}
	public String getEmployerID() {
		return employerID;
	}
	public void setEmployerID(String employerID) {
		this.employerID = employerID;
	}
	private int star;
	private String jobSeekerID;
	private String employerID;
	private String name;
	public Review(String reviewText, int star, String jobSeekerID, String employerID, String name) {
		super();
		this.reviewText = reviewText;
		this.star = star;
		this.jobSeekerID = jobSeekerID;
		this.employerID = employerID;
		this.name = name;
	}
	public Review(String reviewText, int star, String jobSeekerID, String employerID) {
		super();
		this.reviewText = reviewText;
		this.star = star;
		this.jobSeekerID = jobSeekerID;
		this.employerID = employerID;
	}
	public void Save()
	{
		 try {
	        	ConnectorString C=new ConnectorString();
		   		 Class.forName("com.mysql.cj.jdbc.Driver");
		        Connection conn = DriverManager.getConnection(C.url, C.username, C.password);
	            String sql = "Insert into Review (employerID,jobSeekerID,review,stars) VALUES(?,?,?,?)";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setString(1, this.employerID);
	            stmt.setString(2, this.jobSeekerID);
	            stmt.setString(3, this.reviewText);
	            stmt.setInt(4, this.star);
	            stmt.executeUpdate();
		 }catch (SQLException e) {
	            e.printStackTrace();
	        } catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	public Vector<Review> getReviewsByEmployerID(String employerID) {
	    Vector<Review> reviews = new Vector<Review>();
	    try {
	        ConnectorString C = new ConnectorString();
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection conn = DriverManager.getConnection(C.url, C.username, C.password);
	        String sql = "SELECT * FROM Review join user on jobSeekerId=ID WHERE employerID=?";
	        PreparedStatement stmt = conn.prepareStatement(sql);
	        stmt.setString(1, employerID);
	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            Review review = new Review();
	            review.setEmployerID(rs.getString("employerID"));
	            review.setJobSeekerID(rs.getString("jobSeekerID"));
	            review.setReviewText(rs.getString("review"));
	            review.setStar(rs.getInt("stars"));
	            review.setName(rs.getString("name"));
	            reviews.add(review);
	        }
	        rs.close();
	        stmt.close();
	        conn.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    }
	    return reviews;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
