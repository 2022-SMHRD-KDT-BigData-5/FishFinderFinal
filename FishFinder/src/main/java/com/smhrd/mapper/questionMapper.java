package com.smhrd.mapper;

import java.util.List;

import com.smhrd.domain.questionBoard;

public interface questionMapper {
	
	// 질문 리스트
	public List<questionBoard> questionList();
	// 질문 하기
	public int questionInsert(questionBoard qvo);
	// 질문 보기
	public questionBoard questionView(int q_seq);
	// 질문 수정
	public int questionUpdate(questionBoard qvo);
	// 질문 조회수 변경
	public int questionViewCount(questionBoard qvo);
	// 질문 진행상태 변경
	public int questionStatusUpdate(questionBoard qvo);
	// 질문 삭제
	public int questionDelete(int q_seq);
	// 질문 수
	public int questioncount();
	// 미응답 질문 리스트
	public List<questionBoard> questionNoAnswer();
	
	
}
