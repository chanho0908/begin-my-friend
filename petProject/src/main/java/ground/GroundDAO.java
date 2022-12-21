package ground;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import util.DBconnection;


public class GroundDAO {
	Connection conn; //DB 접근 객체
	PreparedStatement pstmt;
	ResultSet rs; // DB data를 담는 객체
	
	public GroundDAO() {
		try {
		conn = DBconnection.getConnection();
		}catch (Exception e) {}
	}
	
	public GroundDTO getGround(int shopno) {
		
		GroundDTO dto = new GroundDTO();
		String SQL = "select * from ground where shopno=?";
		try {
			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, shopno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setShopName(rs.getString(2));
				dto.setImg(rs.getString(3));
				dto.setAddr(rs.getString(4));
				dto.setOpTimeMon(rs.getString(5));
				dto.setOpTimeTue(rs.getString(6));
				dto.setOpTimeWen(rs.getString(7));
				dto.setOpTimeThu(rs.getString(8));
				dto.setOpTimeFri(rs.getString(9));
				dto.setOpTimeSat(rs.getString(10));
				dto.setOpTimeSun(rs.getString(11));
				dto.setCsTimeMon(rs.getString(12));
				dto.setCsTimeTue(rs.getString(13));
				dto.setCsTimeWen(rs.getString(14));
				dto.setCsTimeThu(rs.getString(15));
				dto.setCsTimeFri(rs.getString(16));
				dto.setCsTimeSat(rs.getString(17));
				dto.setCsTimeSun(rs.getString(18));
				dto.setParking(rs.getInt(19));
				dto.setWifi(rs.getInt(20));
				dto.setReserve(rs.getInt(21));
				dto.setHour(rs.getInt(22));
				dto.setTel(rs.getString(23));
				dto.setDog(rs.getInt(24));
				dto.setBigDog(rs.getInt(25));
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
	
	public ArrayList<GroundDTO> getSelect(){
		ArrayList<GroundDTO> cs = new ArrayList<>();
		
		try {
			String SQL = "select * from ground";
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GroundDTO dto = new GroundDTO();
				dto.setShopName(rs.getString(2));
				dto.setImg(rs.getString(3));
				dto.setAddr(rs.getString(4));
				dto.setOpTimeMon(rs.getString(5));
				dto.setOpTimeTue(rs.getString(6));
				dto.setOpTimeWen(rs.getString(7));
				dto.setOpTimeThu(rs.getString(8));
				dto.setOpTimeFri(rs.getString(9));
				dto.setOpTimeSat(rs.getString(10));
				dto.setOpTimeSun(rs.getString(11));
				dto.setCsTimeMon(rs.getString(12));
				dto.setCsTimeTue(rs.getString(13));
				dto.setCsTimeWen(rs.getString(14));
				dto.setCsTimeThu(rs.getString(15));
				dto.setCsTimeFri(rs.getString(16));
				dto.setCsTimeSat(rs.getString(17));
				dto.setCsTimeSun(rs.getString(18));
				dto.setParking(rs.getInt(19));
				dto.setWifi(rs.getInt(20));
				dto.setReserve(rs.getInt(21));
				dto.setHour(rs.getInt(22));
				dto.setTel(rs.getString(23));
				dto.setDog(rs.getInt(24));
				dto.setBigDog(rs.getInt(25));
				
				cs.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch (Exception e) {}			
		}
		return cs;	
	}
	
	public ArrayList<String> getImgPath(int shopNo){
		String SQL = "Select * from images where shopno=?";
		ArrayList<String> imgPath = new ArrayList<>();
		
		try {
			conn = DBconnection.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, shopNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				imgPath.add(rs.getString(2));
				
			}
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
		return imgPath;
	}
	
}
