<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<link rel="stylesheet" href="assets/css/qna.css" />
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
					<h1>Q&A</h1>
					<div class="qna_box">
						<div class="qna_menu">
							<a href="#">전체</a>
							<a href="#">주로 묻는 질문</a>
							<a href="#">나의 질문</a>
							<a href="/fish/qna_write">질문하기</a>
						</div>
						<div class="qna_scroll">
							<ul id="list">
							
							</ul>
						</div>
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
	               <span class="copyright"><a href="/logout">Logout</a>.</span>
	               <!-- 관리자 로그인 시 이동 가능한 버튼 -->
					<c:if test="${sessionScope.user_type == 1}">
		               	<span class="copyright"><a href="/fish/admin">Admin</a>.</span>
		            </c:if>
	            </footer>
			</div>
		</div>
	</body>
	 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	

	$(document).ready( (e) => {
		allQuestions()		
		

		
		
	})
	

	
		window.onload = function() { document.body.classList.remove('is-preload'); }
		window.ontouchmove = function() { return false; }
		window.onorientationchange = function() { document.body.scrollTop = 0; }

		
		
		
		
		
		
		
		
		
		
		function allQuestions(){
			$.ajax({

                url : '/fish/qnaShow',
                type : 'get',
                data : {
                },
                dataType : "json",
                success : function(data){
                	
                	let table="";
                	
                	for(let i=0;i<data.length;i++) {
 
                		table += '<li class="tes">'
                		table += '<div class="qna_qa">'
                		table += '<div class="qna_q" id="clickQ-'+(i+1)+'"><span id="clickQ-'+(i+1)+'-toggle"><i class="fa fa-plus" aria-hidden="true"></i></span>'
                		table += '<span class="qna_title">'+data[i].q_content
                		table += '<div class="qna_date">'+data[i].q_date+'</div></span></div>'
                        

                		
                        if(data[i].q_status ==0){
                        	table +=  '</div>'
                       		table +=  '<a href="/fish/questionInsert.do" class="go_answer"><i class="fa fa-arrow-up" aria-hidden="true"></i> 답변하기</a>'
                        	table +=  '</li>'

                        }else{
                        	table += getAnswer(data[i].q_seq, i);
                            	   
                        }
                    
                	}
            		$('#list').append(table);
                },
                error : function(){
                    alert('error!')
                }


            })
		}
		
		
		 
		
		
		
		function getAnswer(q_seq, i){
			let table ="";
	            $.ajax({

	                url : '/fish/answerShow',
	                type : 'get',
	                async: false,     //값을 리턴시 해당코드를 추가하여 동기로 변경
	                data : {
						'q_seq' : q_seq
	                },
	                dataType : "json",
	                success : function(data){
                 
	                	table +=  '<div class="qna_a" id="showA-'+(i+1)+'">'+data.a_content+'</div>'
                        table +=  '</div></li>'

                        
	                },
	                error : function(){
	                    alert('error!')
	                }


	            })

				return table;
	        }

		function freQuestions(){
			
		}
		function myQuestions(){
	
		}
		
		
	
	</script>

	<script>
	$(document).ready(function(){
			$(document).on("click",".qna_q",function(event){             
				if($(this).next().css("display") == 'none'){
					$(this).next().show();
					$(this).children()[0].innerHTML = "<i class='fa fa-minus' aria-hidden='true'></i>";
				}else{
					$(this).next().hide();
					$(this).children()[0].innerHTML = "<i class='fa fa-plus' aria-hidden='true'></i>";
				};
			});      
		});
	</script>

	
	

</html>