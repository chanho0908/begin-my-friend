package reserve;

public class ReserveDTO {
	private int shopNo;
	private String userID;
	private String resDate;
	
	
	public ReserveDTO(int shopNo, String userID, String resDate) {
		super();
		this.shopNo = shopNo;
		this.userID = userID;
		this.resDate = resDate;
	}
	
	public int getShopNo() {
		return shopNo;
	}
	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getResDate() {
		return resDate;
	}
	public void setResDate(String resDate) {
		this.resDate = resDate;
	}
	
	
}
