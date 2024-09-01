package com.Entity;
import com.DB.ConnectorString;				
import java.sql.*;
public class User {
	    protected String ID;
	    protected String email;
	    protected String password;
	    protected String name;
	    protected int age;
		public String getID() {
			return ID;
		}
		public void setID(String iD) {
			ID = iD;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getAge() {
			return age;
		}
		public void setAge(int age) {
			this.age = age;
		}
		public User() {
			super();
			// TODO Auto-generated constructor stub
		}
		public User(String iD, String email, String password, String name, int age) {
			super();
			ID = iD;
			this.email = email;
			this.password = password;
			this.name = name;
			this.age = age;
		}
	    public String login(String email ,String Passsword)
	    {
	    	 try {
	    		 ConnectorString C=new ConnectorString();
	    		 Class.forName("com.mysql.cj.jdbc.Driver");
	             Connection conn = DriverManager.getConnection(C.url, C.username, C.password);
	             String query = "SELECT ID, role FROM User WHERE email=? AND password=?";
	             PreparedStatement stmt = conn.prepareStatement(query);
	             stmt.setString(1, email);
	             stmt.setString(2, Passsword);
	             ResultSet rs = stmt.executeQuery();
	             if (rs.next()) 
	             {
	                 String userID = rs.getString("ID");
	                 String role = rs.getString("role");
	                 return userID +","+ role;
	             } else 
	             {
	                 return "denied";
	             }
	         } catch (SQLException e) 
	    	 {
	             	
	             return "denied";
	         } 
	    	 catch (ClassNotFoundException e) 
	    	 {
				return e.toString();
			}
	    }

}
