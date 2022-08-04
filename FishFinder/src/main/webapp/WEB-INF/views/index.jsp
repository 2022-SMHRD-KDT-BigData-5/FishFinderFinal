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
      <link rel="stylesheet" href="./assets/css/main.css" />
      <noscript><link rel="stylesheet" href="./assets/css/noscript.css" /></noscript>
      <!-- fontawesome token -->
      <script src="https://kit.fontawesome.com/e340e95114.js" crossorigin="anonymous"></script>
   </head>
   <body class="is-preload">
      <div id="wrapper">
         <div id="bg"></div>
         <div id="overlay"></div>
         <div id="main">
            <!-- Header -->

            <img src="assets/css/images/wsmallLogo.png" class="smallLogo">
            <header id="header">
               <!-- <a href="kakaolink://launch">카카오톡앱</a> -->
               <img src="assets/css/images/logo2.png" alt="" class="mainLogo">
               <!-- <h1 class="mainTitle"></h1> -->
               <div class="preview_container" id="imagePreview">
                  <img class="img_thumbnail" id="show-picture" src="">
               </div>
               <!-- 지울부분 
               	<br>
               	오늘 접속 수 : ${sessionScope.todayCount}
               	<br>
               	총 접속자 수 : ${sessionScope.totalCount}
               	<br>
               	지울부분  끝-->
               <nav>
                  <ul>
                     <!-- <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li> -->
                     <!-- <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li> -->
                     <!-- <li><a href="#" class="icon brands fa-dribbble"><span class="label">Dribbble</span></a></li> -->
                     <form method="post" enctype="multipart/form-data">
                     	<!-- 카메라 호출 -->
	                    <li>
	                        <a><label class="input-file-button" for="inputFile"><i class="icon solid fa-camera"></i></label></a>
	                        <input type="file" name="file" accept="image/*" capture="camera" id="inputFile" style="display:none"/>
	                    </li>
	                    <!-- 이미지 호출 -->
	                    <li>
	                        <a><label class="input-file-button2" for="images" id="call_image"><i class="icon solid fa-image"></i></label></a>
	                        <!-- <input type="file" accept="image/*" id="input-file" style="display:none"/> -->
	                        <input type="file" name="file2" id="images" accept="image/*" multiple="multiple" style="display:none">
	                        <input type="hidden" name="access_Token" value="${sessionScope.access_Token }" style="display:none">
	                    	<input type="hidden" name="user_num" value="${sessionScope.user_num }" style="display:none">
	                    </li>
	                    <!-- 이미지 전송 -->
	                    <li>
	                    	<a><label class="input-file-button2" for="submit_img" id="submit_image"><i class="icon solid fa-check"></i></label></a>
	                        <button type="button" onclick="fileUploadtest()" id="submit_img" style="display: none;">
	                 	</li>
                     </form>
                  </ul>
                  <br>

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
               <span class="copyright"><a href="/logout">Logout</a>.</span>
               <!-- 관리자 로그인 시 이동 가능한 버튼 -->
				<c:if test="${sessionScope.user_type == 1}">
	               	<span class="copyright"><a href="/fish/admin">Admin</a>.</span>
	            </c:if>
            </footer>
         </div>
      </div>
   </body>
   <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script src="js/main.js"></script>
   <script src="./js/upload.js"></script>
</html>