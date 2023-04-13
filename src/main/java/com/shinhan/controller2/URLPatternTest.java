package com.shinhan.controller2;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class URLPatternTest
 */
//@WebServlet("/url/test") //이름이 일치하는 URL pattern
//@WebServlet("/url/test/*") //폴더형태
@WebServlet("*.go") //화장자 url pattern인 경우 폴더와 같이 사용안됨

public class URLPatternTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public URLPatternTest() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("getContextPath:"  + request.getContextPath());
		///webShop
		System.out.println("getRequestURI:"+ request.getRequestURI());
		///webShop/url/test
		System.out.println("getRequestURL:" +request.getRequestURL());
		//http://localhost:9090/webShop/url/test
		System.out.println("getMethod:" +request.getMethod());
		//GET
		System.out.println("getRemoteAddr:" + request.getRemoteAddr());
		//서버에 접속한 client ip address : 0:0:0:0:0:0:0:1
		System.out.println("getServletPath:" + request.getServletPath());
		// getContextPath제외한 나머지 url => /url/test
		System.out.println("getPathInfo:" + request.getPathInfo());
		///url/test/*
		//요청한 url이름뒷부분의 url
		System.out.println("getQueryString:" + request.getQueryString());
		//aa=100&bb=200
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
