<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>플라밍고</title>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">

<link rel="stylesheet" href="basicstyle.css" />
<script type="text/javascript" src="js/prefixfree.min.js"></script>
<!--mdlfont -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- mdl js-->
<script defer src="https://code.getmdl.io/1.1.3/material.min.js"></script>
<script type="text/javascript" src="js/prefixfree.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<!--mdl css-->
<link rel="stylesheet"
	href="https://code.getmdl.io/1.1.3/material.indigo-pink.min.css">

<!-- shadowbox -->
<link rel="stylesheet" type="text/css"
	href="user/shadow/css/shadowbox.css">
<script type="text/javascript" src="user/shadow/js/shadowbox.js"></script>

<script type="text/javascript">
/* 	Shadowbox.init({
		players:["iframe"]
	});
	function join()
	{
		Shadowbox.open({
			content:'user/main/user/join.jsp',
			player:'iframe',
			width:600,
			height:500,
			title:''
		});
	}*/
         $(function(){
        	 $('#logBtn').click(function(){
        		 var id=$('#id').val();
        		 if(id.trim()=="")
        		 {
        			 $('#id').focus();
        			 return;
        		 }
        		 var pwd=$('#pwd').val();
        		 if(pwd.trim()=="")
        		 {
        		     $('#pwd').focus();
        		     return;
        		 }
        		 $('#logForm').submit();
        	 });
        	 $('#logoutBtn').click(function(){
        		$('#logoutForm').submit(); 
        	 });
         });
        </script>

    </head>
    <body>
    
    
    	<header>
			<a href="main.do"><h1>logo</h1></a>
			<ul id="gnb">
				<div>
				<c:if test="${sessionScope.id!=null }">
					 <c:if test="${sessionScope.admin==0 }">
					<li><a href="myPage.do"><div id="mypage" class="material-icons mdl-badge mdl-badge--overlap" data-badge="♥">account_box</div>MyPage</a></li>
					</c:if>
					<c:if test="${sessionScope.admin==1 }">
						<li><a href="admin.do">예약현황보기</a></li>
					</c:if>

				</c:if>

				<li><a href="plannerMain.do"><!-- <i class="fa  fa-map-marker"> --><img src="bg/Package tracking 2.png" width="30px" height="30px"> Planner</a></li>
				<li><a href="recomm.do"><img src="bg/Certification.png" width="30px" height="30px"> 플라밍Go's<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;recomm</a></li>
				<li><a href="tour.do"><img src="bg/Shopping cart.png" width="30px" height="30px"> Tour</a></li>
				<li><a href="squrePage.do"><img src="bg/Package tracking 1.png" width="28px" height="28px"> Openspace</a></li>	
				<c:if test="${sessionScope.id==null }">
				<li><a href="join.do"><button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="joinBtn" onclick="join()">
                <i class="fa fa-chevron-circle-right"> </i>회원가입
                </button></a></li>
				</c:if>
				</div>
			</ul>


		<div class="snsSet">
			<a href="#"><img src="user/main/img/sns1.png" alt="about" /></a> <a
				href="#"><img src="user/main/img/sns2.png" alt="contact" /></a> <a
				href="#"><img src="user/main/img/sns3.png" alt="facebook" /></a> <a
				href="#"><img src="user/main/img/sns4.png" alt="twitter" /></a> <a
				href="#"><img src="user/main/img/sns5.png" alt="etc" /></a>
		</div>
	</header>

	<nav>
		<div id="navi">

				 <c:if test="${sessionScope.id==null }">
				  <form method="post" action="login.do" id="logForm">
				   ID : <input type=text name=id size=12 id="id">
                   &nbsp;
                   Password : <input type=password name=pwd size=10 id="pwd">
                
                &nbsp;<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="logBtn">
                <i class="fa fa-chevron-circle-right"></i> 로그인
                </button>
                  </form>
                 </c:if>	
                 <c:if test="${sessionScope.id!=null }">
                  <form method="post" action="logout.do" id="logoutForm">
          
				   ${sessionScope.id }(${sessionScope.admin==0?"일반":"관리자" })님 환영합니다!!&nbsp;
                  &nbsp;<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="logoutBtn">
                <i class="fa fa-chevron-circle-right"></i> 로그아웃
                </button>&nbsp;
               
                  </form>
                 </c:if>			 
				</div>

	</nav>
	<section>
	<jsp:include page="${jsp }"></jsp:include>
	
	</section>
	
    </body>
</html>
