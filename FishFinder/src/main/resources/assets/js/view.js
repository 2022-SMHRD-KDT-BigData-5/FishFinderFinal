document.getElementsByClassName("comments_delete").addEventListener('click', commDel);
function commDel(){
  if(!confirm("삭제(확인) 또는 취소를 선택해주세요.")){
    alert("취소.");
  }else{
    alert("삭제.");
  }
}