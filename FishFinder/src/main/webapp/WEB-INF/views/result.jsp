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
		<link rel="stylesheet" href="/fish/assets/css/main.css" />
		<link rel="stylesheet" href="/fish/assets/css/result.css" />
		<noscript><link rel="stylesheet" href="./assets/css/noscript.css" /></noscript>
		<!-- fontawesome token -->
		<script src="https://kit.fontawesome.com/e340e95114.js" crossorigin="anonymous"></script>
		<!--main js-->
		<script src="./assets/js/main.js"></script>
		<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
		

	</head>
	<body class="is-preload">
		<div id="wrapper">
			<div id="bg"></div>
			<div id="overlay"></div>
			<div id="main">
				<!-- Header -->
				<header id="header">
					<h1>RESULT</h1>
					<!-- <a href="kakaolink://launch">카카오톡앱</a> -->
                    <div class="container">
                    <img id="fishImg" class="result" src="http://172.30.1.33:9000/static/_AI/${his_vo.fish_img }" alt="">
					
					</div>
					<!-- <div class="meter1">
                    	<meter class="meter" value="0.8" low="0.31" optimum="0.61" high="0.81"></meter><br>
                    	<span>감성돔과 X % 일치합니다.</span>
					</div> -->

					<!-- <div class="progress-bar" style="--width:50" data-label="50%..."></div> -->
					<!-- 결과 안내 창 -->
					<div class = "card">
						<div class="result_font">표준어로는 '넙치'이고 '광어'가 사투리였지만 광어라는 이름으로 널리 불리면서 광어도 표준말로 대접받게 되었다.<br>생김새가 비슷한 어종으로는 도다리와 가자미가 있다.<br><div class="result_font2">넙치 특징 :</div>1. 가슴지느러미를 아래로 향했을 때, 얼굴이 왼쪽 방향이다.<br>2. 얼굴을 아래로 향하게 했을 때, 눈이 왼쪽으로 몰려있다.<br>3. 입이 크고 이빨이 발달했다.</div>			


					</div>
					<nav>
						<ul>
							<li><a href="#" class="fa-solid fa-link" onclick="sendLinkDefault()" style="color: #fff;"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="fa-solid fa-floppy-disk" style="color: #fff;"><span class="label">Facebook</span></a></li>

						</ul>
            
					</nav>
					

					<nav>
						<ul>
		                     <li><a href="/fish/index" class="icon solid fa-home"><span class="label">Home</span></a></li>
		                     <li><a href="/fish/history" class="icon solid fa-history"><span class="label">History</span></a></li>
		                     <li><a href="/fish/view" class="icon solid fa-list"><span class="label">Board</span></a></li>
		                     <li><a href="/fish/qna" class="icon solid fa-question"><span class="label">Q&A</span></a></li>
		                 </ul>
					</nav>
				</header>
				<footer id="footer">
	               <span class="copyright"><a href="/logout">Logout</a>.</span>
	               <!-- 관리자 로그인 시 이동 가능한 버튼 -->
					<c:if test="${sessionScope.user_type == 1}">
		               	<span class="copyright"><a href="/fish/admin">Admin</a>.</span>
		            </c:if>
	            </footer>
			</div>
		</div>
	<!-- 	<script>
			const progressBar = document.getElementsByClassName('progress-bar')[0]
			setInterval(() => {
			const computeredStyle = getComputedStyle(progressBar)
			const width = parseFloat(computeredStyle.getPropertyValue('--width')) || 0
			progressBar.style.setProperty('--width',width + .1)
			}, 5)
		</script>  -->
	</body>
	<script type="text/javascript">
		window.onload = function() { document.body.classList.remove('is-preload'); }
		window.ontouchmove = function() { return false; }
		window.onorientationchange = function() { document.body.scrollTop = 0; }
 

	  function sendLinkDefault() {
		// 사용할 앱의 JavaScript 키 설정
		  Kakao.init('1164def143509ff0c0d32517fc31f7de');
		 
		  // 카카오링크 버튼 생성
		  Kakao.Share.sendDefault({
			  objectType: 'feed',
			  content: {
			    title: '분석 결과입니다',
			    imageUrl:'http://172.30.1.33:9000/static/_AI/${his_vo.fish_img}',
			    link: {
			      mobileWebUrl: 'https://developers.kakao.com',
			      androidExecutionParams: 'test',
			    },
			  },

			  buttons: [
			    {
			      title: '웹으로 이동',
			      link: {
			        mobileWebUrl: 'https://developers.kakao.com',
			      },
			    },
			    {
			      title: '앱으로 이동',
			      link: {
			        mobileWebUrl: 'https://developers.kakao.com',
			      },
			    },
			  ]
			});
	 }
</script>
	
</html>