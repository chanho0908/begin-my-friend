package gLocation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import hospital.HospitalDTO;
import util.DBconnection;

public class LocationDAO {
	Connection conn; //DB 접근 객체
	PreparedStatement pstmt;
	ResultSet rs; // DB data를 담는 객체
	
	public LocationDAO() {
		try {
		conn = DBconnection.getConnection();
		}catch (Exception e) {}
	}
	
	public LocationDTO getLocation(int shopNo) {
		LocationDTO dto = new LocationDTO();
		String SQL = "select * from gLocation where shopNo=?";
		
		try {
			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, shopNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setLat(rs.getString(2));
				dto.setLng(rs.getString(3));
				dto.setUrl(rs.getString(4));
				
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
	
	public ArrayList<LocationDTO> getAllLocation() {
		ArrayList<LocationDTO> list = new ArrayList<>();
		LocationDTO dto;
		String SQL = "select * from gLocation";
		
		try {
			
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new LocationDTO();
				dto.setShopno(rs.getInt(1));
				dto.setLat(rs.getString(2));
				dto.setLng(rs.getString(3));
				dto.setUrl(rs.getString(4));
				
				list.add(dto);
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
		return list;
	}	
		
	
}
