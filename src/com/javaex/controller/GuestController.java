package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.GuestDao;
import com.javaex.util.GuestUtil;
import com.javaex.vo.GuestVo;

@WebServlet("/gbc")
public class GuestController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/gbc --> doGet()");
		
		String action = request.getParameter("action");
		GuestDao guestDao = new GuestDao();
		
		//리스트
		if("list".equals(action)) {
			System.out.println("list");
			List<GuestVo> gList = guestDao.getGuestList();
			
			request.setAttribute("guestList", gList);
			
			GuestUtil.forward(request, response, "/WEB-INF/addList.jsp");
		} else if("add".equals(action)) { //등록
			System.out.println("add");
			
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String content = request.getParameter("content");
			GuestVo guestVo = new GuestVo(name, password, content);
			guestDao.contentsInsert(guestVo);
			
			GuestUtil.redirect(request, response, "http://localhost:8088/gb2/gbc?action=list");
		} else if("delete".equals(action)) { //삭제
			System.out.println("delete");
			
			String password = request.getParameter("password");
			int no = Integer.parseInt(request.getParameter("no"));
			
			GuestVo guestVo = new GuestVo(no, password);
			guestDao.guestDelete(guestVo);
			
			GuestUtil.redirect(request, response, "http://localhost:8088/gb2/gbc?action=list");
		} else if("dform".equals(action)) { //삭제폼
			System.out.println("dform");
			
			GuestUtil.forward(request, response, "/WEB-INF/deleteForm.jsp");
			
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
