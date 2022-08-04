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
            <div class="topbar">
                <div class="toggle">
                    <ion-icon name="menu-outline"></ion-icon>
                </div>
                <!-- search -->
                <div class="search">
                    <label>
                        <input type="text" placeholder="Search here">
                        <ion-icon name="search-outline"></ion-icon>
                    </label>
                </div>
                <!-- user -->
                <div class="user">
                    <img src="assets/css/images/user.jpg">
                </div>
            </div>

            <!-- cards -->
            <div class="cardBox">
                <div class="card">
                    <div>
                        <div class="numbers">${count[0] }</div>
                        <div class="cardName">회원</div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="people-circle-outline"></ion-icon>
                    </div>
                </div>
                <div class="card">
                    <div>
                        <div class="numbers">${count[1] }</div>
                        <div class="cardName">분석 수</div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="search-outline"></ion-icon>
                    </div>
                </div>
                <div class="card">
                    <div>
                        <div class="numbers">${count[2] }</div>
                        <div class="cardName">게시글</div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="reader-outline"></ion-icon>
                    </div>
                </div>
                <div class="card">
                    <div>
                        <div class="numbers">${count[3] }</div>
                        <div class="cardName">질문</div>
                    </div>
                    <div class="iconBx">
                        <ion-icon name="help-circle-outline"></ion-icon>
                    </div>
                </div>
            </div>
        
        
        <div class="details">
            <!-- order details list -->
            <div class="recentOrders">
                <div class="cardHeader">
                    <h2>통계</h2>
                    <a href="#" class="btn">View All</a>
                </div>
            <div>
                <!-- 여따 넣고싶다 -->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
             <canvas id="line-chart" width="250" height="200"></canvas>
                <script src="js/Chart.min.js"></script>
            </div>
            </div>

            <!-- New Customer -->
            <div class="recentCustomers">
                <div class="cardHeader">
                     <div><h2>미응답 질문</h2><div> 
                    <!-- --------------------------- -->
                    
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
               </tr>
            <c:forEach var="qlist" items="${qlist}" varStatus="status">
               
                  <tr onclick="location.href='/fish/questionInsert.do'">
                     <td>${qlist.q_seq }</td>
                     <td>${qlist.q_content }</td>
                     <td>${qlist.user_num }</td>
                     <td>${qlist.q_date }</td>
                     <td>${qlist.q_cnt }</td>
                  </tr>
               
            </c:forEach>
               
            </table>
            


         </div>
         
      </div>
                    <!-- ---------------------------- -->
                </div>
               <!-- ----------------------------- -->
               <div><h2>신고된 게시글</h2><div> 
                    <!-- --------------------------- -->
                    
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
                  <td></td>
               </tr>
            <c:forEach var="rlist" items="${rlist}" varStatus="status">
                  <tr onclick="location.href='/fish/viewContentAdmin/${rlist.article_seq }'">
                  
                     <td>${rlist.article_seq }</td>
                     <td>${rlist.article_title }</td>
                     <td>${rlist.user_num }</td>
                     <td>${rlist.q_date }</td>
                     <td>${rlist.q_cnt }</td>
                     <td><button onclick='javascript:goDeleteAdmin(${rlist.article_seq})' class="btn btn-sm btn-success">삭제</button></td>
                  </tr>
            </c:forEach>
               
         </table>



         </div>
         
      </div>
               <!-- ---------------------------- -->
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