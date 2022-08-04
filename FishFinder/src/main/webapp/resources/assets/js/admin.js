//====================================================================================
// 내용 보기
function open(article_seq){	
		
		location.href='/fish/viewContentAdmin/' + article_seq;
		
}
//====================================================================================
// 댓글 수정
function commUp(comment_seq){
	var msg = confirm("댓글을 수정합니다.");
	if(msg == true){
		updateCmt(comment_seq);
	}else{
		return false;
	}
}

function updateCmt(comment_seq){
	
	var comment_seq = "comment_seq=" + comment_seq;
	
	$.ajax({
		type : "post",
		url : "commUp",
		data : {
			comment_seq : comment_seq
		},
		success : function(res){
			alert('댓글이 수정 되었습니다.')
		},
		error : function(e){
			alert('댓글 수정에 실패했습니다.')
		}
	});
	
}

// 댓글 삭제
function commDel(comment_seq){
	var msg = confirm("댓글을 삭제합니다.");
	if(msg == true){
		deleteCmt(comment_seq);
	}else{
		return false;
	}
}

function deleteCmt(comment_seq){
	
	var comment_seq = "comment_seq=" + comment_seq;
	
	$.ajax({
		type : "post",
		url : "commDel",
		data : {
			comment_seq : comment_seq
		},
		success : function(res){
			alert('댓글이 삭제 되었습니다.')
		},
		error : function(e){
			alert('댓글 삭제에 실패했습니다.')
		}
	});
	
}
//====================================================================================
//목록가기
function goAdminList(){
	location.href = '/fish/adminCommunity';
}
		
// 관리자 페이지에서 삭제하기
function goDeleteAdmin(article_seq){
	console.log(article_seq);
	location.href = '/fish/viewDelAdmin/'+ article_seq;
}

// 관리자 페이지에서 삭제하기
function goDeleteAdminCom(article_seq){
	var msg = confirm("삭제하겠습니까?");
	
	if(msg == true){
		location.href = '/fish/viewDelAdminCom/'+ article_seq;
	}else{
		return false;
	}
	
}
		
// 수정하기
function goUpdate(article_seq){		
	location.href = '/fish/viewGoUp?article_seq=' + article_seq;
}
//====================================================================================
// 댓글수
function commCnt(article_seq){	

		$.ajax({
			type : "post",
			url : "commCnt",
			dataType : "json",
			data : {
				"article_seq" : article_seq,
			},
			success : function(res){
				log.console('댓글수 성공');
			},
			error : function(e){
				log.console('댓글수 실패');
			}
		});
		
}