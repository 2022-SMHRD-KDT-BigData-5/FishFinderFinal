<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>암행漁사</title>
    <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="assets/css/admin.css" />
</head>
<body>
    <div class="container">
        <div class="navigation">
            <ul>
                <li>
                    <a href="/fish/admin">
                        <span class="icon"><img src="assets/css/images/logo3.png"></span>
                        <span class="title1"><img src="assets/css/images/logo4.png"></span>
                    </a>
                </li>
                <li>
                    <a href="/fish/admin">
                        <span class="icon"><ion-icon name="home-outline"></ion-icon></span>
                        <span class="title">홈</span>
                    </a>
                </li>
                <!-- <li>
                    <a href="#">
                        <span class="icon"><ion-icon name="person-outline"></ion-icon></ion-icon></span>
                        <span class="title">Customers</span>
                    </a>
                </li> -->
                <li>
                    <a href="/fish/adminCommunity">
                        <span class="icon"><ion-icon name="receipt-outline"></ion-icon></span>
                        <span class="title">게시판</span>
                    </a>
                </li>
                <li>
                    <a href="/fish/adminQna">
                        <span class="icon"><ion-icon name="help-outline"></ion-icon></ion-icon></span>
                        <span class="title">질문</span>
                    </a>
                </li>
                <!-- <li>
                    <a href="#">
                        <span class="icon"><ion-icon name="settings-outline"></ion-icon></span>
                        <span class="title">Settings</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><ion-icon name="lock-closed-outline"></ion-icon></span>
                        <span class="title">Password</span>
                    </a>
                </li> -->
                <li>
                    <a href="/fish">
                        <span class="icon"><ion-icon name="log-out-outline"></ion-icon></span>
                        <span class="title">로그아웃</span>
                    </a>
                </li>
            </ul>
        </div>

        <!-- main -->
        <div class="main">
        <div class="details">
            <!-- order details list -->
          <div class="container">
		<h2>QnA 게시판</h2>
		<div class="panel panel-default">
			<div class="panel-body">



				<!-- list 가져와서 출력 -->
				<table class="table table-borderd table-hover">
					<tr>
						<td>글 번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회수</td>
						<td>답변상태<td>
					</tr>
					<c:forEach var="list" items="${list}" varStatus="status">
						
						<tr onclick="location.href='/fish/viewContentAdmin/${list.q_seq }'">
						
							<td>${list.q_seq }</td>
							
							<!-- 
							1. 쿼리 스트링
							url?name=val
							2. path variable
							url/val/val
							 -->
							<td>${list.q_content }</td>
							<td>${list.user_num }</td>
							<td>${list.q_date }</td>
							<td>${list.q_cnt }</td>
							<c:choose>
						        <c:when test="${list.q_status == 0 }">
						            <td><a href='fish/questionInsert.do'"><c:out value="답변 하기"/></a></td>
						        </c:when>         
						        <c:otherwise>
						          <td><c:out value="답변 완료"/></td>
						         </c:otherwise>
						    </c:choose>
						</tr>
						
					</c:forEach>
				</table>


			</div>
			<div class="panel-footer">암행어사</div>
		</div>
	</div>  
            
           



        </div>


        </div>  
    </div>
    

    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
	<script src="assets/js/admin.js"></script>
    <script>
        // MenuToggle
        let toggle = document.querySelector('.toggle');
        let navigation = document.querySelector('.navigation');
        let main = document.querySelector('.main');
        // 클릭시 @ active 클래스로 변경 
        toggle.onclick = function(){
            navigation.classList.toggle('active')
            main.classList.toggle('active')
        }
        
        // add hovered class in selected list item
        let list = document.querySelectorAll('.navigation li');
        function activeLink(){
            list.forEach((item) =>
            item.classList.remove('hovered'));
            this.classList.add('hovered')
        }
        list.forEach((item) =>
        item.addEventListener('mouseover',activeLink)); 
        
        
        
        </script>
</body>
</html>