package com.smhrd.mapper;

import java.util.List;

import com.smhrd.domain.userhistory;

public interface userhistoryMapper {

	
	public List<userhistory> userhistory(int user_num);
	
	public int historyInsert(userhistory vo);
	
	public int last_insert_id();
	
	public userhistory historyPk(int his_seq);
	
	public int historyDel(int his_seq);
	
	public int userhistorycount();
	
	public userhistory userhistoryname(String fish_img);
	
}
