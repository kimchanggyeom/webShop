package com.shinhan.frontcontrollerpattern;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("*.do")
public class FrontController extends HttpServlet  {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getServletPath();
		CommonControllerInterface controller = null;
		Map<String, Object> data = new HashMap<>();
		data.put("method", request.getMethod());
		data.put("request", request);
		
		
		
		switch (path) {
		case "/download.do":
			data.put("response", response);
			controller = new DownloadController(); 
			break;
		case "/upload.do":
			controller = new UploadController();
			break;
		case "/jstl.do":
			controller = new JSTLController();
			break;
		case "/auth/loginCheck.do":
			controller = new LoginController();
			break;
		case "/auth/logout.do":
			controller = new LoginoutController();
			break;
		case "/emp/emplist.do":
			controller = new EmpListController();
			break;	
		case "/emp/empDetail.do":
			controller = new EmpDetailController();
			break;	
		case "/emp/empinsert.do":
			controller = new EmpInsertController();
			break;
		case "/emp/empDelete.do":
			controller = new EmpDeleteController();
			break;
		case "/auth/signup.do":
			System.out.println("frontsightup");
			controller = new SighUpController();
			break;
		case "/auth/emailDupCheck.do":
			controller = new emailDupCheckController();
			break;
		default:
			break;
		}
		String page = null;
		try {
			page = controller.execute(data);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(page.indexOf("redirect:")>=0) {
			response.sendRedirect(page.substring(9));
		}else if(page.indexOf("responeBody:")>=0) {
			response.getWriter().append(page.substring(13));
		}else if(page.indexOf("download")>=0) {
			//response.getWriter().append("download OK");
		}else {
			RequestDispatcher rd;
			rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		 
	}

}
