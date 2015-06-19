package model;

public class gongjiBoardDto {

	private int gongji_no;
	private String gongji_subject;
	private String gongji_content;
	private int gongji_count;
	private String gongji_regdate;
	private String member_name;
	private int member_no;

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getGongji_no() {
		return gongji_no;
	}

	public void setGongji_no(int gongji_no) {
		this.gongji_no = gongji_no;
	}

	public String getGongji_subject() {
		return gongji_subject;
	}

	public void setGongji_subject(String gongji_subject) {
		this.gongji_subject = gongji_subject;
	}

	public String getGongji_content() {
		return gongji_content;
	}

	public void setGongji_content(String gongji_content) {
		this.gongji_content = gongji_content;
	}

	public int getGongji_count() {
		return gongji_count;
	}

	public void setGongji_count(int gongji_count) {
		this.gongji_count = gongji_count;
	}

	public String getGongji_regdate() {
		return gongji_regdate;
	}

	public void setGongji_regdate(String gongji_regdate) {
		this.gongji_regdate = gongji_regdate;
	}

}
