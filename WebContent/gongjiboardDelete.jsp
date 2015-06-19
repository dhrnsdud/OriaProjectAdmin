<%@page import="java.util.Vector"%>
<%@page import="model.gongjiBoardDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />

<script>
	function page_gongjiboardDelete(cmd) {

		var f = document.gongjidelete;
		f.action = "admin";
		f.method = "post";
		f.submit();
		f.cmd.value = cmd;
	}
	
	function page_move_delok(cmd,gongjiboard_no){
	  	  var f = document.gdelete;
	  	  
	  	  f.cmd.value = cmd;
	  	  f.gongji_no.value = gongjiboard_no;

	  	  f.action = "admin";
	  	  f.method="post";    	  
	  	  f.submit();	
		
	}
</script>
<body>

	<br />
	<br />
	<br />
	<jsp:useBean id="dao" class="model.gongjiBoardDao" />
	<%
		request.setCharacterEncoding("euc-kr");
	%>

	<%
		int gongji_no = Integer.parseInt(request.getParameter("gongji_no"));
		System.out.println(gongji_no+"번호");

		gongjiBoardDto dto = dao.getBoard(gongji_no, "delete");
	%> 
	<center>
		<br>
		<br>
		<table width=70% cellspacing=0 cellpadding=2 class="table table-striped">
			<form name="gdelete" method=post action="freeboardDelete.jsp">
			<input type="hidden" name= "cmd">
			<input type="hidden" name="gongji_no" value="<%=gongji_no %>" />
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
								<input type="submit" value ="삭제요" class="btn" onclick="page_move_delok('GONGJIBOARDDELETEPROC', <%= dto.getGongji_no() %>)"/>								
								<input type=button value="아니요" onClick="history.back()" class="btn">
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