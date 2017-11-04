package kr.ac.jbnu.se.advweb.product.model;

public class notificationInfo {

	private String sender;
	private String receiver;
	private int friend_check;
	private int content_id;
	private String type;

	public String getSender() {
		return sender;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public int getFriend_check() {
		return friend_check;
	}

	public void setFriend_check(int friend_check) {
		this.friend_check = friend_check;
	}

	public int getContent_id() {
		return content_id;
	}

	public void setContent_id(int content_id) {
		this.content_id = content_id;
	}

}
