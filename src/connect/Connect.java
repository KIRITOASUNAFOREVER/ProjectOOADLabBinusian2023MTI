package connect;

import java.sql.*;

import com.mysql.jdbc.ResultSetMetaData;

public class Connect {
	private final String USERNAME = "root";
	private final String PASSWORD = "";
	private final String DATABASE = "justduit";
	private final String HOST = "localhost:3306";
	private final String CONNECTION = String.format("jdbc:mysql://%s/%s", HOST, DATABASE);
	
	public ResultSet rs;
	public ResultSetMetaData rsm;
	private Connection con;
	private Statement st;
	private static Connect connect;
	
	private Connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(CONNECTION, USERNAME, PASSWORD);
			st = con.createStatement();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("Failed to Connect!");
		}
	}
	
	public static Connect getConnection() {
		if(connect == null) connect = new Connect();
		
		return connect;
	}
	
	public PreparedStatement prepareStatement(String query) {
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(query);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ps;
	}
	
	
}
