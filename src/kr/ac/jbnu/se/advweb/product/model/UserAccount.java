package kr.ac.jbnu.se.advweb.product.model;

public class UserAccount {

	private String id;
	private String password;
	private String imageUrl;
	private String email;
	private String name;
	private int black_check;

	public UserAccount() {

	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getBlack_check() {
		return black_check;
	}

	public void setBlack_check(int black_check) {
		this.black_check = black_check;
	}

	public UserAccount(String id, String password, String imageUrl) {
		this.id = id;
		this.imageUrl = imageUrl;
		this.password = password;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}