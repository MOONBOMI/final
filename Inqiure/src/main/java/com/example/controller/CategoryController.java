package com.example.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.CategoryVO;
import com.example.domain.CompanyVO;
import com.example.mapper_oracle.CategoryMapper;

@Controller
public class CategoryController {

	@Autowired
	CategoryMapper mapper;
	
	@RequestMapping(value="categoryinsert", method=RequestMethod.POST)
	@ResponseBody
	public void categoryinsert(CategoryVO vo) {
		mapper.categoryinsert(vo);
	}
	
}
