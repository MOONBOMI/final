package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.LocalVO;
import com.example.mapper.LocalMapper;

@Controller
public class KakaoController {
	@Autowired
	LocalMapper mapper;
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	@ResponseBody
	public void insert(LocalVO vo) {
		mapper.insert(vo);
	}
	
	@RequestMapping("local")
	public void local(){
		
	}
}
