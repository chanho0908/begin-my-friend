package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBconnection;

//데이터 베이스에 직접 접근하는 객체
public class BoardDAO {
	Connection conn; //DB 접근 객체
	PreparedStatement pstmt;
	ResultSet rs; // DB data를 담는 객체
	
	public BoardDAO() {
		try {
			conn = DBconnection.getConnection();
			
		}catch(Exception e) {e.printStackTrace();}
	}
	
	public int getNext() {
		
		String SQL = "SELECT boardID FROM BOARD ORDER BY boardID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		}catch (Exception e) {
			e.printStackTrace();
		}return -1;
	}
	
	public int write(String boardTitle, String userID, String boardContent) {
		
		String SQL = "INSERT INTO BOARD VALUES(?,?,?,now(),?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, boardTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, boardContent);
			pstmt.setInt(5, 1);
			
			return pstmt.executeUpdate();			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;	
	}
	
	public ArrayList<BoardDTO> getList(int pageNumber){
		String SQL = "SELECT * FROM BOARD where boardID < ? AND boardAvailable = 1 ORDER BY boardID DESC LIMIT 10";
		ArrayList<BoardDTO> list = new ArrayList();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setBoardID(rs.getInt(1));
				dto.setBoardTitle(rs.getString(2));
				dto.setUserID(rs.getString(3));
				dto.setBoardDate(rs.getString(4));
				dto.setBoardContent(rs.getString(5));
				dto.setBoardAvailable(rs.getInt(6));
				
				list.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}return list;
	}
	
	public boolean nextPage(int pageNumber) { // 마지막 페이지 지정
		String SQL = "SELECT * FROM BOARD where boardID < ? AND boardAvailable = 1";
		ArrayList<BoardDTO> list = new ArrayList<>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}return false;
		
	}
	
	public BoardDTO getBoard(int boardID) {
		
		String SQL = "SELECT * FROM BOARD where boardID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setBoardID(rs.getInt(1));
				dto.setBoardTitle(rs.getString(2));
				dto.setUserID(rs.getString(3));
				dto.setBoardDate(rs.getString(4));
				dto.setBoardContent(rs.getString(5));
				dto.setBoardAvailable(rs.getInt(6));
	
				return dto;
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}return null;
	}
	
	public int update(int boardID, String boardTitle, String boardContent) {
		String SQL = "UPDATE BOARD SET boardTitle=?, boardContent = ? where boardID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, boardTitle);
			pstmt.setString(2, boardContent);
			pstmt.setInt(3, boardID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(int boardID) {
		String SQL = "UPDATE BOARD SET boardAvailable = 0 where boardID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
