package com.smhrd.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data //@Data이거 치면 기본 매서드 다 만들어줌 굳
@AllArgsConstructor // 모든 필드 생성자
@NoArgsConstructor // 기본 생성자
public class userinfo {
	
	private int user_num;
	private String kakao_name;
	private String kakao_email;
	private String user_joindate;
	private String user_type;
	private String openID;
	
	public userinfo(String kakao_email) {
		super();
		this.kakao_email = kakao_email;
	}

	public userinfo(String kakao_name, String kakao_email, String openID) {
		super();
		this.kakao_name = kakao_name;
		this.kakao_email = kakao_email;
		this.openID = openID;
	}
	




}
