package kr.ac.jbnu.se.advweb.product.model;

public class UserSearch {

	private String userId;
	private String imageUrl;

	public UserSearch(String userId,String imageUrl) {
		this.userId=userId;
		this.imageUrl=imageUrl;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	

}
