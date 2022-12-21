package reservation;

import java.sql.Timestamp;

public class ReserveDTO {
	private int gNo;
	private String gName;
	private String userID;
	private String state;
	private String resvedate;
	private int price;
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getResvedate() {
		return resvedate;
	}
	public void setResvedate(String resvedate) {
		this.resvedate = resvedate;
	}
	public Timestamp getRes() {
		return res;
	}
	public void setRes(Timestamp res) {
		this.res = res;
	}
	private Timestamp res;
	
	public int getgNo() {
		return gNo;
	}
	public void setgNo(int gNo) {
		this.gNo = gNo;
	}
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
	
}
