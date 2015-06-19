<%@page import="model.freeBoardDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />

<script>
	function list() {
		document.list.submit();
	}

	function page_freeboardRead(cmd) {

		var f = document.freeRead;
		f.action = "admin";
		f.method = "post";
		f.cmd.value = cmd;
		f.submit();
		
	}
	
	function page_move(cmd){
  	  var f = document.free_Read_button;
  	  f.cmd.value = cmd;
  	  
  	  f.action = "admin";
  	  f.method="post";    	  
  	  f.submit();
  	 
    }
	
	function page_move_no(cmd,freeboard_no){
	  	  var f = document.free_Read_button;
	  	  f.cmd.value = cmd;
	  	  f.freeboard_no.value = freeboard_no;
	  	  f.action = "admin";
	  	  f.method="post";    	  
	  	  f.submit();	
		
	}
</script>
</head>

<body>

	<br />
	<br />
	<br />
	<jsp:useBean id="dao" class="model.freeBoardDao"></jsp:useBean>
	<%
			
	int freeboard_no = Integer.parseInt(request.getParameter("freeboard_no"));
		System.out.println(freeboard_no+"freeboard_no, read");
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");

		freeBoardDto dto = dao.getBoard(freeboard_no, "freeboardRead");
	%>
	<br>
	<br>
	
	<table align=center width=70% border=0 cellspacing=3 cellpadding=0 >
	<hr/>
		<tr><br/>
		
		</tr>
		<tr>
			<td colspan=2><%=dto.getFreeboard_no() %>번째글 //조회수 : <%=dto.getFreeboard_count()%>
				<table border=1 cellpadding=3 cellspacing=0 width=100% class="table table-striped">
					<tr>
						<td align=center bgcolor=#dddddd width=10%>이 름</td>
						<td bgcolor=#ffffe8><%=dto.getMember_name()%></td>
						<td align=center bgcolor=#dddddd width=10%>등록날짜</td>
						<td bgcolor=#ffffe8><%=dto.getFreeboard_regdate()%></td>
					</tr>
					<tr>
						<td align=center bgcolor=#dddddd>제 목</td>
						<td bgcolor=#ffffe8 colspan=3><%=dto.getFreeboard_subject()%></td>
					</tr> 
					<tr>
						<td colspan=4><%=dto.getFreeboard_content().replace("\n", "<br/>")%></td>
					</tr>
					<hr/>
					<%-- <tr>
						<td colspan =4>댓 글  <input type="textarea"  style="width:85%;" name="freeboard_reply"/>
						&nbsp;&nbsp;&nbsp;
						<input type="submit" class="btn" value="완료" onclick="page_move_no('FREEBOARDREPLY', <%= dto.getFreeboard_no() %>)"/> 
						</td>
					</tr> --%	>
					<%-- <tr>
						<td colspan=4 align=right>조회수 : <%=dto.getFreeboard_count()%>
						</td>
					</tr> --%>
				</table>
			</td>
		</tr>
	
		<tr>	
		
			<td align=center colspan=2>			
			<a href="javascript:page_move('FREEBOARDBACK')" >
			<input type="button" value="목록" class="btn"/></a>					
			<%-- <input type="submit" value ="답변" class="btn" onclick="page_move_no('FREEBOARDREPLY', <%= dto.getFreeboard_no() %>)"/> --%>
			<input type="submit" value ="수정" class="btn" onclick="page_move_no('FREEBOARDUPDATE', <%= dto.getFreeboard_no() %>)"/>
			<input type="submit" value ="삭제" class="btn" onclick="page_move_no('FREEBOARDDELETE', <%= dto.getFreeboard_no() %>)"/>
			
			
			<!-- <a href="javascript:page_move('FREEBOARDREPLY')" >
			<input type="submit" value ="답변" class="btn" onclick="page_move()"/></a>
			
			<a href="javascript:page_move('FREEBOARDDELETE')" >
			<input type="submit" value ="삭제" class="btn" onclick="page_move()"/></a> -->
			</td>
			
		</tr> 
		
	</table>
	
	<form name="free_Read_button">
	<input type="hidden" name="freeboard_no"/>
	<input type="hidden" name="cmd"/>
	</form>
	
	<form name="freeBoardList" method="post" action="freeBoardList.jsp">
		<input type="hidden" name="keyField" value="<%=keyField%>" /> <input
			type="hidden" name="keyWord" value="<%=keyWord%>" />
	</form>
</body>
</html>