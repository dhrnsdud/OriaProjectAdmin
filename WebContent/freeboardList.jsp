<%@page import="java.util.Vector"%>
<%@page import="model.freeBoardDto"%>
<%@page import="model.memberDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />

<script>
   function check(){
      if(document.search.keyWord.value == ""){
         alert("검색어를 입력하세요.");
         document.search.keyWord.focus();
         return;
      }
      document.search.submit();
   }
   function read(num){
      document.read.num.value = num;
      document.read.submit();
      
   }
   

   function page_freeboardPost(cmd){
   
      var f = document.freePost;
      f.action = "admin";
      f.method="post";         
      f.submit();
      f.cmd.value = cmd;
   }
   
   function page_freeboardBack(cmd){
      var f = document.freePost;
      f.action = "admin";
      f.method="post";         
      f.submit();
      f.cmd.value = cmd;      
      
   }
   function page_freeboardSearch(cmd){
      var f = document.freeboardsearch;
      f.action ="admin";
      f.method="post";         
       f.submit();
       f.cmd.value = cmd;
   }

   function page_move(cmd){
	 	  
	 	  var f = document.move;
	 	  f.cmd.value = cmd;
	 	  f.action = "admin";
	 	  f.method="post";    	  
	 	  f.submit();
	 	 
	   }
</script>
<body>
<div class="navbar-wrapper">
        <div class="navbar" >
          <div class="navbar-inner">
            <a class="brand" href="javascript:page_move('MAIN')">오리아</a>
            <div class="nav-collapse collapse">
         </div>
          </div>
      </div> <!-- /.container -->
	</div>

	<form name="move">
		<input type="hidden" name="cmd"/>
	</form>
   <br />
   <br />
   <br />

   <jsp:useBean id="dao" class="model.freeBoardDao" />
   <%!
      int totalRecord = 0;      // 전체 글의 갯수
      int numPerPage = 7;      // 한 page당 보여질 글의 갯수
      int pagePerBlock = 3;   // 한 block당 페이지 수
      int totalPage;               // 전체 페이지 수
      int totalBlock;            // 전체 블럭 수
      int nowPage;               // 현재 페이지 번호
      int nowBlock;               // 현재 블럭 번호      (한번에 여러페이지를 이동하는 액션이 있을때 사용)
      int beginPerPage;         // 페이지당 시작 번호
   
      //페이징에 필요한 변수들

%>
   <center>
      <br>
      <h2>자유 게시판</h2>
      <% 

String keyField = request.getParameter("keyField");
String keyWord = request.getParameter("keyWord");
   
   Vector list = dao.getBoardList(keyField, keyWord);

   totalRecord = list.size();

   totalPage = (int)(Math.ceil((double)totalRecord  / numPerPage)); 

   if(request.getParameter("nowPage") != null){
   nowPage = Integer.parseInt(request.getParameter("nowPage"));
   }
   
   if(request.getParameter("nowBlock") != null){
   nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
   }
   
   beginPerPage = nowPage * numPerPage; 
   //페이지당 시작 번호 =현재 페이지 번호 *한 page당 보여질 글의 갯수
   
   totalBlock = (int)Math.ceil(((double)totalPage/pagePerBlock));
   //전체 블럭 수 = 전체 페이지 수/한 block당 페이지 수
%>


      <table align=center border=0 width=80%>
         <tr>
            <td align=left>Total : <%=totalRecord%> Articles( <font
               color=red> <%=nowPage+1 %> / <%=totalPage%> Pages
            </font>)
            </td>
            <td align=right>
               <form  action="admin" name="freePost" method="post">
            <input type="hidden" name="cmd" value="FREEBOARDPOST" /> <input
               type="submit" class="btn" value="글쓰기" />
            </form>
            </td>
         </tr>
      </table>

      <table width=80% border=0 cellspacing=0 cellpadding=3
         class="table table-striped">
         <!-- class="table table-striped" -->
         <tr>
            <td align=center colspan=2>
               <table border=0 width=100% cellpadding=2 cellspacing=0>
                  <tr>



                     <td>번호</td>
                     <td>제목</td>
                     <td>이름</td>
                     <td>날짜</td>
                     <td>조회수</td>

                  </tr>
                  <%
  
   request.setCharacterEncoding("euc-kr");

   if(keyField == null){
      keyField ="member_name";
      keyWord="";
   }
   
   
   if(list.size() == 0){ %>
                  <b>등록된 글이 없습니다.</b>
                  <%
   }
   else{
   for(int i=beginPerPage; i< beginPerPage + numPerPage; i++){
            if(i == totalRecord){ break;}
         freeBoardDto dto = (freeBoardDto)list.get(i); 
         
        %>

                  <tr>
                     <td align="center"><%= dto.getFreeboard_no() %></td>
                     <form action="admin" method="post" name="freeRead">
                        <td align="center"><a
                           href="admin?cmd=FREEBOARDREAD&freeboard_no=<%=dto.getFreeboard_no()%>">
                              <%= dto.getFreeboard_subject() %></a></td>
                     </form>
                     <td align="center"><%= dto.getMember_name()%></td>
                     <td align="center"><%= dto.getFreeboard_regdate() %></td>
                     <td align="center"><%= dto.getFreeboard_count() %></td>

                  </tr>
                  <% }}   %>

               </table>


            </td>

         </tr>

         <tr>
            <td><BR></td>
         </tr>

         <tr>

            <td align=right colspan="7">
               <div class="pagination pagination-centered pagination-large">
                  <ul>
                     <%if(0 < nowBlock){ %>
                     <li><a
                        href="freeboardList.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=(nowBlock-1) * pagePerBlock%>">이전</a></li>
                     <%} %>
                     <% 
               for(int i=0; i<pagePerBlock; i++){   
                  if(((nowBlock * pagePerBlock) + i) == totalPage)
                     {break;}
                  %>
                     <li><a
                        href="freeboardList.jsp?nowPage=<%=(nowBlock * pagePerBlock)+i %>&nowBlock=<%=nowBlock%>"><%=i+1+(nowBlock * pagePerBlock) %></a></li>
                     <%} %>
                     <%if(totalBlock > nowBlock+1){ %>
                     <li><a
                        href="freeboardList.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=(nowBlock+1) * pagePerBlock%>">다음</a></li>
                     <%} %>
                  </ul>
               </div>
            </td>
         </tr>

         <tr>

            </form>
         </tr>
      </table>


      <form action="admin" name="freeboardsearch" method="post">
      <input type="hidden" name="cmd" value="FREEBOARDSEARCH">
         <table border=0 width=527 align=center cellpadding=4 cellspacing=0>
            <tr>
               <td align=center valign=bottom><select name="keyField"
                  size="1">
                     <option value="member_name" <%if(keyField.equals("member_name")){ %>
                        selected="selected" <%} %>>이름</option>
                     <option value="freeboard_subject" <%if(keyField.equals("freeboard_subject")){ %>
                        selected="selected" <%} %>>제목</option>
                  
               </select> <input type="text" size="20" name="keyWord"> &nbsp; 
               <input type="submit" value="찾기" onClick="check()" class="btn"> 
               <input type="hidden" name="page" value="0">
               <input type="hidden" name="gongjiboard_no" /> 
               <input type="hidden" name="keyField" value="<%=keyField %>" /> 
               <input type="hidden" name="keyWord" value="<%=keyWord %>" />   
                  </td>
            </tr>
         </table>
      </form>

   <%--    <form method="post" name="freeboardRead" action="">
         <input type="hidden" name="freeboard_no" /> <input type="hidden"
            name="keyField" value="<%=keyField %>" /> <input type="hidden"
            name="keyWord" value="<%=keyWord %>" />
      </form> --%>
   </center>
</body>
</html>