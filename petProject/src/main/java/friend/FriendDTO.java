package friend;

public class FriendDTO {
	private String userID;
	private String myID;
	private String petName;

	
	public FriendDTO(String myID, String userID, String petName) {
		super();
		this.myID = myID;
		this.userID = userID;
		this.petName = petName;
	}
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getMyID() {
		return myID;
	}
	public void setMyID(String myID) {
		this.myID = myID;
	}
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	
		
}
