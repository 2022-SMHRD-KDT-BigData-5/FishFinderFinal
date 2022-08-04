package com.smhrd.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.domain.answerInfo;
import com.smhrd.domain.questionBoard;
import com.smhrd.mapper.answerMapper;
import com.smhrd.mapper.questionMapper;

@RestController
public class QnaRestCon {
	
	@Autowired
	questionMapper Qmapper;
	@Autowired
	answerMapper Amapper;
	
	@RequestMapping("/qnaShow")
	public List<questionBoard> qnaborad(){
		
		List<questionBoard> Qlist = Qmapper.questionList();

		return Qlist;
	}
	
	@RequestMapping("/answerShow")
	public answerInfo getanswer(@RequestParam("q_seq")int q_seq){
		
		answerInfo a_vo = Amapper.answerList(q_seq);

		return a_vo;
	}
	
	
	
	
}
