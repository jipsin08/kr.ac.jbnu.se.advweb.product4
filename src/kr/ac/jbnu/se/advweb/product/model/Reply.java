package kr.ac.jbnu.se.advweb.product.model;

public class Reply {
	String contentID;
	String reply;
	
	public Reply(){
	}
	
	public String getContentID() {
		return contentID;
	}
	
	public void setContentID(String userId) {
		this.contentID = userId;
	}
	
	public String getReply() {
		return reply;
	}
	
	public void setReply(String reply) {
		this.reply = reply;
	}
}