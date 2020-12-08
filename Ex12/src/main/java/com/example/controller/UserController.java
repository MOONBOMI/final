package com.example.controller;

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

import com.example.domain.UserVO;
import com.example.mapper.UserMapper;

@Controller
public class UserController {

	@Autowired
	UserMapper mapper;
	
	@RequestMapping("insert")
	public void insert() {
		
	}
	
	@RequestMapping("list")
	public String list(Model model, HttpSession session, HttpServletRequest request){
		Cookie cookie=WebUtils.getCookie(request, "uid");
		if(cookie != null) {
			session.setAttribute("uid", cookie.getValue());
		}
		String dest=(String)session.getAttribute("dest");
		if(session.getAttribute("dest") != null) {
			session.removeAttribute("dest");
			return "redirect:"+dest;
		}
		model.addAttribute("list", mapper.list());
		return "list";
	}
	
	@RequestMapping("read")
	public void read(Model model, String uid){
		model.addAttribute("vo", mapper.read(uid));
	}
	
	@RequestMapping("login")
	public void login() {
		
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		session.invalidate();
		Cookie cookie=WebUtils.getCookie(request, "uid");
		if(cookie != null) {
			cookie.setPath("/");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		return "redirect:list";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	@ResponseBody
	public int loginPost(UserVO vo, boolean chkLogin, HttpServletResponse response, HttpSession session) {
		UserVO rvo=mapper.read(vo.getUid());
		if(rvo!=null){
			if(rvo.getUpw().equals(vo.getUpw())){
				session.setAttribute("uid", vo.getUid());
				if(chkLogin){
					Cookie cookie=new Cookie("uid", vo.getUid());
					cookie.setPath("/");
					cookie.setMaxAge(60*60*24*7);
					response.addCookie(cookie);
				}
				return 1; //로그인 성공
			} else {
				return 2; //비번 틀림
			}
		}
		return 0; //아이디 없음
	}
}
