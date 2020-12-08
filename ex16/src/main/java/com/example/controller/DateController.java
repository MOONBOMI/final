package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper_oracle.DateMapper;
@Controller
public class DateController {

	@Autowired
	DateMapper mapper;
	
	@RequestMapping("cal")
	public void cal() {
		
	}
	
	@RequestMapping("cal.json")
	@ResponseBody
	public HashMap<String, Object> datelist() {
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", mapper.datelist());
		return map;
	}
}
