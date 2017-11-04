package kr.ac.jbnu.se.advweb.product.model;

public class UserSearch {

	private String id;
	private String imageUrl;

	public UserSearch(String id,String imageUrl) {
		this.id=id;
		this.imageUrl=imageUrl;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getid() {
		return id;
	}

	public void setid(String id) {
		this.id = id;
	}
	
	

}
