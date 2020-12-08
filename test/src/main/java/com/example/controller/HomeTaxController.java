//package com.example.controller;
//
//import java.io.IOException;
//import java.lang.reflect.Method;
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//import java.util.logging.Logger;
//
//import javax.xml.ws.Response;
//
//import org.jsoup.Jsoup;
//import org.slf4j.LoggerFactory;
//import org.springframework.util.StringUtils;
//
//
//public class HomeTaxController {
//
//	
//
//	//홈택스에서 사업자 과세유형 조회하여 반환
//	public List<Map<String, String>> listJsoup(List<String> number){
//		List<Map<String, String>> list=new ArrayList<>();
//		for(String oknumber :number) {
//			
//		}
//		return list;
//	}
//	
//	public Map<String, String> getlistNumber(String oknumber) {
//		if(null==oknumber || "".equals(oknumber)) {
//			throw new RuntimeException("조회할 사업자등록번호를 입력해주세요.");
//		}
//		String fmt=StringUtils.replace(oknumber, "-", "");
//		if(fmt.length()!=10) {
//			throw new RuntimeException("조회할 사업자등록번호를 올바로 입력해주세요.");
//		}
//		String fmtCode=fmt.substring(3,5);
//		String url="https://teht.hometax.go.kr/wqAction.do?actionId=ATTABZAA001R08&screenId=UTEABAAA13&popupYn=false&realScreenId=";
//		
//		Map<String, String> headers=new HashMap<>();
//		headers.put("Accept", "application/xml; charset=UTF-8"); 
//		headers.put("Accept-Encoding", "gzip, deflate, br"); 
//		headers.put("Accept-Language", "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7"); 
//		headers.put("Connection", "keep-alive"); 
//		headers.put("Content-Length", "257"); 
//		headers.put("Content-Type", "application/xml; charset=UTF-8"); 
//		headers.put("Host", "teht.hometax.go.kr"); 
//		headers.put("Origin", "https://teht.hometax.go.kr"); 
//		headers.put("Referer", "https://teht.hometax.go.kr/websquare/websquare.html?w2xPath=/ui/ab/a/a/UTEABAAA13.xml"); 
//		headers.put("Sec-Fetch-Mode", "cors"); 
//		headers.put("Sec-Fetch-Site", "same-origin"); 
//		headers.put("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36");
//		
//		final String CRLF = "\n";
//		
//		StringBuffer sb = new StringBuffer(); 
//		sb.append("<map id=\"ATTABZAA001R08\">" + CRLF); 
//		sb.append(" <pubcUserNo/>" + CRLF); 
//		sb.append(" <mobYn>N</mobYn>" + CRLF); 
//		sb.append(" <inqrTrgtClCd>1</inqrTrgtClCd>" + CRLF); 
//		sb.append(" <txprDscmNo>" + fmt + "</txprDscmNo>" + CRLF); 
//		sb.append(" <dongCode>" + fmtCode + "</dongCode>" + CRLF); 
//		sb.append(" <psbSearch>Y</psbSearch>" + CRLF); 
//		sb.append(" <map id=\"userReqInfoVO\"/>" + CRLF); 
//		sb.append("</map>" + CRLF); 
//		
//		String body = sb.toString();
//		
//		Map<String, String> map = new HashMap<>(); 
//		try { 
//			Response res = Jsoup.connect(url) 
//				.headers(headers) 
//				.requestBody(body) 
//				.timeout(3000) 
//				.method(Method.POST) 
//				.execute(); 
//			if (logger.isDebugEnabled()) { 
//				logger.debug(res.body()); 
//			}
//
//			org.dom4j.Document document = DocumentHelper.parseText(res.body()); 
//			String trtCntn = StringUtils.nvl(document.valueOf("//map/trtCntn"), ""); 
//			
//		map.put(oknumber, trtCntn); 
//		} catch (IOException e) { 
//			logger.error("Jsoup 오류", e); 
//		} catch (DocumentException e) {
//			logger.error("Document parse 오류", e);
//		} 
//		
//		return map;
//
//	}
//
//}
