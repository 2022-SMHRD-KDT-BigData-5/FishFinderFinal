<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<!--
	Aerial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Aerial by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/history.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		<!-- fontawesome token -->
		<script src="https://kit.fontawesome.com/e340e95114.js" crossorigin="anonymous"></script>
		<script src="js/history.js"></script>
	</head>
	<body class="is-preload">
		<div id="wrapper">
			<div id="bg"></div>
			<div id="overlay"></div>
			<div id="main">
				<!-- Header -->
				<header id="header">
					<h1>HISTORY</h1>
					<div class="history_box">
						<ul>
							<c:forEach var="his_list" items="${his_list}">
				               <a href="result?fish_img=${his_list.fish_img }" class="his_list">
				                  <li class="history_list">
				                     <div class="preview_img">
				                        <img class="history_img" src="http://172.30.1.33/:9000/static/_AI/${his_list.fish_img }"
				                           alt="">
				                     </div>
				                     <div class="history_tnd">
				                        <div class="history_title"><c:out value="${his_list.result }"/></div>
				                        <div id="date${list.article_date}" class="history_date">${ fn:split(his_list.search_date, " ")[0]}</div>
				                     </div>
				                     <div class="history_dnn">
				                        <button id="his_del" onclick="hisDel(${his_list.his_seq })" class="history_delete">삭제</button>
				                     </div>
				                  </li>
				               </a>
				            </c:forEach>
						</ul>
					</div>
					<nav>
						 <ul>
		                     <li><a href="/fish/index" class="icon solid fa-home"><span class="label">Home</span></a></li>
		                     <li><a href="/fish/history" class="icon solid fa-history"><span class="label">History</span></a></li>
		                     <li><a href="/fish/view" class="icon solid fa-list"><span class="label">Board</span></a></li>
		                     <li><a href="/fish/qna" class="icon solid fa-question"><span class="label">Q&A</span></a></li>
		                 </ul>
					</nav>
				</header>
				<!-- Footer -->
				<footer id="footer">
	               <span class="copyright"><a href="/fish/logout">Logout</a>.</span>
	               <!-- 관리자 로그인 시 이동 가능한 버튼 -->
	                <c:if test="${sessionScope.user_type == 1}">
	               		<span class="copyright"><a href="/fish/admin">Admin</a>.</span>
	               	</c:if>
            	</footer>
			</div>
		</div>
	</body>
	<script>
		window.onload = function() { document.body.classList.remove('is-preload'); }
		window.ontouchmove = function() { return false; }
		window.onorientationchange = function() { document.body.scrollTop = 0; }
	</script>
	   <script type="text/javascript">
      
	   function hisDel(his_seq){
	      
	      let bool = confirm('기록을 삭제 하시겠습니까?');
	      if(bool ==true){
	         location.href = '/fish/historyDel/'+his_seq;
	      }
	      
	   }
   
   </script>
</html>