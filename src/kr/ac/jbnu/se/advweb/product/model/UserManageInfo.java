package kr.ac.jbnu.se.advweb.product.model;

public class UserManageInfo {

	private String id;
	private String imageUrl;
	private int flag;        // 신고된 사람과 차단된 사람을 구분

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public UserManageInfo(String id, String imageUrl,int flag) {
		this.id = id;
		this.imageUrl = imageUrl;
		this.flag=flag;
	}

	public String getid() {
		return id;
	}

	public void setid(String id) {
		this.id = id;
	}

	public String getimageUrl() {
		return imageUrl;
	}

	public void setimageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	
}
