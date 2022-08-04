package com.smhrd.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data //@Data이거 치면 기본 매서드 다 만들어줌 굳
@AllArgsConstructor // 모든 필드 생성자
@NoArgsConstructor // 기본 생성자
public class userhistory {
	
	private int his_seq;
	private int user_num;
	private String fish_img;
	private String result;
	private int accuracy;
	private String result_memo;
	private String search_date;
	
	public userhistory(int user_num, String fish_img) {
		super();
		this.user_num = user_num;
		this.fish_img = fish_img;
	}
	

}
