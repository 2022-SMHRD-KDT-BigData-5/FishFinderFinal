package com.smhrd.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.domain.userhistory;
import com.smhrd.mapper.userhistoryMapper;

public class userhistoryCon {
	
	@Autowired
	HttpSession session;
	@Autowired
	userhistoryMapper hm;

	int user_num = (int)session.getAttribute("user_num");
	
	@RequestMapping("/history")
	public String history(Model model) {
		
		List<userhistory> his_list = hm.userhistory(user_num);
		model.addAttribute("his_list",his_list);
		
		return "history";
	}
	
	
	
	@RequestMapping("/historyDel/{his_seq}")
	public String historyDel(@PathVariable("his_seq") int his_seq, Model model) {
		hm.historyDel(his_seq);
			
		return "redirect:/history";
	}
	
	
	
	
}
