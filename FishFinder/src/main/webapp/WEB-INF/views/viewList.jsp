<%@page import="com.smhrd.domain.Community"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
	import ="com.smhrd.web.SessionUserCounter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 실험용 게시판 리스트 나중에 지우기@@@@@ -->
	<div class="container">
		<h2>FishFinde22</h2>
		<div class="panel panel-default">
		<div class="panel-heading">Panel Heading</div>
		<div class="panel-body">
			<table class="table table-bordered table-hover">
				<thead>
				<tr>
					<td>글번호</td>
					<td>날짜</td>
					<td>작성자</td>
					<td>제목</td>
					<td>조회수</td>
				</tr>
				</thead>
				<c:set var="cnt" value="1"/>
				<c:forEach var="list" items="${list}">
				<tr>
					<td><c:out value="${cnt}"/></td>
					<td id='date${list.article_date}'>${ fn:split(list.article_date, " ")[0]}</td>
					<td><c:out value="${list.user_num}"/></td>
					<td><a href='javascript:open(${list.article_seq})'><c:out value="${list.article_title}"/></a></td>
					<td id="count${list.article_seq}"><c:out value="${list.article_cnt}"/></td>
				</tr>
				<c:set var="cnt" value="${cnt+1}"/>
				</c:forEach>
			</table>
			<div>
			<button onclick=" location.href='viewIn' " class="btn btn-sm btn-success">작성</button>			
			</div>
		<div class="panel-footer">빅데이터12차 김승현</div>
		</div>
	</div>
<script type="text/javascript" src="js/community2.js"></script>
</div>
</body>
</html>
