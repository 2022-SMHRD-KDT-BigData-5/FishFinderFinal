<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/fish/assets/css/main.css" />
<link rel="stylesheet" href="/fish/assets/css/qna.css" />
<link rel="stylesheet" href="/fish/assets/css/view.css" />
<noscript>
   <link rel="stylesheet" href="/fish/assets/css/noscript.css" />
</noscript>
<!-- fontawesome token -->
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/e340e95114.js"
   crossorigin="anonymous"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="/fish/js/view.js"></script>
</head>
<body class="is-preload">
   <div id="wrapper">
      <div id="bg"></div>
      <div id="overlay"></div>
      <div id="main">
         <!-- Header -->
         <header id="header">
            <h1>View</h1>
            <div class="qna_box">
               <div class="view_scroll">
                  <div class="view_title">${ requestScope.community.article_title }</div>
                  <div href='javascript:getname(${community.user_num})'class="view_writer">${ community.user_nick }</div>
                  <div class="view_dvc">
                     <span class="view_date">${ fn:split(community.article_date, " ")[0] }</span>
                     <span class="view_views">조회수 : ${ community.article_cnt }</span>
                     <span class="view_comments" id="commentCnt">${comm.size}</span>
                  </div>
                  <div class="view_content">
                     <div class="view_image">
                        <img
                           src="${pageContext.request.contextPath }/image/${community.article_file}"
                           class="view_img">
                     </div>
                     <div class="content">
                        <%
                           pageContext.setAttribute("newLine", "\n");
                        %>
                        ${ fn:replace( community.article_content, newLine, "<br>") }
                     </div>
                  </div>
                  <div class="comments_menu">
                     <!-- 수정 삭제는 내 글에서만 -->
                     <div class="view_md">
                        <c:if test="${community.user_num == sessionScope.user_num}">
                           <a href='javascript:goUpdate(${community.article_seq})'
                              class="view_modify">수정</a>
                           <a href='javascript:goDelete(${community.article_seq})'
                              class="view_delete">삭제</a>
                        </c:if>
                        <a href='javascript:goList()'>목록</a>
                     </div>
                  </div>
                  <!-- 댓글작성 -->
                  <form action="/fish/commIn" method="post">
                     <div class="comm_write_box">
                        <a name="here"><textarea id="comment_content"
                              class="comm_text" name="comment_content"></textarea></a> <input
                           id="article_seq" name="article_seq" type="hidden"
                           value="${community.article_seq}"> 
                           <input id="user_num" name="user_nick" type="hidden" value="${sessionScope.kakaoN}">
                           <input id="user_num" name="user_num" type="hidden" value="${sessionScope.user_num}">
                        <button type="submit" class="custom-btn btn-3">등록</button>
                     </div>
                  </form>
                  <!-- 댓글작성 끝 -->
                  <!-- 댓글목록 -->
                  <c:forEach items="${comment}" var="clist">
                     <div class="comments_box">
                        <div id="replyModal">
                           <div class="comments_writer" value="${clist.user_num}">${clist.user_nick}</div>
                           <div class="comments_content">${fn:replace(clist.comment_content, newLine, "<br>")}</div>
                           <div class="comments_dmd">
                              <div class="comments_date">${fn:split(clist.comment_date, " ")[0]}</div>
                           </div>
                           <form action="commUp/${clist.comment_seq}/${clist.article_seq}" method="post">
                              <c:if test="${clist.user_num == sessionScope.user_num}">
                                 <div class="comments_md">
                                    <!-- 모달창 -->
                                    <input type="checkbox" id="popup"> 
                                       <label for="popup"><a class="comments_modify">[수정]</a></label>
                                    <div>
                                       <input type="hidden" name="comment_seq" value="${clist.comment_seq}"> 
                                       <input type="hidden" name="article_seq" value="${clist.article_seq}">
                                       <textarea class="write_content" name="comment_content">${clist.comment_content}</textarea>
                                       <button type="submit" class="custom-btn btn-3">
                                          <span>수정하기</span>
                                       </button>
                                       <div>
                                          <label for="popup"></label>
                                       </div>
                                       <label for="popup"></label>
                                    </div>
                                    <!-- 모달창끝 -->
                                    <a
                                       href="javascript:commDel(${clist.comment_seq},${clist.article_seq})"
                                       class="comments_delete">[삭제]</a>
                                 </div>
                              </c:if>
                           </form>
                        </div>
                     </div>
                  </c:forEach>
                  <!-- 댓글목록  끝-->
               </div>
            </div>
            <nav>
               <ul>
                  <li><a href="/fish/index" class="icon solid fa-home"><span
                        class="label">Home</span></a></li>
                  <li><a href="/fish/history" class="icon solid fa-history"><span
                        class="label">History</span></a></li>
                  <li><a href="/fish/view" class="icon solid fa-list"><span
                        class="label">Board</span></a></li>
                  <li><a href="/fish/qna" class="icon solid fa-question"><span
                        class="label">Q&A</span></a></li>
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
<script>
   window.onload = function() {
      document.body.classList.remove('is-preload');
   }
   window.ontouchmove = function() {
      return false;
   }
   window.onorientationchange = function() {
      document.body.scrollTop = 0;
   }
</script>

</head>
</html>