package com.smhrd.mapper;

import java.util.List;

import com.smhrd.domain.answerInfo;

public interface answerMapper {
	
	// 답변 리스트
	public answerInfo answerList(int q_seq);
	// 답변 하기
	public int answerInsert(answerInfo avo);
	// 답변 보기
	public answerInfo answerView(int a_seq);
	// 답변 수정
	public int answerUpdate(answerInfo avo);
	// 답변이 되면 q보드의 답변의 상태가 변경되야함
	// 답변 삭제
	public int answerDelete(int a_seq);
}
