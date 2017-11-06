package kr.ac.jbnu.se.advweb.product.model;

public class Reply {
   int contentID;
   String reply;
   
   public Reply(){
   }
   
   public Reply(int contentID, String reply) {
      this.contentID = contentID;
      this.reply = reply;
   }
   
   public int getContentID() {
      return contentID;
   }
   
   public void setContentID(int contentID) {
      this.contentID = contentID;
   }
   
   public String getReply() {
      return reply;
   }
   
   public void setReply(String reply) {
      this.reply = reply;
   }
}