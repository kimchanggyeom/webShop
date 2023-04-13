package com.shinhan.frontcontrollerpattern;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.shinhan.model.AdminService;
import com.shinhan.vo.AdminVO;

public class LoginController implements CommonControllerInterface {
	@Override
	public String execute(Map<String, Object> data) {
		String method = (String) data.get("method");
		String page = "";
		if (data.get("method").equals("GET")) {
			page = "login.jsp";
		} else {
			HttpServletRequest request = (HttpServletRequest) data.get(("request"));
			String email = request.getParameter("email");
			String pass = request.getParameter("pass");
			AdminService service = new AdminService();
			AdminVO admin = service.loginCheck(email, pass);
//System.out.println(admin == null ? "로그인실패" : admin);
			ServletContext app = request.getServletContext();
			Object obj = app.getAttribute("userList");
			List<AdminVO> userList = null;
			int notUsing = 333;
			if (admin != null) {
				if (obj == null) {
					userList = new ArrayList<>();
				} else {
					userList = (List<AdminVO>) obj;
				}
				userList.add(admin);
				app.setAttribute("userList", userList);
				System.out.println("-----로그인한사람 list---------");
				for (AdminVO vo : userList) {
					System.out.println(vo);
				}
				System.out.println("------------------");
				//로그인 성공
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", admin);
				String path = request.getContextPath();
				page = "redirect:" + path + "/emp/emplist.do";
			} else {
				//로그인 실패
				page = "redirect:loginCheck.do";
			}
		}
		return page;
	}
}