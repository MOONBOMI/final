package com.example.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.BookVO;
import com.example.domain.Criteria;
import com.example.domain.NaverAPI;

import com.example.domain.PageMaker;
import com.example.mapper.BookMapper;
import com.example.mapper.CompanyMapper;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import io.codef.api.EasyCodef;
import io.codef.api.EasyCodefServiceType;

@Controller
public class CompanyController {

	@Autowired
	CompanyMapper mapper;
	
	
	@RequestMapping("company")
	public void company(){
		
	}
	
	
	/** #1.���� �ڵ忡�� ��ü ���� �� Ŭ���̾�Ʈ ���� ���� */
	EasyCodef codef = new EasyCodef();

	



	/** #5.��û �Ķ���� ���� - �� ��ǰ�� �Ķ���͸� ����(https://developer.codef.io/products) */
	@ResponseBody
	@RequestMapping(value="company.json")
	public HashMap<String, Object> parameterMap(String number) throws IOException{
		HashMap<String, Object> parameterMap= new HashMap<String, Object>();
		parameterMap.put("organization", "0004"); // ����ڵ� ����
		
		List<HashMap<String, String>> reqIdentityList = new ArrayList<HashMap<String, String>>();
		HashMap<String, String> reqIdentityMap1 = new HashMap<String, String>();
		reqIdentityMap1.put("reqIdentity", number);
		reqIdentityList.add(reqIdentityMap1);

		parameterMap.put("reqIdentityList", reqIdentityList);
		
		String productUrl = "https://api.codef.io/v1/kr/public/nt/business/status"; // (����)����ڵ�ϻ���(�������ȸ) URL
		String result;
		try {
			result = codef.requestProduct(productUrl, EasyCodefServiceType.DEMO, parameterMap);
			HashMap<String, Object> responseMap = new ObjectMapper().readValue(result, HashMap.class);
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return parameterMap;
		


	}
	

	

	/** #6.�ڵ忡�� ���� ��ȸ ��û - ����Ÿ��(API:����, DEMO:����, SANDBOX:����ڽ�) */
	



	/**	#7.�ڵ忡�� ���� ��� Ȯ��	*/
	
	
}
