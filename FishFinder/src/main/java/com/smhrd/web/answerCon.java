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

import com.smhrd.domain.answerInfo;
import com.smhrd.domain.questionBoard;
import com.smhrd.mapper.answerMapper;

@Controller
public class answerCon {

	@Autowired
	answerMapper amapper;
	
	// 답변 리스트
	@RequestMapping("/answerview") 
	public String answerList(answerInfo avo, Model model) {
		answerInfo alist = amapper.answerList(avo.getA_seq());		
		model.addAttribute("alist", alist);
		return "qna";
	}
	
	// 선택한 질문의 답변 가져오기 이동
	@GetMapping("answerView.do/{q_seq}")
	public String questionView(Model model,
			@PathVariable("q_seq") int q_seq) {
		answerInfo avo = amapper.answerView(q_seq);	
		model.addAttribute("answer", avo);		
		return "qna";
	}
	
	// 답변 작성으로 이동
	@GetMapping("/answerInsert.do")
	public String boardForm() {
		return "qna_write";				
	}	
	
	// 답변 작성 후 DB에 넣기
	@PostMapping("/answerInsert.do")
	public String answerInsert(answerInfo avo, MultipartFile file) {		
		amapper.answerInsert(avo);
		return "redirect:/qna.do";
	}
	
	// 답변 삭제
	@RequestMapping("/answerDelete.do")
	public String answerDelete( @PathVariable("a_seq") int a_seq) {
		System.out.println("번호 : " + a_seq);
		amapper.answerDelete(a_seq);		
		return "redirect:/qna.do";
	}
	
	// 답변 수정 페이지로 이동
	@RequestMapping("/answerGoUpdate.do")
	public String answerGoUpdate(Model model, int a_seq) {		
		answerInfo avo = amapper.answerView(a_seq);
		model.addAttribute("question", avo);
		return "answerUpdate";
	}
		
	// 답변 수정 후 DB에 업데이트
	@PostMapping("/answerUpdate.do")
	public String answerUpdate(answerInfo avo) {		
		amapper.answerUpdate(avo);
		return "redirect:/qna.do";
	}
}
