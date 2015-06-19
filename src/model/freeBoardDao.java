package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.sql.DataSource;



public class freeBoardDao{
    private PreparedStatement pstmt;
    private PreparedStatement pstmts;
     private Connection con;
     private ResultSet rs;
     private ResultSet rs1;
     private DataSource dataSource;
     
     public freeBoardDao(){
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
     public Vector getBoardList(String keyField, String keyWord){
         Vector list = new Vector();
         String sql="";
         if(keyField !=null || keyWord != null){
            sql = "select m.member_no,m.member_name,f.freeboard_no,f.freeboard_subject,"
                     + "f.freeboard_content,f.freeboard_count,f.freeboard_regdate, f.freeboard_pos,"
                     + "f.freeboard_depth from free_board f inner join member m "
                     + "on f.member_no = m.member_no where "
                     + keyField+ " like '%"+keyWord+"%'  order by freeboard_no desc"; 
         System.out.println("if");
         System.out.println("keyword1"+keyWord);
         System.out.println("keyfield1"+keyField);
         }
         else{
            sql = "select m.member_no,m.member_name,f.freeboard_no,f.freeboard_subject,"
                  + "f.freeboard_content,f.freeboard_count,f.freeboard_regdate,f.freeboard_pos,"
                  + "f.freeboard_depth from free_board f inner join member m "
                  + "on f.member_no = m.member_no order by freeboard_no desc";
            System.out.println("else");
            System.out.println("keyword"+keyWord);
            System.out.println("keyfield"+keyField);
         } 
         try{
            con = dataSource.getConnection();
            pstmt = con.prepareStatement(sql);            
            rs = pstmt.executeQuery();
            
            while(rs.next()){
           
           freeBoardDto dto = new freeBoardDto();
           
            dto.setFreeboard_no(rs.getInt("freeboard_no"));
              dto.setMember_name(rs.getString("member_name"));
            dto.setMember_no(rs.getInt("member_no"));
            dto.setFreeboard_subject(rs.getString("freeboard_subject"));
            dto.setFreeboard_content(rs.getString("freeboard_content"));
            dto.setFreeboard_count(rs.getInt("freeboard_count"));
            dto.setFreeboard_regdate(rs.getString("freeboard_regdate"));
            dto.setFreeboard_pos(rs.getInt("freeboard_pos"));
            dto.setFreeboard_depth(rs.getInt("freeboard_depth"));
            dto.setMember_no(rs.getInt("member_no"));
            list.add(dto);
            
            }
         }catch(Exception err){
            System.out.println("getBoardList : " + err);
         }
         finally{
            freeConnection();
         }
         return list;
      }
     
        
    /* public void updatePos(Connection con){
        try{
           String sql = "update free_board set freeboard_pos=freeboard_pos+1";
           pstmt = con.prepareStatement(sql);
           pstmt.executeUpdate();
           
        }
        catch(Exception err){
           System.out.println("updatePos :"+err);
        }
     }*/
     
     // ID 가져오기
     public String getMemberList(String member_id) throws SQLException{
        
         String sql="";
         String member_name = null;
         sql = "select member_name from member where member_id = '"+member_id+"';";
         //sql = "select member_name from member where member_no='"+member_no+"';";
         try{
            con = dataSource.getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
               
            rs.next();
            member_name = rs.getString("member_name");
            
            
         }catch(Exception err){
            System.out.println("getMemberList : " + err);
         }
         finally{
            freeConnection();
         }
         return member_name;
      }
     
    
     //member_no가져오기
     public int getMemberNo(String member_id){
        String sql ="";
        int member_no = 0;
        sql = "select member_no from member where member_id= '"+member_id+"';";
        
        try{
             con = dataSource.getConnection();
             pstmt = con.prepareStatement(sql);
             rs = pstmt.executeQuery();
                
             rs.next();
             member_no = rs.getInt("member_no");
             
             
          }catch(Exception err){
             System.out.println("getMemberList : " + err);
          }
          finally{
             freeConnection();
          }
          return member_no;
       }
     
     // Post.jsp
     public void insertBoard(freeBoardDto dto, String member_id){
           freeBoardDao dao = new freeBoardDao();
       int member_no = dao.getMemberNo(member_id);
        
        
        
        String sql = "INSERT INTO free_board(freeboard_subject, freeboard_content, freeboard_count, freeboard_regdate, freeboard_pos, freeboard_depth,member_no) VALUES (?, ?,  0, sysdate(),0,0,"+member_no+" )";
       
        
        try{
           con = dataSource.getConnection();
           pstmt = con.prepareStatement(sql);
           
        
           pstmt.setString(1, dto.getFreeboard_subject());
           pstmt.setString(2, dto.getFreeboard_content());
           
           
           pstmt.executeUpdate();
           
           
        }catch(Exception err){
           System.out.println("insertBoard()  : " + err);
        }
        finally{freeConnection();}
     }
     
     //Read.jsp , Update.jsp
    public freeBoardDto getBoard(int freeboard_no, String page){
        String sql = "";
        freeBoardDto dto = new freeBoardDto();
        System.out.println("겟보드연결");
              try{         
                 con = dataSource.getConnection();
                 
                 if(page.equals("freeboardRead")){
                    sql = "update free_board set freeboard_count=freeboard_count+1 where freeboard_no=?";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setInt(1,freeboard_no);
                    pstmt.executeUpdate();
                 }
                 
                 sql = "select m.member_no,m.member_name,f.freeboard_no,f.freeboard_subject,"
                       + "f.freeboard_content,f.freeboard_count,f.freeboard_regdate,f.freeboard_pos,"
                       + "f.freeboard_depth from free_board f inner join member m "
                       + "on f.member_no = m.member_no where freeboard_no =?";
                 pstmt = con.prepareStatement(sql);
                 pstmt.setInt(1, freeboard_no);
                 rs = pstmt.executeQuery();
               
                 
     
                 if(rs.next()){
                   dto.setMember_name(rs.getString("member_name")); 
                    dto.setFreeboard_content(rs.getString("freeboard_content"));
                    dto.setFreeboard_count(rs.getInt("freeboard_count"));
                    dto.setFreeboard_depth(rs.getInt("freeboard_depth"));                   
                    dto.setFreeboard_regdate(rs.getString("freeboard_regdate"));
                    dto.setFreeboard_pos(rs.getInt("freeboard_pos"));                    
                    dto.setFreeboard_subject(rs.getString("freeboard_subject"));                    
                    dto.setFreeboard_no(rs.getInt("freeboard_no"));
                    
                 //   list.add(dto);
                    
                 }
                 
                 
              }catch(Exception err){
                 System.out.println("getBoard()  : " + err);
              }
              finally{freeConnection();}
              return dto;
     }

  // Updateproc.jsp
     public void updateBoard(String freeboard_subject, String freeboard_content, int freeboard_no){
        String sql = "update free_board set freeboard_subject=?, freeboard_content=? "
              + "where freeboard_no=?" ;
        
        System.out.println("updateBoard연결"
              + "");
     try{
        con = dataSource.getConnection();
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, freeboard_subject);
        //System.out.println(dto.getFreeboard_subject()+"subject");
        pstmt.setString(2, freeboard_content);
        //System.out.println(dto.getFreeboard_content()+"content");
        pstmt.setInt(3, freeboard_no);
        //System.out.println(dto.getFreeboard_no()+"freeboard_no");
        
        pstmt.executeUpdate();
        
           
        }catch(Exception err){System.out.println("updateBoard() : " + err);}
        finally{ freeConnection();}
     }
    
     // delete
     public void deleteBoard(int freeboard_no){
        String sql = "delete from free_board where freeboard_no = ?";
        System.out.println("Daodeleteboard접속");
        try{
           con = dataSource.getConnection();
           pstmt = con.prepareStatement(sql);
           pstmt.setInt(1, freeboard_no);
           pstmt.executeUpdate();
           
           
        }catch(Exception err){ System.out.println("deleteBoard : " + err);}
        finally{ freeConnection();}
     }
     /*
     //ReplyProc.jsp 부모의 포지션 넘겨받기
     public void relpyUpdatePos(freeBoardDto dto){
        try{
           String sql = "update free_board set freeboard_pos=freeboard_pos+1 where freeboard_pos>?";
           con=dataSource.getConnection();
           pstmt = con.prepareStatement(sql);
           pstmt.setInt(1, dto.getFreeboard_pos());
           pstmt.executeUpdate();
        }
        catch(Exception err){
           System.out.println("relpyUpdatePos : "+err);
        }
     }
     
     //자식의 값
     public void replyBoard(freeBoardDto dto, memberDto mdto){
        String sql = "INSERT INTO free_board(member_no, freeboard_subject, freeboard_content, freeboard_count, "
              + "freeboard_regdate, freeboard_pos, freeboard_depth) VALUES ( ?, ?, 0, ?, sysdate(),0,0 )";
         
         
         try{
            con = dataSource.getConnection();
            pstmt = con.prepareStatement(sql);
                          
            pstmt.setString(1, dto.getMember_name());
            pstmt.setString(4, dto.getFreeboard_subject());
            pstmt.setString(5, dto.getFreeboard_content());
            pstmt.setInt(8, dto.getFreeboard_pos()+1);
            pstmt.setInt(9,dto.getFreeboard_depth()+1);
            pstmt.executeUpdate();
         }
        catch(Exception err){
           System.out.println("replyBoard : "+err);
        }
     }*/
     
  }