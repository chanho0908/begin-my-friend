package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.DBconnection;

//데이터 베이스에 직접 접근하는 객체
public class UserDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs; // DB data를 담는 객체
	
	public UserDAO() {
		try {
			conn = DBconnection.getConnection();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public UserDTO getMember(String userID) {
		String SQL = "SELECT * FROM USER WHERE USERID=?";
		UserDTO user = null;
        
    	try {
    		pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            
    		if(rs.next()) {
    			user = new UserDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
					rs.getInt(5), rs.getString(6), rs.getTimestamp(7));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch (Exception e) {e.printStackTrace();}
		}
    	
		return user;
	}
	
	public int login(String userID, String userPassword) throws SQLException {
		int result = 1;
        String SQL = "SELECT USERPASSWORD FROM USER WHERE USERID = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if(rs.next()){
                if(rs.getString(1).equals(userPassword)) {
                	result = 1;
                    return result;    // 로그인 성공
            	}else {
            		result = 2;
            		return result;  // 비밀번호 불일치
            	}
            }else{
            	return 0; // ID가 없음
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
        	if(rs != null) rs.close();
        	if(pstmt != null) pstmt.close();
        }
        return -2; // DB 오류
    }
	
	public void UserUpdate(String userName, String userAge, String userPhone, String userID) {
		
		String SQL = "UPDATE USER SET USERNAME = ?, USERAGE= ?, USERPHONE = ? WHERE USERID = ?";
		
        try {
        	pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, userName);
			pstmt.setString(2, userAge);
			pstmt.setString(3, userPhone);
			pstmt.setString(4, userID);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
	
	public void deleteUser(String userID) {
		String SQL = "DELETE FROM USER WHERE USERID = ?";
		
		try {
        	pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
}
