package pet;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import gLocation.LocationDTO;
import util.DBconnection;

public class PetDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs; // DB data를 담는 객체
	
	public PetDAO() {
		try {
			conn = DBconnection.getConnection();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public PetDTO getMyPet(String userID) {
		PetDTO dto = new PetDTO();
		String SQL = "select * from myPet where userID=?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setUserID(rs.getString(1));
				dto.setPetName(rs.getString(2));
				dto.setPetBirth(rs.getString(3));
				dto.setBreed(rs.getString(4));
				dto.setPetWeight(rs.getString(5));
				dto.setPath(rs.getString(6));
				dto.setInfo(rs.getString(7));
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
		return dto;
	}
	
	public String getImage(String userID) {
		PetDTO dto = new PetDTO();
		String SQL = "select path from myPet where userID=?";
		String path="";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				path = rs.getString(1);
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
		return path;
	}
	
	
	public void insert(PetDTO dto) {
		String SQL = "INSERT INTO myPet VALUES (?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, dto.getUserID());
			pstmt.setString(2, dto.getPetName());
			pstmt.setString(3, dto.getPetBirth());
			pstmt.setString(4, dto.getBreed());
			pstmt.setString(5, dto.getPetWeight());
			pstmt.setString(6, dto.getPath());
			pstmt.setString(7, dto.getInfo());
			
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
	
	public void update(String petName, String petBirth, String breed, String petWeight, String path, String info, String userID) {
		String SQL = "UPDATE MYPET SET petName = ?, petBirth = ?, breed = ?, petWeight = ?, path = ?, info=? where userID=?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, petName);
			pstmt.setString(2, petBirth);
			pstmt.setString(3, breed);
			pstmt.setString(4, petWeight);
			pstmt.setString(5, path);
			pstmt.setString(6, info);
			pstmt.setString(7, userID);
			
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
}
