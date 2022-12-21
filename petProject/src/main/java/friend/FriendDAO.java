package friend;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import gLocation.LocationDTO;
import user.UserDTO;
import util.DBconnection;

public class FriendDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs; // DB data를 담는 객체
	
	public FriendDAO() {
		try {
			conn = DBconnection.getConnection();
		}catch(Exception e) { System.out.println(e.getMessage()); }
	}
	
	public ArrayList<MyFriends> getMyFriend(String myID) {
		ArrayList<MyFriends> friends = new ArrayList<>();
		MyFriends friend;
		String SQL = "select b.petname, breed, petWeight, a.userid, path from user a, friend b, mypet c "
				+ "where a.userid = b.userid and b.userid = c.userid AND myid=?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, myID);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				friend = new MyFriends();
				friend.setPetName(rs.getString(1));
				friend.setBreed(rs.getString(2));
				friend.setPetWeight(rs.getString(3));
				friend.setUserID(rs.getString(4));
				friend.setPath(rs.getString(5));
				
				friends.add(friend);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch (Exception e) {
				e.printStackTrace();
			}	finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
				}catch (Exception e) {}			
			}		
		}
		return friends;
	}	
	
	public void addFriend(FriendDTO dto) {
		String SQL = "INSERT INTO FRIEND VALUES (?, ?, ?)";
		UserDTO user = null;
        
    	try {
    		pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, dto.getMyID());
            pstmt.setString(2, dto.getUserID());
            pstmt.setString(3, dto.getPetName());
            
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
	
	public void deleteFriend(String friendID) {
		String SQL = "DELETE FROM FRIEND WHERE FRIENDID=?";
        
    	try {
    		pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, friendID);
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
}
