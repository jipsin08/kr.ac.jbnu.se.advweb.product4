package kr.ac.jbnu.se.advweb.product.model;

public class UserAccount {

	private String userName;
	private String password;
	private boolean manager = false;

	public UserAccount() {

	}
	
	public UserAccount(String userName, String password, boolean manager) {
		this.userName = userName;
		this.manager = manager;
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}