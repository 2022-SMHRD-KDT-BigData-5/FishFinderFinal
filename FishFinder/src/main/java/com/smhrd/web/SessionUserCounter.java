package com.smhrd.web;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import org.springframework.beans.factory.annotation.Autowired;

import com.smhrd.mapper.userCountMapper;

public class SessionUserCounter implements HttpSessionListener {
  
  @Autowired
  userCountMapper mapper;  
  @Autowired
  VisitCount count;  

  @Override
  public void sessionCreated(HttpSessionEvent event) {
	   
	  
	  try {
		  System.out.println("트라이 안1");
		  
		  //count.setTotalCount();
		  System.out.println("트라이 안2");
		  
		  int todayCount = count.getTodayCount();		  
		  int totalCount = count.getTotalCount();
		  
		  HttpSession session = event.getSession();
		  
		  session.setAttribute("totalCount", totalCount);
		  session.setAttribute("todayCount", todayCount);
		  
		  System.out.println("====================카운트 성공==================");
		  }catch(Exception e) {
			  System.out.println("================방문자 카운트 오류=================");
			  e.printStackTrace();
		  }
	  
	  
		  
  }
  	
  
//  private void execute(HttpSessionEvent event) {
//	  
//	  VisitCount count = VisitCount.getInstance();
//	  
//	  try {
//		  	System.out.println("트라이 들어옴");
//		  	// 전체 방문자 증가
//		  	count.setTotalCount();
//		  	System.out.println("전체 방문자");
//		  	// 총 방문자 수 증가
//		  	int totalCount = count.getTotalCount();		  	
//		  	// 오늘 방문자 수 증가
//		  	int todayCount = count.getTodayCount();
//		  	
//		  	HttpSession session = event.getSession();
//		  	// 방문자수 세션
//		  	session.setAttribute("totalCount", totalCount);
//		  	session.setAttribute("todayCount", todayCount);
//		  	System.out.println("====================카운트 성공==================");
//	  } catch(Exception e){
//		  System.out.println("================방문자 카운트 오류=================");
//		  e.printStackTrace();
//	  }
//  }
    

  @Override
  public void sessionDestroyed(HttpSessionEvent event) {
    // 세션이 소멸될 때
  }
  
}