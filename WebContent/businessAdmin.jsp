<%@page import="model.businessDto"%>
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




    <!-- Plugin CSS -->


    <!-- Custom CSS -->


<script>

function BusiDelete(Business_no, cmd){
	var busiEdit = document.getElementById("busiEdit" + Business_no);
	busiEdit.cmd.value = cmd;
	busiEdit.submit();

}

   function BusiEdit(Business_no, cmd){
	   var busiEdit = document.getElementById("busiEdit" + Business_no);
		busiEdit.cmd.value = cmd;

		
      busiEdit.submit();
       
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
   <jsp:useBean id="dao" class="model.businessDao" />
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
      <h2 align="center">��ü ����</h2>
      <% 

   Vector business_list = dao.getBusinessList();

   totalRecord = business_list.size();

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
                     <td>����</td>
                     <td>�ּ�</td>
                     <td>����ó</td>
					 <td>����</td>
					<td>��ü ����</td>
                  </tr>
                  <%
  
   request.setCharacterEncoding("euc-kr");

   if(business_list.size() == 0){ %>
                  <b>��ϵ� ���� �����ϴ�.</b>
                  <%
   }
   else{
   for(int i=beginPerPage; i< beginPerPage + numPerPage; i++){
            if(i == totalRecord){ break;}
         businessDto dto = (businessDto)business_list.get(i); 
         
        %>

                  <tr>
                     <td align="center"><%= dto.getBusiness_no() %></td>
                     <td align="center"><%= dto.getBusiness_name()%></td>
                     <td align="center"><%= dto.getBusiness_content() %></td>
					<td align="center"><%= dto.getBusiness_addr() %></td>
					<td align="center"><%= dto.getBusiness_phone() %></td>
					<td align="center"><%= dto.getBusiness_tof() %></td>
					<td><a href="#theModalBusiEdit<%= dto.getBusiness_no() %>" data-toggle="modal" id=dto.getMember_no()>  ��������</a></td>
                  </tr>
  
   <div class="modal hide fade" id="theModalBusiEdit<%= dto.getBusiness_no() %>" style="width:350px ; height: 450px;">
   <div class="modal-header">
  <h3 align="center">��������</h3>
   </div>
      <div class="modal-body" style="height: 500px;">
     	<!--  -->
    	    <%@ page contentType="text/html; charset=EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<% response.setCharacterEncoding("euc-kr"); %>

<%  
dto = dao.getBusiness(dto.getBusiness_no());
%>
<div class="container" style="width: 250px; height: 100px;">
<div class="row" style="width: 250px; height: 100px;">
   
   <div class="span3" style="width: 250px; height: 50px;">      <!--  span12�� 940 px -->
<!--    <h3 align="center">ȸ������</h3> -->
      <div align="center" style="width: 250px; height: 50px;">
      <form method="post" action="admin" name="busiEdit<%= dto.getBusiness_no()%>" id="busiEdit<%= dto.getBusiness_no()%>">
      <input type="hidden" name="cmd"/>
      <input type="hidden" name="business_no" value="<%= dto.getBusiness_no()%>"/>
      

     <br/>
        <input type="text" placeholder="�̸�" name="business_edit_name" id="business_edit_name<%= dto.getBusiness_no()%>" value="<%= dto.getBusiness_name()%>"/><br/>
      <textarea style="width: 210px; height: 80px"   placeholder="����" name="business_edit_content" id="business_edit_content<%= dto.getBusiness_no()%>" ><%= dto.getBusiness_content()%></textarea><br/>
      <input type="text" placeholder="�ּ�" name="business_edit_addr" id="business_edit_addr<%= dto.getBusiness_no()%>" value="<%= dto.getBusiness_addr()%>"/><br/>
   
      
      <input type="text" placeholder="����ó" name="business_edit_phone" id="business_edit_phone<%= dto.getBusiness_no()%>" value="<%= dto.getBusiness_phone()%>"/><br/>
      <input type="text" placeholder="type" name="business_edit_tof" id="business_edit_tof<%= dto.getBusiness_no()%>" value="<%= dto.getBusiness_tof()%>"/><br/>
     
       <button class="btn" type="button" style="width:230px; margin-bottom: 10px" onclick="BusiEdit(<%= dto.getBusiness_no()%>, 'BUSINESSEDIT')">
          <i class="icon-ok"></i>  �� �� �� ��</button><br/>

         <button class="btn" type="button" style="width:230px" onclick="BusiDelete(<%= dto.getBusiness_no()%>,'BUSINESSDELETE')">
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
                        href="businessAdmin.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=(nowBlock-1) * pagePerBlock%>">����</a></li>
                     <%} %>
                     <% 
               for(int i=0; i<pagePerBlock; i++){   
                  if(((nowBlock * pagePerBlock) + i) == totalPage)
                     {break;}
                  %>
                     <li><a
                        href="businessAdmin.jsp?nowPage=<%=(nowBlock * pagePerBlock)+i %>&nowBlock=<%=nowBlock%>"><%=i+1+(nowBlock * pagePerBlock) %></a></li>
                     <%} %>
                     <%if(totalBlock > nowBlock+1){ %>
                     <li><a
                        href="businessAdmin.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=(nowBlock+1) * pagePerBlock%>">����</a></li>
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