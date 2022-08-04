package com.smhrd.mapper;

import java.util.List;

import com.smhrd.domain.Community;
import com.smhrd.domain.Paging;
import com.smhrd.domain.Search;

public interface CommunityMapper {

   // 게시판 리스트
   public List<Community> communityList(Community vo);
   // 내가 쓴글 리스트
   public List<Community> communityMyList(Community vo);
   // 게시판 글 쓰기
   public int communityInsert(Community vo);
   // 게시판 선택한 해당 글 보기
   public Community communityContent(int article_seq);
   // 게시판 글 삭제
   public int communityDelete(int article_seq);
   // 게시판 수정
   public int communityUpdate(Community vo);
   // 게시판 조회 수
   public int communityCntUpdate(Community vo);
   // 게시물 총 갯수
   public int countBoard();
   // 댓글수
   public int commCntUp(int article_seq);
   // 신고 글 가져오기
   public List<Community> communityReport();   
   // 검색 결과
   public List<Community> searchList(Search search);
   // 검색 결과 수
   public int getBoardListCnt(Search search);
}