package com.smhrd.web;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.web.client.AsyncRestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.gson.JsonObject;
import com.smhrd.domain.userhistory;
import com.smhrd.mapper.userhistoryMapper;

@Service
public class imageSendService {

	
	
	@Autowired
	userhistoryMapper hm;

	
	 // file 경로와 유저 정보를 DB에 저장
	public userhistory DBUpdate(String fileName, int user_num) {
		
		System.out.println("이미지 db연결");
        userhistory hvo = new userhistory(user_num, fileName);
        hm.historyInsert(hvo);
        int his_seq = hm.last_insert_id();

        userhistory vo = hm.historyPk(his_seq);
       

        
        return vo;
	}
	
	// File을 서버에 저장
	public void ServerUpdate(MultipartFile file, String reaPath, String fileName) {
		System.out.println("이미지 서버 저장");
		 try (
	                // 맥일 경우
	                // FileOutputStream fos = new FileOutputStream("/tmp/" +file.getOriginalFilename());
	               
	        		// 윈도우일 경우
	                FileOutputStream fos = new FileOutputStream(reaPath+fileName);
	                // 파일 저장할 경로 + 파일명을 파라미터로 넣고 fileOutputStream 객체 생성하고
	                InputStream is = file.getInputStream();
				 ) {
	                // file로 부터 inputStream을 가져온다.
	            
	            int readCount = 0;
	            byte[] buffer = new byte[8192];
	            // 파일을 읽을 크기 만큼의 buffer를 생성하고
	            // ( 보통 1024, 2048, 4096, 8192 와 같이 배수 형식으로 버퍼의 크기를 잡는 것이 일반적이다.)
	            
	            while ((readCount = is.read(buffer)) != -1) {
	                //  파일에서 가져온 fileInputStream을 설정한 크기 (1024byte) 만큼 읽고
	                
	                fos.write(buffer, 0, readCount);
	                // 위에서 생성한 fileOutputStream 객체에 출력하기를 반복한다
	            }
	        } catch (Exception ex) {
	            throw new RuntimeException("file Save Error");
	        }
        
	}
	@JsonIgnore
    public void Flask(String Fish_img, String access_Token, int his_seq) {
		//url
		String url = "http://localhost:9000/fish/Flask";
		
		// 비동기 전달
        AsyncRestTemplate restTemplate = new AsyncRestTemplate(); // 비동기 전달
        // 통신 UTF-8 인코딩
        restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName("UTF-8")));
        // httpHeaders
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_JSON);
        
        // Data
        JsonObject jsonObject = new JsonObject();
        
        jsonObject.addProperty("his_seq", his_seq);
        jsonObject.addProperty("Fish_img", Fish_img);
        jsonObject.addProperty("access_Token", access_Token);
        

        HttpEntity<String> logRequest = new HttpEntity<>(jsonObject.toString(), httpHeaders);
        System.out.println(logRequest);
        // post 요청
        restTemplate.postForEntity(url, logRequest, Map.class);
        
//        ResponseEntity<Map> res = (ResponseEntity<Map>) 
//        Map result = res.getBody();
//        int his_seq_res = (Integer) result.get("his_seq");
//        
//        return his_seq_res;

    }
}
