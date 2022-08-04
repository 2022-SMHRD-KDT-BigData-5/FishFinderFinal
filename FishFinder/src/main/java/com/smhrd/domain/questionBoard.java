package com.smhrd.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class questionBoard {

	private int q_seq; // 질답 순번
	private int user_num; // 질문한 회원
	@NonNull
	private String q_content; // 질문 내용
	private Date q_date; // 질문 날짜
	private int q_cnt; // 질문 조회수
	private int q_status; // 질문 진행상태 (0->미답변, 1->답변완료)
	public String user_nick;

}