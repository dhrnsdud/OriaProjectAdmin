package model;

public class freeBoardDto {
   private int freeboard_no;
   private String freeboard_subject;
   private String freeboard_content;
   private int freeboard_count;
   private String freeboard_regdate;
   private int freeboard_pos;
   private int freeboard_depth;
   private int freeboard_pass;
   private String member_name;
   private int member_no;
   private String freeboard_reply;

	public String getFreeboard_reply() {
		return freeboard_reply;
	}
	
	public void setFreeboard_reply(String freeboard_reply) {
		this.freeboard_reply = freeboard_reply;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

   
   public String getMember_name() {
      return member_name;
   }
   public void setMember_name(String member_name) {
      this.member_name = member_name;
   }
   public int getFreeboard_pass() {
      return freeboard_pass;
   }
   public void setFreeboard_pass(int freeboard_pass) {
      this.freeboard_pass = freeboard_pass;
   }
   public int getFreeboard_no() {
      return freeboard_no;
   }
   public void setFreeboard_no(int freeboard_no) {
      this.freeboard_no = freeboard_no;
   }
   public String getFreeboard_subject() {
      return freeboard_subject;
   }
   public void setFreeboard_subject(String freeboard_subject) {
      this.freeboard_subject = freeboard_subject;
   }
   public String getFreeboard_content() {
      return freeboard_content;
   }
   public void setFreeboard_content(String freeboard_content) {
      this.freeboard_content = freeboard_content;
   }
   public int getFreeboard_count() {
      return freeboard_count;
   }
   public void setFreeboard_count(int freeboard_count) {
      this.freeboard_count = freeboard_count;
   }
   public String getFreeboard_regdate() {
      return freeboard_regdate;
   }
   public void setFreeboard_regdate(String freeboard_regdate) {
      this.freeboard_regdate = freeboard_regdate;
   }
   public int getFreeboard_pos() {
      return freeboard_pos;
   }
   public void setFreeboard_pos(int freeboard_pos) {
      this.freeboard_pos = freeboard_pos;
   }
   public int getFreeboard_depth() {
      return freeboard_depth;
   }
   public void setFreeboard_depth(int freeboard_depth) {
      this.freeboard_depth = freeboard_depth;
   }
   
   
}