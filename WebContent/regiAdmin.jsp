<%@page import="java.util.Vector"%>
<%@page import="model.memberDao"%>
<%@page import="model.memberDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<link href="style.css" rel="stylesheet" type="text/css">


<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">

<script src="bootstrap/js/jquery-2.1.4.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script>
//    function read(num){
//       document.read.num.value = num;
//       document.read.submit();
      
//    }

//    function page_freeboardSearch(cmd){
//       var f = document.freeboardsearch;
//       f.action ="project";
//       f.method="post";         
//        f.submit();
//        f.cmd.value = cmd;
//    }

</script>
<script>

function RegiDelete(Member_no, cmd){

	var regiEdit = document.getElementById("regiEdit" + Member_no);
	regiEdit.cmd.value = cmd;
	regiEdit.submit();

}

   function RegiEditChk(Member_no, cmd){
	   var regiEdit = document.getElementById("regiEdit" + Member_no);
	   var RegPass = document.getElementById("member_edit_pass" + Member_no).value;
	   var RegPassChk = document.getElementById("member_edit_passChk" + Member_no).value;	   
	   	var RegName = document.getElementById("member_edit_name" + Member_no).value;	  
	   	var RegPhone = document.getElementById("member_edit_phone" + Member_no).value;
	   	var RegEmail = document.getElementById("member_edit_email" + Member_no).value;
		regiEdit.cmd.value = cmd;

		if((document.getElementById("member_edit_pass" + Member_no).value).length < 4){
			document.getElementById("member_edit_pass" + Member_no).value = "";

			document.getElementById("member_edit_passChk" + Member_no).value = "";
			document.getElementById("member_edit_pass" + Member_no).placeholder = "��й�ȣ�� 4�ڸ� �̻� �Է����ּ���."; 
	
		}
		if(document.getElementById("member_edit_pass" + Member_no).value != document.getElementById("member_edit_passChk" + Member_no).value){
			document.getElementById("member_edit_pass" + Member_no).value = "";
			document.getElementById("member_edit_passChk" + Member_no).value = "";
			document.getElementById("member_edit_passChk" + Member_no).placeholder = "��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�."; 
	        }
		if( document.getElementById("member_edit_name" + Member_no).value == ""){

			document.getElementById("member_edit_name" + Member_no).placeholder = "�̸��� �Է��� �ּ���.";
	      }
		if( document.getElementById("member_edit_phone" + Member_no).value == ""){

			document.getElementById("member_edit_phone" + Member_no).placeholder = "��ȭ��ȣ�� �Է��� �ּ���.";
	      }
		if( document.getElementById("member_edit_email" + Member_no).value == ""){

			document.getElementById("member_edit_email" + Member_no).placeholder = "�̸����� �Է��� �ּ���.";
	   
		}
	   
       if(! (RegPass.length < 4|| RegPass != RegPassChk|| RegName == ""||RegPhone == ""||RegEmail == "")){

      regiEdit.submit();
       }
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
            <a class="brand" href="javascript:page_move('MAIN')">������</a>
            <div class="nav-collapse collapse">
         </div>
          </div>
      </div> <!-- /.container -->
	</div>

	<form name="move">
		<input type="hidden" name="cmd"/>
	</form>

<br/><br/><br/><br/><br/><br/>
   <jsp:useBean id="dao" class="model.memberDao" />
   <%!
      int totalRecord = 0;      // ��ü ���� ����
      int numPerPage = 7;      // �� page�� ������ ���� ����
      int pagePerBlock = 3;   // �� block�� ������ ��
      int totalPage;               // ��ü ������ ��
      int totalBlock;            // ��ü �� ��
      int nowPage;               // ���� ������ ��ȣ
      int nowBlock;               // ���� �� ��ȣ      (�ѹ��� ������������ �̵��ϴ� �׼��� ������ ���)
      int beginPerPage;         // �������� ���� ��ȣ
   
      //����¡�� �ʿ��� ������

%>
 
      <br>
      <h2 align="center">ȸ�� ����</h2>
      <% 

   Vector member_list = dao.getMemberList();

   totalRecord = member_list.size();

   totalPage = (int)(Math.ceil((double)totalRecord  / numPerPage)); 

   if(request.getParameter("nowPage") != null){
   nowPage = Integer.parseInt(request.getParameter("nowPage"));
   }
   
   if(request.getParameter("nowBlock") != null){
   nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
   }
   
   beginPerPage = nowPage * numPerPage; 
   //�������� ���� ��ȣ =���� ������ ��ȣ *�� page�� ������ ���� ����
   
   totalBlock = (int)Math.ceil(((double)totalPage/pagePerBlock));
   //��ü �� �� = ��ü ������ ��/�� block�� ������ ��
%>


      <table align=center border=0 width=80%>
         <tr>
            <td align=left>Total : <%=totalRecord%> Articles( <font
               color=red> <%=nowPage+1 %> / <%=totalPage%> Pages
            </font>)
            </td>
            <td align=right>

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



                     <td>��ȣ</td>
                     <td>�̸�</td>
                     <td>���̵�</td>
                     <td>����</td>
                     <td>����ó</td>
					 <td>�̸���</td>
					 <td>������</td>
					 <td>ȸ�����</td>
					 <td>ȸ�� ����</td>
                  </tr>
                  <%
  
   request.setCharacterEncoding("euc-kr");

   if(member_list.size() == 0){ %>
                  <b>��ϵ� ���� �����ϴ�.</b>
                  <%
   }
   else{
   for(int i=beginPerPage; i< beginPerPage + numPerPage; i++){
            if(i == totalRecord){ break;}
         memberDto dto = (memberDto)member_list.get(i); 
         
        %>

                  <tr>
                     <td align="center"><%= dto.getMember_no() %></td>
                     <td align="center"><%= dto.getMember_name()%></td>
                     <td align="center"><%= dto.getMember_id() %></td>
                     <td align="center"><%= dto.getMember_gender() %></td>
					<td align="center"><%= dto.getMember_phone() %></td>
					<td align="center"><%= dto.getMember_email() %></td>
					<td align="center"><%= dto.getMember_date() %></td>
					<td align="center"><%= dto.getMember_grade()%></td>
					<td><a href="#theModalRegiEdit<%= dto.getMember_id() %>" data-toggle="modal" id=dto.getMember_no()>  ��������</a></td>
                  </tr>
  
   <div class="modal hide fade" id="theModalRegiEdit<%= dto.getMember_id() %>" style="width:350px ; height: 450px;">
   <div class="modal-header">
  <h3 align="center">��������</h3>
   </div>
      <div class="modal-body" style="height: 500px;">
     	<!--  -->
    	    <%@ page contentType="text/html; charset=EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<% response.setCharacterEncoding("euc-kr"); %>

<%  
dto = dao.getRegister(dto.getMember_id());
%>
<div class="container" style="width: 250px; height: 100px;">
<div class="row" style="width: 250px; height: 100px;">
   
   <div class="span3" style="width: 250px; height: 50px;">      <!--  span12�� 940 px -->
<!--    <h3 align="center">ȸ������</h3> -->
      <div align="center" style="width: 250px; height: 50px;">
      <form method="post" action="admin" name="regiEdit<%= dto.getMember_no()%>" id="regiEdit<%= dto.getMember_no()%>">
      <input type="hidden" name="cmd"/>
      <input type="hidden" name="member_no" value="<%= dto.getMember_no()%>"/>


        <input type="text" placeholder="�̸�" name="member_edit_name" id="member_edit_name<%= dto.getMember_no()%>" value="<%= dto.getMember_name()%>"/><br/>
      <input type="password" placeholder="password" name="member_edit_pass" id="member_edit_pass<%= dto.getMember_no()%>" value="<%= dto.getMember_pass()%>"/><br/>
      <input type="password" placeholder="passwordȮ��" id="member_edit_passChk<%= dto.getMember_no()%>" value="<%= dto.getMember_pass()%>"/><br/>
   
      
      <input type="text" placeholder="����ó" name="member_edit_phone" id="member_edit_phone<%= dto.getMember_no()%>" value="<%= dto.getMember_phone()%>"/><br/>
      <input type="email" placeholder="email" name="member_edit_email" id="member_edit_email<%= dto.getMember_no()%>" value="<%= dto.getMember_email()%>"/><br/>
      <input type="text" placeholder="���" name="member_edit_grade" id="member_edit_grade<%= dto.getMember_no()%>" value="<%= dto.getMember_grade()%>"/><br/>
            
      <input type="radio" name="member_edit_gender" id="man<%= dto.getMember_no()%>" value="����" checked>����
       <input type="radio" name="member_edit_gender" id="woman<%= dto.getMember_no()%>" value="����">����<br/><br/>
       <button class="btn" type="button" style="width:230px; margin-bottom: 10px" onclick="RegiEditChk(<%= dto.getMember_no()%>, 'REGISTEREDIT')">
          <i class="icon-ok"></i>  �� �� �� ��</button><br/>

         <button class="btn" type="button" style="width:230px" onclick="RegiDelete(<%= dto.getMember_no()%>,'REGISTERDELETE')">
               <i class="icon-circle-arrow-left"></i>�� �� �� ��</button>
      </form>   
      </div>
   </div>
   </div>
   </div>



    	    
    	    
    	    
    	    
    	    
<%--     	    <jsp:include page="regiEdit.jsp"> --%>
<%--     	    <jsp:param value="" name=""/> --%>
<%--         </jsp:include> --%>
		<!--  -->
      </div>
      
   </div>
                  
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
                        href="freeboardList.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=(nowBlock-1) * pagePerBlock%>">����</a></li>
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
                        href="freeboardList.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=(nowBlock+1) * pagePerBlock%>">����</a></li>
                     <%} %>
                  </ul>
               </div>
            </td>
         </tr>

         <tr>

     
         </tr>
      </table>




   <%--    <form method="post" name="freeboardRead" action="">
         <input type="hidden" name="freeboard_no" /> <input type="hidden"
            name="keyField" value="<%=keyField %>" /> <input type="hidden"
            name="keyWord" value="<%=keyWord %>" />
      </form> --%>
      
      <!--  ȸ������ ���� modal -->

</body>
</html>