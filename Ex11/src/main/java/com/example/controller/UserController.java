package com.example.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.example.domain.UserVO;
import com.example.mapper.UserMapper;

@Controller
public class UserController {

	@Autowired
	UserMapper mapper;
	
	@RequestMapping("login")
	public void login() {
		
	}
	
	@ResponseBody
	@RequestMapping(value="login", method=RequestMethod.POST)
	public int loginPost(UserVO vo, HttpSession session, boolean chklogin, HttpServletResponse response){
		
		UserVO resultVO=mapper.login(vo.getUid());
		if(resultVO==null) {
			return 0;
		} else if (resultVO.getUpw().equals(vo.getUpw())){
			session.setAttribute("uid", vo.getUid());//技记历厘
			if(chklogin){
				Cookie cookie=new Cookie("uid",vo.getUid());//捻虐历厘
				cookie.setPath("/");
				cookie.setMaxAge(60*60*24*7);
				response.addCookie(cookie);
			}
			return 1;
		} 
		return 2;
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response){
		session.invalidate();//技记昏力
		//捻虐昏力
		Cookie cookie=WebUtils.getCookie(request, "uid");
		if(cookie != null) {
			cookie.setPath("/");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		return "redirect:list";
	}
}
