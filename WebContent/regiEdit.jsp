<%@ page contentType="text/html; charset=EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<% response.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>

<html>
<head>
<title>회원수정</title>

<script>

   function RegiEditChk(){
	   
	   var RegPass = document.getElementById("member_edit_pass").value;
	   var RegPassChk = document.getElementById("member_edit_passChk").value;	   
	   	var RegName = document.getElementById("member_edit_name").value;	  
	   	var RegPhone = document.getElementById("member_edit_phone").value;
	   	var RegEmail = document.getElementById("member_edit_email").value;
	 	
	 	
	   	
		if(RegPass.length < 4){
		   document.regiEdit.member_edit_pass.value = "";
		   document.regiEdit.member_edit_passChk.value = "";
	       document.regiEdit.member_edit_pass.placeholder = "비밀번호를 4자리 이상 입력해주세요."; 
        }
		if(RegPass != RegPassChk){
			   document.regiEdit.member_edit_pass.value = "";
			   document.regiEdit.member_edit_passChk.value = "";
		       document.regiEdit.member_edit_pass.placeholder = "비밀번호 확인이 일치하지 않습니다."; 
	        }
		if( RegName == ""){

	         document.regiEdit.member_edit_name.placeholder = "이름을 입력해 주세요.";
	      }
		if( RegPhone == ""){

	         document.regiEdit.member_edit_phone.placeholder = "전화번호를 입력해 주세요.";
	      }
		if( RegEmail == ""){

	         document.regiEdit.member_edit_email.placeholder = "이메일을 입력해 주세요.";
	      }
	   
       if(! (RegPass.length < 4|| RegPass != RegPassChk|| RegName == ""||RegPhone == ""||RegEmail == "")){
    	   
      document.regiEdit.submit();
       }
       }   

</script>
</head>
<body >
<jsp:useBean id="dao" class="model.memberDao"></jsp:useBean>
<jsp:useBean id="dto" class="model.memberDto"></jsp:useBean>
<%  
dto = dao.getRegister(dto.getMember_id());
%>



 
<div class="container" style="width: 250px; height: 100px;">
<div class="row" style="width: 250px; height: 100px;">
   
   <div class="span3" style="width: 250px; height: 50px;">      <!--  span12개 940 px -->
<!--    <h3 align="center">회원가입</h3> -->
      <div align="center" style="width: 250px; height: 50px;">
      <form method="post" action="project" name="regiEdit" >
      <input type="hidden" name="cmd" value="REGISTEREDIT"/>
   
     <br/>
        <input type="text" placeholder="이름" name="member_edit_name" id="member_edit_name" value="<%= dto.getMember_name()%>"/><br/>
      <input type="password" placeholder="password" name="member_edit_pass" id="member_edit_pass" value="<%= dto.getMember_pass()%>"/><br/>
      <input type="password" placeholder="password확인" id="member_edit_passChk" value="<%= dto.getMember_pass()%>"/><br/>
   
      
      <input type="text" placeholder="연락처" name="member_edit_phone" id="member_edit_phone" value="<%= dto.getMember_phone()%>"/><br/>
      <input type="email" placeholder="email" name="member_edit_email" id="member_edit_email" value="<%= dto.getMember_email()%>"/><br/>
            
      <input type="radio" name="member_edit_gender" id="man" value="남자" checked>남자
       <input type="radio" name="member_edit_gender" id="woman" value="여자">여자<br/><br/>
       <button class="btn" type="button" style="width:230px; margin-bottom: 10px" onclick="RegiEditChk()">
          <i class="icon-ok"></i>  수 정 하 기</button><br/>

         <button class="btn" type="button" style="width:230px" onclick="goback()">
               <i class="icon-circle-arrow-left"></i>메인으로</button>
      </form>   
      </div>
   </div>
   </div>
   </div>

</body>
</html>