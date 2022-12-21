package user;

import java.sql.Timestamp;

public class UserDTO {
	private String userID;
	private String userPassword;
	private String userName;
	private String userGender;
	private String userAge;
	private String userPhone;
	private Timestamp reg;
	
	public Timestamp getReg() {
		return reg;
	}

	public void setReg(Timestamp reg) {
		this.reg = reg;
	}

	public UserDTO() {
		
	}
	
	public UserDTO(String userID, String userPassword, String userName, String userGender, String userAge,
			String userPhone, Timestamp reg) {
		
		this.userID = userID;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userGender = userGender;
		this.userAge = userAge;
		this.userPhone = userPhone;
		this.reg = reg;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserAge() {
		return userAge;
	}

	public void setUserAge(String userAge) {
		this.userAge = userAge;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	

	
}
