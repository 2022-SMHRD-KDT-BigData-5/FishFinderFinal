package com.smhrd.web;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.domain.userhistory;

@RestController
public class uploadRestCon {
	
	@Autowired // 메모리에 있는 객체 넣기
	HttpSession session;
	@Autowired
	imageSendService is;
	
	@PostMapping("/upload")
    public List<String> upload(@RequestParam("file") MultipartFile file,@RequestParam("file2") MultipartFile file2, Model model) {
		
		if(file.getOriginalFilename().equals("")) {
			file = file2;
			System.out.println("if 파일 이름 : " + file.getOriginalFilename());
		}
 
		int user_num = (Integer)session.getAttribute("user_num");
		String kakaoN = (String)session.getAttribute("kakaoN");
		String access_Token = (String)session.getAttribute("access_Token");
		
        System.out.println("파일 이름 : " + file.getOriginalFilename());
        System.out.println("파일 크기 : " + file.getSize());
        System.out.println("사용자 번호 : " + user_num);

     // 실제 물리경로
        String Path = session.getServletContext().getRealPath("/resources/image/");
        System.out.println(Path);
        String reaPath = "C:\\Users\\smhrd\\git\\FishFinder\\FishFinder\\src\\main\\webapp\\resources\\image\\"; 
        
        LocalDate date = LocalDate.now();
        LocalTime time = LocalTime.now();
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH-mm-ss");
	    String Time = time.format(formatter);
        String now = kakaoN + "_" + date+"_"+Time;

        String fileName = now + "_" +file.getOriginalFilename();
        

        // File을 서버에 저장
        is.ServerUpdate(file, Path, fileName);
        is.ServerUpdate(file, reaPath, fileName);
        // 프로젝트에 업로드된 이미지 프로젝트에 바로 적용하는 방법이 있는 주소
        // 안하면 바로 업데이트 안돼서 기능 안댐
        //https://record-than-remember.tistory.com/entry/%EC%9D%B4%ED%81%B4%EB%A6%BD%EC%8A%A4-%ED%8C%8C%EC%9D%BC-%EC%97%85%EB%A1%9C%EB%93%9C-%ED%9B%84%EC%97%90-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%EC%9E%90%EB%8F%99-refresh
        
        
        // file 경로와 유저 정보를 DB에 저장
        userhistory vo = is.DBUpdate(fileName, user_num);
        
        
        // 플라스크 서버 통신 (이미지 경로, 사용자 토큰)
        List<String> list = new ArrayList<String>();
        String his_seq= Integer.toString(vo.getHis_seq());
        list.add(fileName);
        list.add(his_seq);
        list.add(access_Token);
        
        
        return list;
    }
	
	
}
