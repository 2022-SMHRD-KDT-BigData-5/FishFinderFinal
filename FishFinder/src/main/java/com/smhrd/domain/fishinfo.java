package com.smhrd.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //@Data이거 치면 기본 매서드 다 만들어줌 굳
@AllArgsConstructor // 모든 필드 생성자
@NoArgsConstructor // 기본 생성자
public class fishinfo {

	private int fish_seq;
	private String fish_name;
	private String cook_feature;
	private String fish_img;
	private String fish_kind;
	private String fish_spec;
	private String fish_season;
	private int admin_num;
	
	
	
	
	
}
