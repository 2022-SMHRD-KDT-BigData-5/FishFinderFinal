<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<div class="container">
		<h2>SpringMVC01</h2>
		<div class="panel panel-default">
			<div class="panel-heading">Panel Heading</div>
			<div class="panel-body">
				<form class="form-horizontal" action="communityUpdate.do" method="post">
					<input type="hidden" name="article_seq" value="${ community.article_seq }">
    				<div class="form-group">
      					<label class="control-label col-sm-2" for="article_title">제목 : </label>
      					<div class="col-sm-10">
        					<input type="text" class="form-control" id="article_title" value="${ community.article_title }" name="article_title">
      					</div>
    				</div>
    				<div class="form-group">
      					<label class="control-label col-sm-2" for="user_num">작성자 : </label>
      					<div class="col-sm-10">          
        					<input type="text" class="form-control" id="user_num" value="${ community.user_num }" name="user_num" readonly="readonly">
      					</div>
    				</div>
    				<div class="form-group">        
      					<label class="control-label col-sm-2" for="article_content">내용 : </label>
      					<div class="col-sm-10">          
        					<textarea row="10" class="form-control" id="article_content" name="article_content">${ community.article_content }</textarea>
      					</div>
    				</div>
    				<div class="form-group">        
      					<div class="col-sm-offset-2 col-sm-10">
        					<button type="submit" class="btn btn-default">Submit</button>
      					</div>
    				</div>
  				</form>				
			</div>
			<div class="panel-footer">빅데이터12차 김승현</div>
		</div>
	</div>

</body>
</html>
