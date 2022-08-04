package com.smhrd.domain;

import java.sql.Date;

import javax.xml.soap.Text;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
public class answerInfo {
	
	private int a_seq;
	private int q_seq;
	@NonNull
	private String a_content;
	private String a_file;
	private Date a_date;
	private int answer_num;
	public String user_nick;
}
