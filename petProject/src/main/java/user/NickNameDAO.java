package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBconnection;

public class NickNameDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs; // DB data를 담는 객체
	
	public NickNameDAO() {
		try {
			conn = DBconnection.getConnection();
		}catch(Exception e) { System.out.println(e.getMessage()); }
	}
	
	public String getNickName(String userID) {
		String SQL = "SELECT NICKNAME FROM NICKNAME WHERE USERID=?";
		String nickName = "";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return nickName = rs.getString(1);
			}else {
				return nickName = "닉네임을 설정해주세요!";
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return nickName;
	}
	
	public void nickNameUpdate(String userID, String nickName) {
		
		String SQL = "UPDATE nickName SET nickName = ? WHERE USERID = ?";
		
        try {
        	pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, nickName);
			pstmt.setString(2, userID);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
	
}
