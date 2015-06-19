<%@page import="java.util.Vector"%>
<%@page import="model.freeBoardDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />

<script>
	function page_freeboardDelete(cmd) {

		var f = document.postdelete;
		f.action = "admin";
		f.method = "post";
		f.submit();
		f.cmd.value = cmd;
	}
	
	function page_move_nooo(cmd,freeboard_no){
	  	  var f = document.fdelete;
	  	  
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
	<jsp:useBean id="dao" class="model.freeBoardDao" />
	<%
		request.setCharacterEncoding("euc-kr");
	%>

	<%
		int freeboard_no = Integer.parseInt(request.getParameter("freeboard_no"));
		System.out.println(freeboard_no);

		freeBoardDto dto = dao.getBoard(freeboard_no, "delete");
	%> 
	<center>
		<br>
		<br>
		<table width=70% cellspacing=0 cellpadding=2 class="table table-striped">
			<form name="fdelete" method=post action="freeboardDelete.jsp">
			<input type="hidden" name= "cmd">
			<input type="hidden" name="freeboard_no" value="<%=freeboard_no %>" />
				<tr>
					<td align=center>
						<table align=center border=0 width=91%>
							<tr>
								<td align=center><img src="img/07.jpg"></td>
								<h1>정말 삭제해요 ???</h1>
							</tr>
							<tr>
								<td><hr size=1 color=#eeeeee></td>
							</tr>
							<tr>
								<td align=center>
								<!-- <input type=button value="삭제요" onClick="check()" class="btn">  -->
								<input type="submit" value ="삭제요" class="btn" onclick="page_move_nooo('FREEBOARDDELETEPROC', <%= dto.getFreeboard_no() %>)"/>								
								<input type=button value="아니요" onClick="history.back()" class ="btn">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</form>
		</table>
	</center>
</body>
</html>