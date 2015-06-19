<%@page import="java.util.Vector"%>
<%@page import="model.freeBoardDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />

<script>  

   function page_freeboardReply(cmd){
	
 	  var f = document.postreply;
 	  f.action = "admin";
 	  f.method="post";    	  
 	  f.submit();
 	  f.cmd.value = cmd;
   }
  
</script>
<body>

	<br />
	<br />
<h1>reply</h1>
</body>
</html>