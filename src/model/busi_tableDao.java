package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class busi_tableDao {

    private PreparedStatement pstmt;
      private Connection con;
      private ResultSet rs;
      private DataSource dataSource;
      
      
      public busi_tableDao(){
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
      
      public Vector getBusi_tableList(int num){
         
        
         String sql="select * from busi_table where business_no ='"+num+"'";
       
         Vector list = new Vector();
         try{
            con = dataSource.getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while(rs.next()){
               busi_tableDto dto = new busi_tableDto();
               dto.setTable_no(rs.getInt("table_no"));
               dto.setTable_use(rs.getString("table_use"));
               dto.setBusiness_no(rs.getInt("business_no"));
               dto.setTable_number(rs.getInt("table_number"));
            list.add(dto);
            }
            
            
         }catch(Exception e){
            System.out.println("setRegister 오류 : " + e);
      }
         finally{
            freeConnection();
         }
         return list; 
      }
   
}