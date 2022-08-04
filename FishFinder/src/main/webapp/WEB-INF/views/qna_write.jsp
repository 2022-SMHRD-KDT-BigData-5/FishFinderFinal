<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<h1>Question</h1>
					<div class="question_box">
						<div class="board_write">
							<div class="title">
								<dl class="title_flex">
									<!-- <dt>제목 : </dt>
									<input type="text" style="border: none; background: transparent;" size="30" placeholder="제목을 입력해주세요."> -->
								</dl>
							</div>
							<div class="cont">
								<textarea class="qna_content" placeholder="내용을 입력해주세요. (60자 이내)" maxlength="60"></textarea>
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
								<li><a href="/qna" class="icon solid fa-sign-out"><span class="label">Exit</span></a></li>
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
				<!-- Footer -->
				<footer id="footer">
	               <span class="copyright"><a href="/fish/join">Logout</a>.</span>
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
		// 접고 펼치기
		const items = document.querySelectorAll('.qna_q');

		function openCloseAnswer() {
			const answerId = this.id.replace('clickQ', 'showA');

			if(document.getElementById(answerId).style.display === 'block') {
			document.getElementById(answerId).style.display = 'none';
			document.getElementById(this.id + '-toggle').textContent = '+';
			} else {
			document.getElementById(answerId).style.display = 'block';
			document.getElementById(this.id + '-toggle').textContent = '-';
			}
		}

		items.forEach(item => item.addEventListener('click', openCloseAnswer));
	
		function click(){
			document.getElementById("submitBtn").click();
			
		}
	</script>
</html>