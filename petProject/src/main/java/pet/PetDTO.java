package pet;

import java.util.Date;

public class PetDTO {
	private String userID;
	private String petName;
	private String petBirth;
	private String breed;
	private String petWeight;
	private String path;
	private String info;
	
	public PetDTO() {}
	
	public PetDTO(String userID, String petName, String petBirth, String breed, String petWeight, String path, String info) {
		this.userID = userID;
		this.petName = petName;
		this.petBirth = petBirth;
		this.breed = breed;
		this.petWeight = petWeight;
		this.path = path;
		this.info = info;
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
	public String getPetBirth() {
		return petBirth;
	}
	public void setPetBirth(String petBirth) {
		this.petBirth = petBirth;
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

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
	
	
}
