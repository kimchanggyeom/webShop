package com.shinhan.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


@WebListener
public class SessionListener implements HttpSessionListener {
	int total_user;
    public SessionListener() {
    	System.out.println("SessionListener생성");
    }


    public void sessionCreated(HttpSessionEvent se)  { 
    	total_user++;
        System.out.println(total_user + "번째 Browser가 이 서버에 접속되었음!!!");
    }


    public void sessionDestroyed(HttpSessionEvent se)  { 
    	System.out.println("Browser가 이 서버에 접속해제되었음!!!");
    	total_user--;
    }
	
}
