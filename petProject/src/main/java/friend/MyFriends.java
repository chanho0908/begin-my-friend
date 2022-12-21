package friend;

public class MyFriends {
	private String userID;
	private String petName;
	private String breed;
	private String petWeight;
	private String path;
	
	public MyFriends() {
		super();
	}
	
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public String getBreed() {
		return breed;
	}

	public void setBreed(String breed) {
		this.breed = breed;
	}

	public String getPetWeight() {
		return petWeight;
	}

	public void setPetWeight(String petWeight) {
		this.petWeight = petWeight;
	}
}
