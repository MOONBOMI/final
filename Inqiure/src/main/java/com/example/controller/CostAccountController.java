package com.example.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.CostVO;
import com.example.domain.DepositVO;
import com.example.domain.LoansVO;
import com.example.domain.SalesVO;
import com.example.mapper_oracle.CategoryMapper;
import com.example.mapper_oracle.CostAccountMapper;
import com.example.mapper_oracle.DepositAccountMapper;
import com.example.mapper_oracle.LoansAccountMapper;
import com.example.mapper_oracle.SalesMapper;
import com.example.service.DepositService;

@Controller
public class CostAccountController {
	
	@Autowired
	CategoryMapper mapper;
	@Autowired
	CostAccountMapper cmapper;
	@Autowired
	DepositAccountMapper dmapper;
	@Autowired
	LoansAccountMapper lmapper;
	@Autowired
	SalesMapper smapper;
	@Autowired
	DepositService service;
	
	
	@RequestMapping("costaccount.json")
	@ResponseBody
	public List<HashMap<String, Object>> costaccount(){
		List<HashMap<String, Object>> array=cmapper.costaccountlist();
		return array;
	}
	
	@RequestMapping(value="costinsert", method=RequestMethod.POST)
	@ResponseBody
	public void costinsert(CostVO vo) {
		if(vo.getCost_day() != null) {
			cmapper.costinsert(vo);
		}
	}
	@RequestMapping("depositaccountlist.json")
	@ResponseBody
	public List<HashMap<String, Object>> depositlist(){
		List<HashMap<String, Object>> array=dmapper.depositaccountlist();
		return array;
	}
	
	@RequestMapping("loansaccountlist.json")
	@ResponseBody
	public List<HashMap<String, Object>> loanslist(){
		List<HashMap<String, Object>> array=lmapper.loansaccountlist();
		return array;
	}
	
	@RequestMapping(value="depositinsert", method=RequestMethod.POST)
	public void depositinsert(DepositVO vo){
		service.depositinsert(vo);
	}
	
	@RequestMapping(value="loansinsert", method=RequestMethod.POST)
	public void loansinsert(LoansVO vo){
		lmapper.loansinsert(vo);
	}
	
	@RequestMapping("categorylist.json")
	@ResponseBody
	public List<HashMap<String, Object>> categorylist() {
		List<HashMap<String, Object>> array = mapper.categorylist();
		return array;
	}
	
	@RequestMapping("lcategorylist.json")
	@ResponseBody
	public List<HashMap<String, Object>> lcategorylist() {
		List<HashMap<String, Object>> array = mapper.lcategorylist();
		return array;
	}
	
	@RequestMapping(value="salesinsert", method=RequestMethod.POST)
	public void salesinsert(SalesVO vo){
		smapper.salesinsert(vo);
	}
	
	
	@RequestMapping("category")
	public void category() {
		
	}
	
	@RequestMapping("insert")
	public void insert(){
		
	}
}
