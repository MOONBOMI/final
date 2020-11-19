package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper.BoardMapper;
import com.example.service.BoardService;

@Controller
@RequestMapping("Board")
public class BoardController {
	@Autowired
	BoardMapper mapper;
	
	@Autowired
	BoardService service;
	
	@RequestMapping("list")
	public void list(Criteria cri, Model model){
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.totalCount());
		model.addAttribute("pm",pm);
		model.addAttribute("list",mapper.list(cri));
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert(BoardVO vo){
		service.insert(vo);
		return "redirect:list";
	}
	
	@RequestMapping("insert")
	public void insert(){
		
	}
	
	@RequestMapping("read")
	public void read(int bno, Model model){
		model.addAttribute("vo",mapper.read(bno));
	}
	
	@ResponseBody
	@RequestMapping("getAttach.json")
	public List<String> getAttach(int bno) {
		return mapper.getAttach(bno);
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(BoardVO vo){
		service.update(vo);
		return "redirect:list";
	}
}
