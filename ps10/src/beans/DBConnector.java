package beans;

import java.sql.*;

public class DBConnector {
	public Connection con;
	public Statement stmt;
	public DBConnector() throws Exception {
		try{
		 	String userName = "cs5530u11";
	   		String password = "ci2v9b";
	        	String url = "jdbc:mysql://georgia.eng.utah.edu/cs5530db11";
		        Class.forName ("com.mysql.jdbc.Driver").newInstance ();
        		con = DriverManager.getConnection (url, userName, password);
			stmt = con.createStatement();
        } catch(Exception e) {
			System.err.println("Unable to open mysql jdbc connection. The error is as follows,\n");
            		System.err.println(e.getMessage());
			throw(e);
		}
	}
	
	public void closeConnection() throws Exception{
		con.close();
	}
}
