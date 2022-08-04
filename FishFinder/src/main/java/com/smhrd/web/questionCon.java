package com.smhrd.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.domain.questionBoard;
import com.smhrd.mapper.questionMapper;

@Controller
public class questionCon {

	@Autowired
	questionMapper qmapper;
	
	// 질문 리스트
	@RequestMapping("/questionview") 
	public String questionList(questionBoard qvo, Model model) {
		List<questionBoard> qlist = qmapper.questionList();		
		model.addAttribute("qlist", qlist);
		return "qna";
	}
	
	// 질문 조회수 수정
	@RequestMapping("/questionViewCount") 
	public int questionViewCount(questionBoard qvo){
		int cnt = qmapper.questionViewCount(qvo);
		return cnt;
	}
	
	// 질문 쓰기로 이동
	@GetMapping("/questionInsert.do")
	public String boardForm() {
		return "qna_write";				
	}
	
	// 질문 작성 후 DB에 넣기
	@PostMapping("/questionInsert.do")
	public String questionInsert(questionBoard qvo, MultipartFile file) {		
		qmapper.questionInsert(qvo);
		return "redirect:/qna.do";
	}
	
	// 선택한 질문로 이동
	@GetMapping("questionView.do/{q_seq}")
	public String questionView(Model model,
			@PathVariable("q_seq") int q_seq) {
		questionBoard qvo = qmapper.questionView(q_seq);	
		model.addAttribute("question", qvo);		
		return "qna";
	}
	
	// 질문 삭제
	@RequestMapping("/questionDelete.do")
	public String questionDelete( @PathVariable("q_seq") int q_seq) {
		System.out.println("번호 : " + q_seq);
		qmapper.questionDelete(q_seq);		
		return "redirect:/qna.do";
	}
	
	// 문의 수정 페이지로 이동
	@RequestMapping("/questionGoUpdate.do")
	public String questionGoUpdate(Model model, int q_seq) {		
		questionBoard qvo = qmapper.questionView(q_seq);
		model.addAttribute("question", qvo);
		return "questionUpdate";
	}
	
	// 문의 수정 후 DB에 업데이트
	@PostMapping("/questionUpdate.do")
	public String questionUpdate(questionBoard qvo) {		
		qmapper.questionUpdate(qvo);
		return "redirect:/qna.do";
	}
	
	// 진행상태 업데이트
	@RequestMapping("/questionStatus.do") 
	public int questionStatusUpdate(questionBoard qvo){
		int cnt = qmapper.questionStatusUpdate(qvo);
		return cnt;
	}
	
	
}
