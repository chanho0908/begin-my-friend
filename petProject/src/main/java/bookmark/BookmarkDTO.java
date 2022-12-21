package bookmark;

import java.sql.Timestamp;

public class BookmarkDTO {
	private String userID;
	private int shopNo;
	private Timestamp reg;
	
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getShopNo() {
		return shopNo;
	}
	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}
	
}
