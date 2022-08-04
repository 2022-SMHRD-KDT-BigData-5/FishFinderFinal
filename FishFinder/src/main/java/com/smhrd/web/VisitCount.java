package com.smhrd.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smhrd.domain.Visit;
import com.smhrd.mapper.userCountMapper;

@Service
public class VisitCount {
	
	@Autowired
	userCountMapper mapper;
	
	// 날짜값 추가 
	public void setTotalCount() {
		System.out.println("셋 토탈 카운트");
		mapper.setTotalCount();
		System.out.println("셋 토탈 카운트1");
	}

	// 총 방문자 수
	public int getTotalCount() {
		int totalCount = mapper.getTotalCount();
		System.out.println("총 방문자 수" + totalCount);
		return totalCount;
	}
	
	// 오늘 방문자 수
	public int getTodayCount() {
		int todayCount = mapper.getTodayCount();
		System.out.println("오늘 방문자 수" + todayCount);
		return todayCount;
	}
	
}
