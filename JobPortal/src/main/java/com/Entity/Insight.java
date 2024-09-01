package com.Entity;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.DB.ConnectorString;

public class Insight {
	private int totalJobsPosted;
    private int totalAcceptedApplication;
    private int totalRejectedApplication;
    private int totalIntransitApplication;
    private double avgApplicationPerJob;
    private int partTimePending;
    private int partTimeAccepted;
    private int partTimeRejected;
    private int fullTimePending;
    private int fullTimeAccepted;
    private int fullTimeRejected;
    private int remotePending;
    private int remoteAccepted;
    private int remoteRejected;
    private int internshipPending;
    private int internshipAccepted;
    private int internshipRejected;
    public int getPartTimePending() {
		return partTimePending;
	}
	public void setPartTimePending(int partTimePending) {
		this.partTimePending = partTimePending;
	}
	public int getPartTimeAccepted() {
		return partTimeAccepted;
	}
	public void setPartTimeAccepted(int partTimeAccepted) {
		this.partTimeAccepted = partTimeAccepted;
	}
	public int getPartTimeRejected() {
		return partTimeRejected;
	}
	public void setPartTimeRejected(int partTimeRejected) {
		this.partTimeRejected = partTimeRejected;
	}
	public int getFullTimePending() {
		return fullTimePending;
	}
	public void setFullTimePending(int fullTimePending) {
		this.fullTimePending = fullTimePending;
	}
	public int getFullTimeAccepted() {
		return fullTimeAccepted;
	}
	public void setFullTimeAccepted(int fullTimeAccepted) {
		this.fullTimeAccepted = fullTimeAccepted;
	}
	public int getFullTimeRejected() {
		return fullTimeRejected;
	}
	public void setFullTimeRejected(int fullTimeRejected) {
		this.fullTimeRejected = fullTimeRejected;
	}
	public int getRemotePending() {
		return remotePending;
	}
	public void setRemotePending(int remotePending) {
		this.remotePending = remotePending;
	}
	public int getRemoteAccepted() {
		return remoteAccepted;
	}
	public void setRemoteAccepted(int remoteAccepted) {
		this.remoteAccepted = remoteAccepted;
	}
	public int getRemoteRejected() {
		return remoteRejected;
	}
	public void setRemoteRejected(int remoteRejected) {
		this.remoteRejected = remoteRejected;
	}
	public int getInternshipPending() {
		return internshipPending;
	}
	public void setInternshipPending(int internshipPending) {
		this.internshipPending = internshipPending;
	}
	public int getInternshipAccepted() {
		return internshipAccepted;
	}
	public void setInternshipAccepted(int internshipAccepted) {
		this.internshipAccepted = internshipAccepted;
	}
	public int getInternshipRejected() {
		return internshipRejected;
	}
	public void setInternshipRejected(int internshipRejected) {
		this.internshipRejected = internshipRejected;
	}
	private int totalUsers;
    public int getTotalUsers() {
		return totalUsers;
	}
	public void setTotalUsers(int totalUsers) {
		this.totalUsers = totalUsers;
	}
	public int getNoOfEmployers() {
		return noOfEmployers;
	}
	public void setNoOfEmployers(int noOfEmployers) {
		this.noOfEmployers = noOfEmployers;
	}
	public int getNoOfJobSeeker() {
		return noOfJobSeeker;
	}
	public void setNoOfJobSeeker(int noOfJobSeeker) {
		this.noOfJobSeeker = noOfJobSeeker;
	}
	private int noOfEmployers;
    private int noOfJobSeeker;
    
    public void calculateInsights() {
        try {
	        ConnectorString C=new ConnectorString();
   		    Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(C.url, C.username, C.password);
            String query = "SELECT COUNT(*) FROM Job";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                totalJobsPosted = rs.getInt(1);
            }

            query = "SELECT COUNT(*) FROM JobApplication WHERE applicationStatus = 'Accepted'";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            if (rs.next()) {
                totalAcceptedApplication = rs.getInt(1);
            }

            query = "SELECT COUNT(*) FROM JobApplication WHERE applicationStatus = 'Rejected'";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            if (rs.next()) {
                totalRejectedApplication = rs.getInt(1);
            }

            query = "SELECT COUNT(*) FROM JobApplication WHERE applicationStatus = 'pending'";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            if (rs.next()) {
                totalIntransitApplication = rs.getInt(1);
            }

            query = "SELECT AVG((SELECT COUNT(*) FROM JobApplication WHERE jobID = Job.ID)) FROM Job";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            if (rs.next()) {
                avgApplicationPerJob = rs.getDouble(1);
            }
            
            query = "SELECT COUNT(*) FROM User WHERE role = 'Employer'";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            if (rs.next()) {
                noOfEmployers = rs.getInt(1);
            }
            
            query = "SELECT COUNT(*) FROM User WHERE role = 'Job Seeker'";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            if (rs.next()) {
                noOfJobSeeker = rs.getInt(1);
            }
            
            query = "SELECT COUNT(*) FROM User";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            if (rs.next()) {
                totalUsers = rs.getInt(1);
            }
            
            query = "SELECT COUNT(*) FROM JobApplication WHERE applicationStatus = 'Pending' AND jobID IN (SELECT ID FROM Job WHERE category = 'Part_Time')";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            if (rs.next()) {
                partTimePending = rs.getInt(1);
            }

            query = "SELECT COUNT(*) FROM JobApplication WHERE applicationStatus = 'Accepted' AND jobID IN (SELECT ID FROM Job WHERE category = 'Part_Time')";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            if (rs.next()) {
                partTimeAccepted = rs.getInt(1);
            }

            query = "SELECT COUNT(*) FROM JobApplication WHERE applicationStatus = 'Rejected' AND jobID IN (SELECT ID FROM Job WHERE category = 'Part_Time')";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            if (rs.next()) {
                partTimeRejected = rs.getInt(1);
            }

            query = "SELECT COUNT(*) FROM JobApplication WHERE applicationStatus = 'Pending' AND jobID IN (SELECT ID FROM Job WHERE category = 'Full_Time')";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            if (rs.next()) {
                fullTimePending = rs.getInt(1);
            }

            query = "SELECT COUNT(*) FROM JobApplication WHERE applicationStatus = 'Accepted' AND jobID IN (SELECT ID FROM Job WHERE category = 'Full_Time')";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            if (rs.next()) {
                fullTimeAccepted = rs.getInt(1);
            }

            query = "SELECT COUNT(*) FROM JobApplication WHERE applicationStatus = 'Rejected' AND jobID IN (SELECT ID FROM Job WHERE category = 'Full_Time')";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            if (rs.next()) {
                fullTimeRejected = rs.getInt(1);
            }

            query = "SELECT COUNT(*) FROM JobApplication WHERE applicationStatus = 'Pending' AND jobID IN (SELECT ID FROM Job WHERE category = 'Remote')";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            if (rs.next()) {
                remotePending = rs.getInt(1);
            }

            query = "SELECT COUNT(*) FROM JobApplication WHERE applicationStatus = 'Accepted' AND jobID IN (SELECT ID FROM Job WHERE category = 'Remote')";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            if (rs.next()) {
                remoteAccepted = rs.getInt(1);
            }

            query = "SELECT COUNT(*) FROM JobApplication WHERE applicationStatus = 'Rejected' AND jobID IN (SELECT ID FROM Job WHERE category = 'Remote')";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            if (rs.next()) {
                remoteRejected = rs.getInt(1);
            }

            query = "SELECT COUNT(*) FROM JobApplication WHERE applicationStatus = 'Pending' AND jobID IN (SELECT ID FROM Job WHERE category = 'Internship')";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            if (rs.next()) {
                internshipPending = rs.getInt(1);
            }
            
            query = "SELECT COUNT(*) FROM JobApplication WHERE applicationStatus = 'Accepted' AND jobID IN (SELECT ID FROM Job WHERE category = 'Internship')";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            if (rs.next()) {
                internshipAccepted = rs.getInt(1);
            }
            
            query = "SELECT COUNT(*) FROM JobApplication WHERE applicationStatus = 'Rejected' AND jobID IN (SELECT ID FROM Job WHERE category = 'Internship')";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();
            if (rs.next()) {
                internshipRejected = rs.getInt(1);
            }
            

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
	public Insight() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getTotalJobsPosted() {
		return totalJobsPosted;
	}
	public void setTotalJobsPosted(int totalJobsPosted) {
		this.totalJobsPosted = totalJobsPosted;
	}
	public int getTotalAcceptedApplication() {
		return totalAcceptedApplication;
	}
	public void setTotalAcceptedApplication(int totalAcceptedApplication) {
		this.totalAcceptedApplication = totalAcceptedApplication;
	}
	public int getTotalRejectedApplication() {
		return totalRejectedApplication;
	}
	public void setTotalRejectedApplication(int totalRejectedApplication) {
		this.totalRejectedApplication = totalRejectedApplication;
	}
	public int getTotalIntransitApplication() {
		return totalIntransitApplication;
	}
	public void setTotalIntransitApplication(int totalIntransitApplication) {
		this.totalIntransitApplication = totalIntransitApplication;
	}
	public double getAvgApplicationPerJob() {
		return avgApplicationPerJob;
	}
	public void setAvgApplicationPerJob(double avgApplicationPerJob) {
		this.avgApplicationPerJob = avgApplicationPerJob;
	}
}
