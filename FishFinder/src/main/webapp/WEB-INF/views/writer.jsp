<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<link rel="stylesheet" href="assets/css/board.css" />
		<link rel="stylesheet" href="assets/css/qna_write.css" />
		<link rel="stylesheet" href="assets/css/writer.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		<!-- fontawesome token -->
		<script src="https://kit.fontawesome.com/e340e95114.js" crossorigin="anonymous"></script>
	</head>
	<body class="is-preload">
		<div id="wrapper">
			<div id="bg"></div>
			<div id="overlay"></div>
			<div id="main">
				<!-- Header -->
				<header id="header">
				<form action="viewInsert" method="post" enctype="multipart/form-data">
					<h1>Write</h1>
					<div class="question_box">
						<div class="board_write">
							<div class="title">
								<dl class="title_flex">
									<dt>제목 : </dt>
									<input value ='${sessionScope.user_num}' type="hidden" class="form-control" id="user_num" placeholder="Enter writer" name="user_num">
									<input class="title_type" name="article_title" type="text" style="border: none; background: transparent;" size="" placeholder="제목을 입력해주세요. (20자 이내)" maxlength="20">		
								</dl>
							</div>
							<input value ="${sessionScope.user_num}" type="hidden" class="form-control" id="user_num" placeholder="Enter writer" name="user_num">
							<div class="cont">
								<textarea name="article_content" class="write_content" placeholder="내용을 입력해주세요.(400자 이내 )" maxlength="400"></textarea>
							</div>
							<div class="upload_image">
								<input type="file" name="images[]" id="inputImage" accept="image/*">
								<!-- <button id="sendButton">보내기</button> -->
							</div>
						</div>
						<nav>
							<ul>
								<li>
									<a href="javascript:click()" class="icon solid fa-check">
										<label for="submitBtn">
											<input type="submit" id="submitBtn" style="display:none">
											<span class="label">Check</span>
										</label>
									</a>
								</li>
								<li><a href="/history" class="icon solid fa-sign-out"><span class="label">Exit</span></a></li>
							</ul>
						</nav>
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
				</form>
				<!-- Footer -->
				<footer id="footer">
	               <span class="copyright"><a href="/logout">Logout</a>.</span>
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
		// 파일 업로드
		// document.querySelector("#sendButton").addEventListener('click',()=>{
		
		// let selectFile = document.querySelector("#inputImage").files[0];

		// const file = URL.createObjectURL(selectFile);

		// document.querySelector(".uploadImage").src = file;

		// })

		// 파일 주소 불러오기
		document.querySelector("#sendButton").addEventListener('click', () => {
			let selectFile = document.querySelector("#inputImage").files[0];
			console.log(selectFile);
		})
		
		function click(){
			document.getElementById("submitBtn").click();
			
		}
	</script>
</html>