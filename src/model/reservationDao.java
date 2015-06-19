package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class reservationDao {

    private PreparedStatement pstmt;
      private Connection con;
      private ResultSet rs;
      private DataSource dataSource;
      
      
      public reservationDao(){
    	  try{
              dataSource = (DataSource)new InitialContext().lookup("java:comp/env/jdbc/mysqlDB");
              
              
           }catch(Exception e){
                 System.out.println("DB연결 객체 준비 오류 : " + e);
           }
      }
      
      public void freeConnection(){
         if(con !=null) try{con.close();}catch(Exception err){}
         if(pstmt !=null) try{pstmt.close();}catch(Exception err){}
         if(rs !=null) try{rs.close();}catch(Exception err){}
         
      }
      public void insertReservation(reservationDto dto){ 
    	  //insert 
    	  String sql="insert into reservation(reser_content,reser_count,"
    	  		+ "reser_date,business_no,member_no) "
    	  		+ "values(?, '승인대기', curdate(), ?, ?)";
          try{
        	  System.out.println(sql);
        	  System.out.println("insertReservation 메서드 입구");
             con = dataSource.getConnection();
             pstmt = con.prepareStatement(sql);
             pstmt.setString(1, dto.getReser_content());
             pstmt.setInt(2, dto.getBusiness_no());
             pstmt.setInt(3, dto.getMember_no());
             System.out.println(pstmt);
             pstmt.executeUpdate();
             System.out.println("insertReservation 메서드 출구");

             
             
          }catch(Exception e){
        	  System.out.println("insertReservation 메서드 에러 : "+e);
       }
          finally{
             freeConnection();
          } 
       }
      
      
      public reservationDto reservationChk(String member_id){
    	  //insert 
    	  String sql="select m.member_name, b.business_name, r.reser_content, r.reser_count, r.reser_date from member m inner join reservation r on m.member_no = r.member_no inner join business b on r.business_no = b.business_no where m.member_id = '"+member_id+"';";
    	  reservationDto dto = new reservationDto();
    	  try{
        	  
             con = dataSource.getConnection();
             pstmt = con.prepareStatement(sql);
             rs = pstmt.executeQuery();
             
             if(rs.next()){
                       
             dto.setMember_name(rs.getString("member_name"));
             dto.setBusiness_name(rs.getString("business_name"));
             dto.setReser_content(rs.getString("reser_content"));
             dto.setReser_count(rs.getString("reser_count"));
             dto.setReser_date(rs.getString("reser_date"));
             }
           
             System.out.println("reservationChk 확인");
          }catch(Exception e){
        	  System.out.println("insertReservation 메서드 에러 : "+e);
       }
          finally{
             freeConnection();
          }
		return dto;
    
       }
}