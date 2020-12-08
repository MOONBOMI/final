package com.example.controller;

import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.KakaoAPI;

@Controller
public class KakaoController {

	@ResponseBody
	@RequestMapping(value="local.json")//데이터 생성
	public String localJson(String query)throws Exception{
		String text=URLEncoder.encode(query, "UTF-8");
		String apiURL="https://dapi.kakao.com/v2/local/search/keyword.json?query="+text;
		String result=KakaoAPI.search(apiURL);
		return result;
	}
	
	
	@RequestMapping("local") //데이터 출력 페이지
	public void local(){
		
	}
}
