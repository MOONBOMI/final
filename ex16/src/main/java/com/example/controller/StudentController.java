package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper_oracle.StudentMapper;

@Controller
public class StudentController {

	@Autowired
	StudentMapper mapper;
	
	@RequestMapping("list.json")
	@ResponseBody
	public HashMap<String, Object> list(Criteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		cri.setPerPageNum(5);
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(51);
		map.put("list", mapper.list(cri));
		map.put("pm", pm);
		return map;
	}
	
	@RequestMapping("list")
	public void list() {
		
	}

}
