package reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBconnection;

public class ReserveDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public ReserveDAO() {
		try {
		conn = DBconnection.getConnection();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean isReserved(int gno, String rDate, String rTime) {
		String SQL = "SELECT reservedate FROM reservation where gno= ?";
		String getrDate="";
		boolean result = true;
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, gno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				getrDate = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		String day = getrDate.substring(0, 6);
		String time = getrDate.substring(8, 21);
		
		if(!rDate.equals(day) && !rTime.equals(time)) {
			return result = true;
		}else {
			return result = false;
			
		}
	}
	
	
	
}
