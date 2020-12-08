package com.example.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.example.domain.CompanyVO;
import com.example.mapper_oracle.CompanyMapper;
@Controller
public class CompanyController {
	@Autowired
	CompanyMapper mapper;
	
//	@RequestMapping("list")
//	public String list(Model model, HttpSession session, HttpServletRequest request){
//		Cookie cookie=WebUtils.getCookie(request, "uid");
//		if(cookie != null) {
//			session.setAttribute("uid", cookie.getValue());
//		}
//		String dest=(String)session.getAttribute("dest");
//		if(session.getAttribute("dest") != null) {
//			session.removeAttribute("dest");
//			return "redirect:"+dest;
//		}
//		model.addAttribute("list", mapper.list());
//		return "list";
//	}
	
//	@ResponseBody
//	@RequestMapping(value="login", method=RequestMethod.POST)
//	public void loginPost(Model model, CompanyVO vo, HttpSession session,HttpServletResponse response){
//		session.setAttribute("number", vo.getCompanycode());//세션저장
//	}
}
