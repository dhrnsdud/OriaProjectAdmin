<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
a

 {

  font-size:25pt;

  color:black;

  text-decoration: none;

  /* text-indent:30px; a태그 속성X */

  

  font-family: 휴먼옛체, 굴림체, 고딕체;

 }

 

 /* 가상클래스 */

 a:hover

 {

  color:red;

  text-decoration: underline; /* overline; */

  text-transform: capitalize;

 }

 

 #link

 {

   background-color:#008200;

   padding: 20px 4px;  /* display:table-cell 과 vertical-align을 하던지 아니면 padding으로 상하값주던지 해서 가운데정렬시킴. */

   text-align:center;

   text-decoration:none;

   font-wieght:bold;

   font-size:12pt;

   /* 기억 */

   display: block;

   width:300px;

 }

 

 #link :hover

 {

   color:red;

   background-color:white;

   border:solid 1px #98BF21;

   border-bottom:none;

 }

 

 a div
 {
  color:white;
 }
</style>

</head>
<body>

<a href="img/01.jpg" target="_blank" style="text-decoration:none" >a</a>
</body>
</html>