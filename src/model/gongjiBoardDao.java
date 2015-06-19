package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class gongjiBoardDao {
    private PreparedStatement pstmt;
       private PreparedStatement pstmts;
        private Connection con;
        private ResultSet rs;
        private ResultSet rs1;
        private DataSource dataSource;
        
        public gongjiBoardDao(){
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
               /*sql = "select * from gongji_board where "+ keyField+ " like '%"+keyWord+"%' order by gongji_no desc";*/
               sql = "select m.member_no,m.member_name,g.gongji_no,g.gongji_subject,"
                     + "g.gongji_content,g.gongji_count,g.gongji_regdate "
                     + "from gongji_board g inner join member m "
                     + "on g.member_no = m.member_no where "
                     + keyField+ " like '%"+keyWord+"%'  order by gongji_no desc"; 
                  
            }
            else{
               sql = "select m.member_no,m.member_name,g.gongji_no,g.gongji_subject,"
                     + "g.gongji_content,g.gongji_count,g.gongji_regdate "
                     + "from gongji_board g inner join member m "
                     + "on g.member_no = m.member_no order by gongji_no desc";
               System.out.println("else문걸림");
            }
            try{
               con = dataSource.getConnection();
               pstmt = con.prepareStatement(sql);            
               rs = pstmt.executeQuery();
               
               while(rs.next()){
              
                  gongjiBoardDto dto = new gongjiBoardDto();
              
               dto.setGongji_no(rs.getInt("gongji_no"));
                 dto.setMember_name(rs.getString("member_name"));
               dto.setMember_no(rs.getInt("member_no"));
               dto.setGongji_subject(rs.getString("gongji_subject"));
               dto.setGongji_content(rs.getString("gongji_content"));
               dto.setGongji_count(rs.getInt("gongji_count"));
               dto.setGongji_regdate(rs.getString("gongji_regdate"));
               /*dto.setMember_no(rs.getInt("member_no"));*/
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
        public void insertBoard(gongjiBoardDto dto, String member_id){
           gongjiBoardDao dao = new gongjiBoardDao();
          int member_no = dao.getMemberNo(member_id);
           
           
           
           String sql = "INSERT INTO gongji_board(gongji_subject, gongji_content, gongji_count, gongji_regdate,member_no) VALUES (?, ?,  0, sysdate(),"+member_no+" )";
          
           
           try{
              con = dataSource.getConnection();
              pstmt = con.prepareStatement(sql);
              
           
              pstmt.setString(1, dto.getGongji_subject());
              pstmt.setString(2, dto.getGongji_content());
              
              
              pstmt.executeUpdate();
              
              
           }catch(Exception err){
              System.out.println("insertBoard()  : " + err);
           }
           finally{freeConnection();}
        }
        
        //Read.jsp , Update.jsp
       public gongjiBoardDto getBoard(int gongji_no, String page){
           String sql = "";
           gongjiBoardDto dto = new gongjiBoardDto();
           System.out.println("겟보드연결");
                 try{         
                    con = dataSource.getConnection();
                    
                    if(page.equals("gongjiboardRead")){
                       sql = "update gongji_board set gongji_count=gongji_count+1 where gongji_no=?";
                       pstmt = con.prepareStatement(sql);
                       pstmt.setInt(1,gongji_no);
                       pstmt.executeUpdate();
                    }
                    
                    sql = "select m.member_no,m.member_name,g.gongji_no,g.gongji_subject,"
                          + "g.gongji_content,g.gongji_count,g.gongji_regdate "
                          + "from gongji_board g inner join member m "
                          + "on g.member_no = m.member_no where gongji_no =?";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setInt(1,gongji_no);
                    rs = pstmt.executeQuery();
                  
                    
        
                    if(rs.next()){
                      dto.setMember_name(rs.getString("member_name")); 
                       dto.setGongji_content(rs.getString("gongji_content"));
                       dto.setGongji_count(rs.getInt("gongji_count"));                  
                       dto.setGongji_regdate(rs.getString("gongji_regdate"));                                           
                       dto.setGongji_subject(rs.getString("gongji_subject"));                    
                       dto.setGongji_no(rs.getInt("gongji_no"));
                       
                    //   list.add(dto);
                       
                    }
                    
                    
                 }catch(Exception err){
                    System.out.println("getBoard()  : " + err);
                 }
                 finally{freeConnection();}
                 return dto;
        }

     // Updateproc.jsp
        public void updateBoard(String gongji_subject, String gongji_content, int gongji_no){
           String sql = "update gongji_board set gongji_subject=?, gongji_content=? "
                 + "where gongji_no=?" ;
           
           System.out.println("updateBoard연결"
                 + "");
        try{
           con = dataSource.getConnection();
           pstmt = con.prepareStatement(sql);
           pstmt.setString(1, gongji_subject);
           //System.out.println(dto.getGongji_subject()+"subject");
           pstmt.setString(2, gongji_content);
           //System.out.println(dto.getGongji_content()+"content");
           pstmt.setInt(3, gongji_no);
           //System.out.println(dto.getGongji_no()+"gongji_no");
           
           pstmt.executeUpdate();
           
              
           }catch(Exception err){System.out.println("updateBoard() : " + err);}
           finally{ freeConnection();}
        }
       
        // delete
        public void deleteBoard(int gongji_no){
           String sql = "delete from gongji_board where gongji_no = ?";
           System.out.println("Daodeleteboard접속");
           try{
              con = dataSource.getConnection();
              pstmt = con.prepareStatement(sql);
              pstmt.setInt(1, gongji_no);
              pstmt.executeUpdate();
              
              
           }catch(Exception err){ System.out.println("gongjiBoard : " + err);}
           finally{ freeConnection();}
        }
}