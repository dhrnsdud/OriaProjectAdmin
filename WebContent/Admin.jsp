<%@page import="model.memberDao"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Creative - Start Bootstrap Theme</title>

    <!-- Bootstrap Core CSS -->

    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<!-- 	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/> -->

    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" type="text/css">

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="css/animate.min.css" type="text/css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/creative.css" type="text/css">
    
<script>
window.onload = function(){
	  <%if(request.getAttribute("loginFail") != null && ((String)request.getAttribute("loginFail")).equals("notAdmin")){ %>
	  alert("관리자 계정이 아닙니다.");
	  <%}%>
	  <%if(request.getAttribute("loginFail") != null &&  ((String)request.getAttribute("loginFail")).equals("loginFail")){ %>
	  alert("아이디 혹은 비밀번호가 틀립니다.");
	
	  <%}%>
	  <%if(request.getAttribute("accessReject") != null &&  ((String)request.getAttribute("accessReject")).equals("accessReject")){ %>
	  alert("로그인 후 이용하세요.");
	
	  <%}%>


}


function page_move(cmd){
	  var f = document.move;
	  f.cmd.value = cmd;
	  
	  f.action = "admin";
	  f.method="post";    	  
	  f.submit();
	 
}


</script>
</head>
<body id="page-top">

    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">오리아</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="page-scroll" href="#page-top">처음으로</a>
                    </li>
                  <!-- <li>
                        <a class="page-scroll" href="#services">Services</a>
                    </li> -->  
                    <li>
                        <a class="page-scroll" href="#services">관리하기</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#contact">문의하기</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <header>
        <div class="header-content">
            
            <% if(session.getAttribute("member_id") == null){%>

            <div class="header-content-inner">
             <form name=login action="admin" method="post">
                <h1>관리자 페이지</h1>
                <hr>
                
         <div>       
         
         <font color="black" face="굴림체" size="5"><input type="text" placeholder="id" name="member_id"/></font><br />
         <font color="black" face="굴림체" size="5"><input type="password" placeholder="password" name="member_pass" /></font><br />
		 <input type="hidden" name="cmd" value="LOGIN" />	
   		
      
         </div>
                
                
                <p>로그인 후 관리하세요!</p>
 
            	<input type="submit" class="btn btn-primary btn-xl page-scroll" value="관리자 로그인">
              	<br/><br/><br/>
              </form>
            </div>
            <%}else{ %>
            <div class="header-content-inner">
             <form name=logout action="admin" method="post">
                <h1>관리자 페이지</h1>
                <hr>
                <p>${member_id} 님 관리자 계정으로 로그인 하셨습니다!</p>
                <input type="hidden" name="cmd"/>
                <input type="button" class="btn btn-primary btn-xl page-scroll" value="로그아웃" onclick="javascript:page_move('LOGOUT')"><br/>
      	     </form>
            </div>
            <%} %>
        </div>
    </header>


<!-- 
    <section class="bg-primary" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">We've got what you need!</h2>
                    <hr class="light">
                    <p class="text-faded">Start Bootstrap has everything you need to get your new website up and running in no time! All of the templates and themes on Start Bootstrap are open source, free to download, and easy to use. No strings attached!</p>
                    <a href="#" class="btn btn-default btn-xl">Get Started!</a>
                </div>
            </div>
        </div>
    </section>
 -->
 
 
 
 <!--  서비스 관리
    <section id="services">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">At Your Service</h2>
                    <hr class="primary">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="f-box">
                        <i class="fa fa-4x fa-diamond wow bounceIn text-primary"></i>
                        <h3>회원 관리</h3>
                        <p class="text-muted">Our templates are updated regularly so they don't break.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-paper-plane wow bounceIn text-primary" data-wow-delay=".1s"></i>
                        <h3>업체 관리</h3>
                        <p class="text-muted">You can use this theme as is, or you can make changes!</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-newspaper-o wow bounceIn text-primary" data-wow-delay=".2s"></i>
                        <h3>공지 관리</h3>
                        <p class="text-muted">We update dependencies to keep things fresh.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-heart wow bounceIn text-primary" data-wow-delay=".3s"></i>
                        <h3>게시판 관리</h3>
                        <p class="text-muted">You have to make your websites with love these days!</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
-->


    <section class="no-padding" id="services">
        <div class="container-fluid">
            <div class="row no-gutter">
                <div class="col-lg-4 col-sm-6">
                    <a href="javascript:page_move('REGIADMIN')" class="portfolio-box">
                        <img src="img/portfolio/1.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                    회원 관리
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="javascript:page_move('FOODBOARD')" class="portfolio-box">
                        <img src="img/portfolio/2.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                   업체 관리
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="javascript:page_move('GONGJIBOARDLIST')" class="portfolio-box">
                        <img src="img/portfolio/3.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                   공지 관리
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="javascript:page_move('FREEBOARDLIST')" class="portfolio-box">
                        <img src="img/portfolio/4.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                    게시판 관리
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="#" class="portfolio-box">
                        <img src="img/portfolio/5.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                    ..
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="#" class="portfolio-box">
                        <img src="img/portfolio/6.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                  ..
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </section>

 
 <!-- 
    <aside class="bg-dark">
        <div class="container text-center">
            <div class="call-to-action">
                <h2>Free Download at Start Bootstrap!</h2>
                <a href="#" class="btn btn-default btn-xl wow tada">Download Now!</a>
            </div>
        </div>
    </aside>

 -->
 
 
    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">문의 하세요!</h2>
                    <hr class="primary">
                    <p>우리 오리아 에게 문의를 주세요!</p>
                </div>
                <div class="col-lg-4 col-lg-offset-2 text-center">
                    <i class="fa fa-phone fa-3x wow bounceIn"></i>
                    <p>010-8515-9491</p>
                </div>
                <div class="col-lg-4 text-center">
                    <i class="fa fa-envelope-o fa-3x wow bounceIn" data-wow-delay=".1s"></i>
                    <p><a href="mailto:your-email@your-domain.com">Oria@Oria.com</a></p>
                </div>
            </div>
        </div>
    </section>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    

    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>
    <script src="js/jquery.fittext.js"></script>
    <script src="js/wow.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/creative.js"></script>

    <!--  css -->
	
</body>

<!-- 모달 영역 --> 
<!--   <div class="modal fade" id="theModal" style="width: 260px"> -->
<!--       <div class="modal-header"> -->
<!--          <a href="#" class="close" data-dismiss="modal">&times;</a> -->
<!--          <img src="img/login.PNG" /> -->
<!--       </div> -->
<!--       <div class="modal-body"> -->
<!--          <form name=f2> -->
<!--          <input type="text" placeholder="id" name="member_id"/><br /> -->
<!--          <input type="password" placeholder="password" name="member_pass" /><br /> -->
<!-- 		 <input type="hidden" name="cmd" value="LOGIN" />	 -->

<!--          <button type="button" class="btn" onclick="Login()">로그인</button> -->
<!--          <button type="button" class="btn" onclick="Register()">회원가입</button> -->
<!-- 		 </form> -->
<!--       </div> -->
<!--    </div> -->



 <form name=move action="admin" method="post">
 	<input type="hidden" name="cmd"/>
</form>
</html>