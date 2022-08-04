document.querySelector('.board_selectMy').style.display = 'none';

// 전체
document.getElementsByClassName(".boardAll").addEventListener('click', showAll);
function showAll(){
  document.querySelector('.board_selectMy').style.display = 'none';
  document.querySelector('.board_selectAll').style.display = 'block';
}
// 내가 쓴 글
document.getElementsByClassName(".boardMy").addEventListener('click', showMy);
function showMy(){
  document.querySelector('.board_selectAll').style.display = 'none';
  document.querySelector('.board_selectMy').style.display = 'block';  
}
//====================================================================================
// 내용 보기 + 조회수 카운트
function open(article_seq){	
		
		location.href='/fish/viewContent/' + article_seq;
		let count = Number($('#count' + article_seq).html());
		
		$.ajax({
			type : "post",
			url : "viewCntUp",
			dataType : "json",
			data : {
				"article_seq" : article_seq,
				"article_cnt" : count + 1
			},
			success : function(res){
				$('#count'+article_seq).html( count + 1 );
			},
			error : function(e){
				//alert('view error')
			}
		});
		
}
//====================================================================================
// 유저 넘버에서 이름 가져오기
function getname(user_num){
	
	let getname = $('#getname' + user_num).html();
	
	$.ajax({
		type : "post",
		url : "getname",
		data : {
			"user_num" : user_num
			},
			success : function(res){
				$('#getname'+article_seq).html( getname );
			},
			error : function(e){
				alert('view error')
			}
			
		});
}
//======================================================================================

