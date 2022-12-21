package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBconnection {
	private static Connection conn;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		if(conn == null) {
			String dbURL = "jdbc:mysql://localhost:3306/PLAYGROUND?autoReconnect=true"; // localhost:3306 => 컴퓨터에 설치된 MySql
			String dbID = "root";
			String dbPassword = "1234";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			if(conn == null) {
				System.out.println("연결 실패");
			}else {
				System.out.println("연결 성공");
			}
		}
		
		return conn;
	}
	
		
		
		
	
	
}
