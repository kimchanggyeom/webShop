package com.shinhan.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.filters.ExpiresFilter.XHttpServletResponse;

import com.shinhan.vo.AdminVO;

@WebFilter("*.do")
public class LoginCheckFilter extends HttpFilter implements Filter {

	/**
	 * @see HttpFilter#HttpFilter()
	 */
	public LoginCheckFilter() {
		super();
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 요청필터
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse rep = (HttpServletResponse) response;
		System.out.println("req.getServletPath():" + req.getServletPath());
		
		if (req.getServletPath().equals("/auth/loginCheck.do") ||
			req.getServletPath().equals("/auth/signup.do") ||
			req.getServletPath().equals("/auth/emailDupCheck.do") ||
			req.getServletPath().equals("/jsptest/jstl.do")){
			
		} else {
			HttpSession browser = req.getSession();
			AdminVO user = (AdminVO) browser.getAttribute("loginUser");
			if (user == null) {
				rep.sendRedirect(req.getContextPath() + "/auth/loginCheck.do");
				return;
			}
			System.out.println("user:" + user);
		}
		chain.doFilter(request, response);
		// 응답필터
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
