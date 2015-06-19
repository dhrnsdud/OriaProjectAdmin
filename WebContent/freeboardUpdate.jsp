<%@page import="java.util.Vector"%>
<%@page import="model.freeBoardDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />

<script>
	function page_freeboardUpdate(cmd) {

		var f = document.postupdate;
		f.action = "admin";
		f.method = "post";
		f.submit();
		f.cmd.value = cmd;
	}
	
	function page_move_noo(cmd,freeboard_no){
	  	  var f = document.avacsd;
	  	  f.freeboard_subject.value = document.getElementById("subject").value;
	  	  f.freeboard_content.value = document.getElementById("content").value;
	  	  f.cmd.value = cmd;
	  	  f.freeboard_no.value = freeboard_no;

	  	  f.action = "admin";
	  	  f.method="post";    	  
	  	  f.submit();	
		
	}
</script>
<body>

	<br />
	<br />
	<br />
	<%
		request.setCharacterEncoding("euc-kr");
	%>
	<jsp:useBean id="dao" class="model.freeBoardDao" />

	<%
		int freeboard_no = Integer.parseInt(request.getParameter("freeboard_no"));
		System.out.println(freeboard_no+"freeboard");
		
		
		freeBoardDto dto = dao.getBoard(freeboard_no, "update");
	%>
	<center>
		<br> <br>
		<h4>수정하기</h4>
		<table align=center width=70% border=0 cellspacing=3 cellpadding=0>
			<hr />
			<tr>
				<br />

			</tr>
			<form method="post" action="admin" name="avacsd">
			<input type="hidden" name="cmd"/>
			<input type="hidden" name="freeboard_no"/>
			<input type="hidden" name="freeboard_subject"/>
			<input type="hidden" name="freeboard_content"/>
			<tr>
				<td colspan=2>조회수 : <%=dto.getFreeboard_count()%>
					<table border=1 cellpadding=3 cellspacing=0 width=100%
						class="table table-striped">
						<tr>
							<td align=center bgcolor=#dddddd width=10%>이 름</td>
							<td bgcolor=#ffffe8><%=dto.getMember_name()%></td>
							<td align=center bgcolor=#dddddd width=10%>등록날짜</td>
							<td bgcolor=#ffffe8><%=dto.getFreeboard_regdate()%></td>
						</tr>
						<tr>
							<td align=center bgcolor=#dddddd>제 목</td>
							<td bgcolor=#ffffe8 colspan=3>
							<input type=text name=subject id="subject"
								size=50 maxlength=500 value="<%=dto.getFreeboard_subject()%>">
							</td>
						</tr>
						<tr>
							<td colspan=4>
							<textarea style="width: 98%;" name=content id="content"	rows=10 cols=50>
								<%=dto.getFreeboard_content()%></textarea></td>
						</tr>

					</table>
				</td>
			</tr>
			</form>
			<tr>
				
			</tr>
		</table>
				<td colspan=4>
				
				<input type="submit" value ="수정완료" class="btn" onclick="page_move_noo('FREEBORADUPDATEPROC', <%= dto.getFreeboard_no() %>)"/>				
				<input type=reset value="다시수정" class="btn"> 
				<input type=button value="뒤로" class="btn" onClick="history.back()"></td>
	</center>
</body>
</html>