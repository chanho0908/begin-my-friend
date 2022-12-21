package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBconnection;

public class ImageDAO {
	Connection conn; //DB 접근 객체
	PreparedStatement pstmt;
	ResultSet rs; // DB data를 담는 객체
	
	public ImageDAO() {
		try {
			conn = DBconnection.getConnection();
			
		}catch(Exception e) {e.printStackTrace();}
	}
	
	public ArrayList<String> getImage(int boardID){
		String SQL = "SELECT FILENAME FROM FILE where boardID=?"; 
		ArrayList<String> path = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				path.add(rs.getString(1));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return path;
	}
	
	public void delete(int boardID){
		String SQL = "DELETE FROM FILE WHERE BOARDID=?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
}
