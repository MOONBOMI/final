package com.example.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(request.getSession().getAttribute("uid")==null) {
			String path=request.getServletPath();
			String query=request.getQueryString();
			if(query==null || query.equals("")) {
				query="";
			}else {
				query="?"+query;
			}
			request.getSession().setAttribute("dest",path+query);
			response.sendRedirect("login");
		}
		return super.preHandle(request, response, handler);
	}
}