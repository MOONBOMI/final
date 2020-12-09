package com.example.controller;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.DepositAccountVO;
import com.example.domain.LoansAccountVO;
import com.example.mapper_oracle.DepositAccountMapper;
import com.example.mapper_oracle.LoansAccountMapper;

@Controller
public class DepositAccountController {

	@Autowired
	DepositAccountMapper mapper;
	
	@Autowired
	LoansAccountMapper lmapper;
	
	@RequestMapping(value="depositaccountinsert", method=RequestMethod.POST)
	@ResponseBody
	public void depositaccountinsert(DepositAccountVO vo){
		mapper.depositaccountinsert(vo);
	}
	
	@RequestMapping(value="loansaccountinsert", method=RequestMethod.POST)
	@ResponseBody
	public void loansaccountinsert(LoansAccountVO lvo){
		lmapper.loansaccountinsert(lvo);
	}
	
	@RequestMapping("depositaccountlist.json")
	@ResponseBody
	public List<HashMap<String, Object>> depositlist(){
		List<HashMap<String, Object>> array=mapper.depositaccountlist();
		return array;
	}
	
	@RequestMapping("loansaccountlist.json")
	@ResponseBody
	public List<HashMap<String, Object>> loanslist(){
		List<HashMap<String, Object>> array=lmapper.loansaccountlist();
		return array;
	}
	
	@RequestMapping("depositaccount")
	public void depositaccount(){
		
	}
	@RequestMapping("insert")
	public void insert(){
		
	}
}
	
