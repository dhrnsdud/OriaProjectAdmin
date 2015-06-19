package model;

public class reservationDto {
   private int reservation_no;
   private String reser_content;
   private String reser_count;
   private String reser_date;
   private int business_no;
   private int member_no;
   private String member_name;
   private String business_name;
   
   
   
   
public String getMember_name() {
	return member_name;
}
public void setMember_name(String member_name) {
	this.member_name = member_name;
}
public String getBusiness_name() {
	return business_name;
}
public void setBusiness_name(String business_name) {
	this.business_name = business_name;
}
public int getReservation_no() {
	return reservation_no;
}
public void setReservation_no(int reservation_no) {
	this.reservation_no = reservation_no;
}
public String getReser_content() {
	return reser_content;
}
public void setReser_content(String reser_content) {
	this.reser_content = reser_content;
}
public String getReser_count() {
	return reser_count;
}
public void setReser_count(String reser_count) {
	this.reser_count = reser_count;
}
public String getReser_date() {
	return reser_date;
}
public void setReser_date(String reser_date) {
	this.reser_date = reser_date;
}
public int getBusiness_no() {
	return business_no;
}
public void setBusiness_no(int business_no2) {
	this.business_no = business_no2;
}
public int getMember_no() {
	return member_no;
}
public void setMember_no(int member_no) {
	this.member_no = member_no;
}
   
   
   
   
}