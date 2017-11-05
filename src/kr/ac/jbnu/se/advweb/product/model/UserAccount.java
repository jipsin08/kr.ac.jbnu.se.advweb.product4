package kr.ac.jbnu.se.advweb.product.model;

public class UserAccount {

	private String userName;
	private String password;
	private String id;
	private String pw;
	private String imageurl;
	private String email;
	private String name;
	
	public UserAccount() {

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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw= pw;
	}
	public String getImageUrl() {
		return imageurl;
	}

	public void setImageUrl(String imageurl) {
		this.imageurl =imageurl;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email =email;
	}
	
	public String getName() {
		return email;
	}

	public void setName(String name) {
		this.name =name;
	}

	
	

	
}