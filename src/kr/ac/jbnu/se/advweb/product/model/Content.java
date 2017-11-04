package kr.ac.jbnu.se.advweb.product.model;

public class Content {
	private int content_id;
	private int likes;
	private String user_id;
	private String content;
	private String category;
	private String path;

	public Content() {
		
	}
	
	public int getContent_id() {
		return content_id;
	}

	public void setContent_id(int content_id) {
		this.content_id = content_id;
	}

	public int getlikes() {
		return likes;
	}

	public void setlikes(int likes) {
		this.likes = likes;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public String getcontent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
}

