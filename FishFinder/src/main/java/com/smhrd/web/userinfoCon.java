package com.smhrd.web;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.domain.fishinfo;
import com.smhrd.domain.userhistory;
import com.smhrd.domain.userinfo;
import com.smhrd.mapper.fishinfoMapper;
import com.smhrd.mapper.userhistoryMapper;
import com.smhrd.mapper.userinfoMapper;

@Controller //어노테이션,, 이 파일이 POJO라는것을 알 수 있도록 지정
public class userinfoCon {

	// DI(dependency injection), 의존성 작업
	@Autowired // 메모리에 있는 객체 넣기
	HttpSession session;
	@Autowired
	userinfoMapper um;
	@Autowired
	KakaoService ks;
	@Autowired
	userhistoryMapper hm;
	@Autowired
	imageSendService is;
	@Autowired
	fishinfoMapper fm;
	
	@RequestMapping("/")
	public String test() {
		

		return "join";
	}

	@RequestMapping("/board")
	public String board() {
		

		return "board";
	}
	
	@RequestMapping("/index")
	public String index() {
		

		return "index";
	}
	@RequestMapping("/listPaging")
	public String listPaging() {
		

		return "listPaging";
	}
	@RequestMapping("/qna_write")
	public String qna_write() {
		

		return "qna_write";
	}
	@RequestMapping("/qna")
	public String qna() {
		

		return "qna";
	}

	@RequestMapping("/viewList")
	public String viewList() {
		

		return "viewList";
	}
	@RequestMapping("/writer")
	public String writer() {
		

		return "writer";
	}




	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String testloginsuc(@RequestParam(value = "code", required = false) String code,Model model) throws Exception {
		
		if(session.getAttribute("access_Token") !=null) {
			
			
		}else {
		// 코드 확인
		System.out.println("#########" + code);
		
		// 토큰 확인
		String access_Token = ks.getAccessToken(code);
		System.out.println("###access_Token#### : " + access_Token);
		
		// 사용자 정보 확인
		userinfo userInfo = ks.getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.getKakao_name());
		System.out.println("###email#### : " + userInfo.getKakao_email());
		
		// session객체에 담긴 정보를 초기화
		//session.invalidate();
		// 닉네임과 이메일, 토큰 session객체
		session.setAttribute("user_num", userInfo.getUser_num());
		session.setAttribute("kakaoN", userInfo.getKakao_name());
		session.setAttribute("user_type", userInfo.getUser_type());
		session.setAttribute("access_Token", access_Token);
		}
		
		// jsp에서 ${sessionScope.kakaoN}
		
		return "index";
    }
	
	@RequestMapping(value="/logout")
	public String access(HttpSession session) throws IOException {
		
		KakaoService conn = KakaoService.getInstance();
		String access_Token = (String)session.getAttribute("access_Token");
		
		String access_token = (String)session.getAttribute("access_token");
		Map<String, String> map = new HashMap<String, String>();
		map.put("Authorization", "Bearer "+ access_Token);
		
		String result = conn.HttpPostConnection("https://kapi.kakao.com/v1/user/logout", map).toString();
		System.out.println(result);
		
		return "redirect:http://172.30.1.33:8083/fish/";
	}
	
	
	
	// AI분석 후, 히스토리에서 접근
	/*
	 * @RequestMapping("/result/{fish_img}") public String
	 * result(@RequestParam("fish_img") String fish_img, Model model) { userhistory
	 * his_vo = hm.userhistoryname(fish_img); model.addAttribute("his_vo",his_vo);
	 * 
	 * //fishinfo fish_vo = fm.fishList(his_vo.getResult());
	 * //model.addAttribute("fish_vo",fish_vo);
	 * 
	 * //java.io.File file = new java.io.File( his_vo.getFish_img());
	 * 
	 * 
	 * 
	 * return "result"; }
	 */
	
	@RequestMapping("/result")
	public String result(@RequestParam("fish_img") String fish_img,Model model) {

		userhistory his_vo = hm.userhistoryname(fish_img);
		model.addAttribute("his_vo",his_vo);
		
		
		//fishinfo fish_vo = fm.fishList(his_vo.getResult());
		//model.addAttribute("fish_vo",fish_vo);
		
		//java.io.File file = new java.io.File( his_vo.getFish_img());

		
		
		return "result";
	}
	
	@RequestMapping("/getname")
	public String usernameGet(@PathVariable("user_num") int user_num, Model model) {
		String getname = um.usernameGet(user_num);
		model.addAttribute("getname",getname);
		return getname;
	}
	
	//내 히스토리 보기
	@RequestMapping("/history")
	public String history(Model model) {
		int user_num = (int) session.getAttribute("user_num");
		List<userhistory> his_list = hm.userhistory(user_num);
		model.addAttribute("his_list", his_list);
		return "history";
	}
	
	
}





