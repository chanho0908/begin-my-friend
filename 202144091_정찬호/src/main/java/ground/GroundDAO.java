package ground;
import java.sql.*;
import java.util.ArrayList;

import util.DBconnection;

public class GroundDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public GroundDAO() {
		try {
		conn = DBconnection.getConnection();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public GroundDTO getGround(int gno) {
		
		GroundDTO dto = new GroundDTO();
		String SQL = "select * from ground where gno=?";
		try {
			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, gno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setgName(rs.getString(2));
				dto.setPrice(rs.getInt(4));
				dto.setAddr(rs.getString(6));
				dto.setUseablecnt(rs.getString(7));
				dto.setGrass(rs.getString(8));
				dto.setSize(rs.getString(9));
				dto.setParking(rs.getInt(10));
				dto.setBallrent(rs.getInt(11));
				dto.setTemp(rs.getInt(12));
				dto.setShower(rs.getInt(13));
				dto.setVestrent(rs.getInt(14));
				dto.setShoeserent(rs.getInt(15));
				
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
	
	
	public LocationDTO getLocation(int gno) {
		
		LocationDTO dto = new LocationDTO();
		String SQL = "select lat, lng from gLocation where gno=?";
		try {
			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, gno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setLat(rs.getString(1));
				dto.setLng(rs.getString(2));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch (Exception e) {}			
		}
		return dto;
	}
	
	public ArrayList<GroundDTO> getSelectAll(){
		ArrayList<GroundDTO> g = new ArrayList<>();
		
		try {
			String SQL = "select * from ground where category=1 order by gno";
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GroundDTO dto = new GroundDTO();
				dto.setgNo(rs.getInt(1));
				dto.setgName(rs.getString(2));
				dto.setCategory(rs.getInt(3));
				dto.setPrice(rs.getInt(4));
				dto.setImg(rs.getString(5));
				dto.setAddr(rs.getString(6));
				
				g.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch (Exception e) {}			
		}
		return g;	
	}
	
	public ArrayList<GroundDTO> getSelectf(){
		ArrayList<GroundDTO> gnd = new ArrayList<>();
		
		try {
			String SQL = "select * from ground where category=1";
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GroundDTO dto = new GroundDTO();
				dto.setgNo(rs.getInt(1));
				dto.setgName(rs.getString(2));
				dto.setCategory(rs.getInt(3));
				dto.setPrice(rs.getInt(4));
				dto.setImg(rs.getString(5));
				dto.setAddr(rs.getString(6));
				
				gnd.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch (Exception e) {}			
		}
		return gnd;	
	}
	
	public ArrayList<GroundDTO> getSelects(){
		ArrayList<GroundDTO> g = new ArrayList<>();
		
		try {
			String SQL = "select * from ground where category=2";
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GroundDTO dto = new GroundDTO();
				dto.setgNo(rs.getInt(1));
				dto.setgName(rs.getString(2));
				dto.setCategory(rs.getInt(3));
				dto.setPrice(rs.getInt(4));
				dto.setImg(rs.getString(5));
				dto.setAddr(rs.getString(6));
				
				g.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch (Exception e) {}			
		}
		return g;	
	}
	
	
	
}
