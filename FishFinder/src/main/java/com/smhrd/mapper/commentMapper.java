package com.smhrd.mapper;

import java.util.List;

import com.smhrd.domain.Comment;
import com.smhrd.domain.Community;

public interface commentMapper {
   
   // 댓글 쓰기
   public void commentInsert(Comment cvo);
   // 해당 게시물의 댓글 보기 -> CommunitCon에 같이 씀
   public List<Comment> commentList(int article_seq);
   // 선택한 댓글 보기
   public Comment CommentContent(int comment_seq);
   // 댓글 수
   public int commentCount(Community article_seq);
   // 댓글 삭제
   public int commentDelete(int comment_seq);
   // 특정 글 댓글  모두 삭제
   public int commentComDelete(int article_seq);
   // 게시글 번호 가져오기
   public int commentComSeq(int comment_seq);
   // 댓글 수정
   public int commentUpdate(Comment cvo);

}