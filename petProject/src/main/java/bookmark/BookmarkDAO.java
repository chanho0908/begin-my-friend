package bookmark;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBconnection;

public class BookmarkDAO {
	Connection conn; //DB 접근 객체
	PreparedStatement pstmt;
	ResultSet rs; // DB data를 담는 객체
	
	public BookmarkDAO() {
		try {
			conn = DBconnection.getConnection();
		}catch (Exception e) {e.printStackTrace();}
	}
	
	public void insert(String userID, int shopNo) {
		String SQL = "INSERT INTO BOOKMARK VALUES (?,?,now())";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setInt(2, shopNo);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
			if(pstmt != null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<Integer> getList(String userID){
		String SQL = "SELECT shopNo FROM BOOKMARK WHERE USERID=?";
		ArrayList<Integer> list = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery(); 
			
			while (rs.next()) {
				list.add(rs.getInt(1));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public void delete(String userID, int shopNo) {

		String SQL = "DELETE FROM BOOKMARK WHERE USERID=? AND SHOPNO=?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setInt(2, shopNo);
			
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
