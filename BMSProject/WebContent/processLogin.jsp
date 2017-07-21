<%@page import="com.runwit.books.model.User"%>
<%@page import="com.runwit.books.db.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String account = request.getParameter("account");
	String password = request.getParameter("password");
	
	UserDAO dao = new UserDAO();
	User user = dao.login(account, password);
	if (user == null) {
		request.setAttribute("errorMessage", "登录失败， 账户或密码错误!");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/");
		dispatcher.forward(request, response);
	} else {
		session.setAttribute("loginModel", user);
		session.removeAttribute("errorMessage");
		response.sendRedirect(request.getContextPath() + "/authors/index.jsp");
	}
%>
