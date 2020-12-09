package com.example.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.example.domain.CostVO;
import com.example.mapper_oracle.CostAccountMapper;

@Controller
public class CostAccountController {

	@Autowired
	CostAccountMapper mapper;
	
	@RequestMapping("costaccount.json")
	@ResponseBody
	public List<HashMap<String, Object>> costaccount(){
		List<HashMap<String, Object>> array=mapper.costaccountlist();
		return array;
	}
	
	@RequestMapping(value="costinsert", method=RequestMethod.POST)
	@ResponseBody
	public void costinsert(CostVO vo) {
		if(vo.getCost_day() != null) {
			mapper.costinsert(vo);
		}
	}
	
	@RequestMapping("insert")
	public void insert(){
		
	}
}
