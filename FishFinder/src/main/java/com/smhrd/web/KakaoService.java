package com.smhrd.web;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.smhrd.domain.userinfo;
import com.smhrd.mapper.userinfoMapper;


@Service
public class KakaoService {
	
	@Autowired
	userinfoMapper um;
	
	private static class KakaoService_Singieton{
		private static final KakaoService instance = new KakaoService();
	}

	public static KakaoService getInstance() {

		return KakaoService_Singieton.instance;
	}

	
	//토큰 발급
		public String getAccessToken (String authorize_code) {
			String access_Token = "";
			String refresh_Token = "";
			String reqURL = "https://kauth.kakao.com/oauth/token";

			try {
				URL url = new URL(reqURL);
	            
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				
				// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
				conn.setRequestMethod("POST");
				conn.setDoOutput(true);
				
				// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
				BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
				StringBuilder sb = new StringBuilder();
				sb.append("grant_type=authorization_code");
	            
				sb.append("&client_id=594ae1b3ed146deb6d74549625ebeb66"); //REST API 키
				sb.append("&redirect_uri=http://172.30.1.33:8083/fish/login"); // Redirect URI 주소
	            
				sb.append("&code=" + authorize_code);
				bw.write(sb.toString());
				bw.flush();
	            
				// 결과 코드가 200이라면 성공
				int responseCode = conn.getResponseCode();
				System.out.println("responseCode : " + responseCode);
	            
				// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String line = "";
				String result = "";
	            
				while ((line = br.readLine()) != null) {
					result += line;
				}
				System.out.println("response body : " + result);
	            
				// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(result);
	            
				access_Token = element.getAsJsonObject().get("access_token").getAsString();
				refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
	            
				System.out.println("access_token : " + access_Token);
				System.out.println("refresh_token : " + refresh_Token);
	            
				br.close();
				bw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}		
			return access_Token;
		}
	
		
		
		//유저 정보
		public userinfo getUserInfo(String access_Token) {

			userinfo vo = new userinfo();
			String id = null;
			String reqURL = "https://kapi.kakao.com/v2/user/me";
			try {
				URL url = new URL(reqURL);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("GET");

				// 요청에 필요한 Header에 포함될 내용
				conn.setRequestProperty("Authorization", "Bearer " + access_Token);

				int responseCode = conn.getResponseCode();
				System.out.println("responseCode : " + responseCode);

				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

				String line = "";
				String result = "";

				while ((line = br.readLine()) != null) {
					result += line;
				}
				System.out.println("response body : " + result);

				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(result);

				JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
				JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
				id = element.getAsJsonObject().get("id").getAsString();
				
				String nickname = properties.getAsJsonObject().get("nickname").getAsString();


				System.out.println("뽑아낸 닉네임 : " + nickname);
				System.out.println("뽑아낸 openID : " + id);
				
				vo.setKakao_name(nickname);
				vo.setOpenID(id);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			System.out.println("DB시작");
			// catch 아래 코드 추가.
			userinfo result = um.KakaoLogin(id);
			// 위 코드는 먼저 정보가 저장되있는지 확인하는 코드.
			System.out.println("S:" + result);
			if(result==null) {
			// result가 null이면 정보가 저장이 안되있는거므로 정보를 저장.
				um.KakaoJoin(vo);
				// 위 코드가 정보를 저장하기 위해 Repository로 보내는 코드임.			
				return um.KakaoUser(vo);
				// 위 코드는 정보 저장 후 컨트롤러에 정보를 보내는 코드임.
				//  result를 리턴으로 보내면 null이 리턴되므로 위 코드를 사용.
			} else {
				return result;
				// 정보가 이미 있기 때문에 result를 리턴함.
			}
			
		}
		
		public StringBuffer HttpPostConnection(String apiURL, Map<String, String> params) throws IOException {
		      URL url = new URL(apiURL);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("POST");
		      con.setDoOutput(true);
		      
		      //만약에 파라메터에 Authorization가 있다면 헤더로 추가 후 params에서 제거
		      if(params.get("Authorization") != null) {
		    	  con.setRequestProperty("Authorization", params.get("Authorization"));
		    	  params.remove("Authorization");
		      }
		      
		      // post request
		      // 해당 string은 UTF-8로 encode 후 MS949로 재 encode를 수행한 값
		      BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(con.getOutputStream()));
	          StringBuilder sb = new StringBuilder();
	          
	          int amp = 0;
	          for( String key : params.keySet() ){
	        	  //2번째 파라메터부터는 구분자 &가 있어야한다.
	        	  if(amp >= 1) sb.append("&"); amp+=1; 
	        	  
	        	  sb.append(key+params.get(key));
	        	     
	          }
	          System.out.println("파라메터 : " + sb.toString());
	          
	          bw.write(sb.toString());
	          bw.flush();
		      bw.close();
	          
		      return responseHttp(con);
		}
		
		//서버에 요청하는 메소드
		public StringBuffer responseHttp(HttpURLConnection con) throws IOException {
			StringBuffer response = new StringBuffer();
			
		    int responseCode = con.getResponseCode();
		    BufferedReader br;
		    if(responseCode==200) { // 정상 호출
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		    } else {  // 에러 발생
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		    }
		      
		    String inputLine;
		    while ((inputLine = br.readLine()) != null) {
		        response.append(inputLine);
		    }
		    br.close();
		    
		    return response;
		}


		
		

	
	
	
	
}
