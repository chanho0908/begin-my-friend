package reserve;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import util.DBconnection;

public class ReserveDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs; // DB data를 담는 객체
	
	public ReserveDAO() {
		try {
			conn = DBconnection.getConnection();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public void setReserve(ReserveDTO dto) {
		String SQL = "INSERT INTO RESERVE VALUES (?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, dto.getShopNo());
			pstmt.setString(2, dto.getUserID());
			pstmt.setString(3, dto.getResDate());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch (Exception e) {e.printStackTrace();}
		}	
	}
	
	public ArrayList<ReserveList> getReserveList(int shopNo){
		String SQL = "SELECT PATH, PETNAME, PETBIRTH, BREED, PETWEIGHT, RESDATE, A.USERID "
				+ "FROM MYPET A, RESERVE B WHERE A.USERID = B.USERID AND SHOPNO = ? ORDER BY RESDATE";
		ArrayList<ReserveList> list = new ArrayList<>();
		ReserveList rsl;
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, shopNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				rsl = new ReserveList();
				rsl.setPath(rs.getString(1));
				rsl.setPetName(rs.getString(2));
				rsl.setPetBirth(rs.getString(3));
				rsl.setBreed(rs.getString(4));
				rsl.setPetWeight(rs.getString(5));
				rsl.setResDate(rs.getString(6));
				rsl.setUserID(rs.getString(7));
				
				list.add(rsl);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch (Exception e) {e.printStackTrace();}
		}
		return list;
	}
	
	public void delete(String userID, int shopNo, String resDate) {

		String SQL = "DELETE FROM RESERVE WHERE USERID=? AND SHOPNO=? AND RESDATE=?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setInt(2, shopNo);
			pstmt.setString(3, resDate);
			
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
			if(pstmt != null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<LocalDateTime> getLDTimes() {
		String SQL = "SELECT RESDATE FROM RESERVE";
		ArrayList<LocalDateTime> getTimes = new ArrayList<>();
		LocalDateTime date;
		// 포맷터
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd일 HH:mm");
		String dateStr;
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dateStr = rs.getString(1);
		        // 문자열 -> Date
		        date = LocalDateTime.parse(dateStr, formatter);
		        getTimes.add(date);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
			if(pstmt != null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return getTimes;
	}
	
	public void delBeforReserve(String date) {
		String SQL = "DELETE FROM RESERVE WHERE RESDATE=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, date);
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
			if(pstmt != null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
}
