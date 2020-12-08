package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.domain.LcategoryVO;
import com.example.mapper_oracle.LcategoryMapper;

@Controller
public class TestController {

	@Autowired
	LcategoryMapper mapper;
	
	@RequestMapping("insert")
	public void insert(){
		
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public void insertpost(LcategoryVO vo){
		mapper.insert(vo);
	}
	
	@RequestMapping("cal")
	public void cal(){
		
	}
	
}
