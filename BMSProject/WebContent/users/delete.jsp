<%@page import="com.runwit.books.db.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	UserDAO dao = new UserDAO();
	dao.delete(Integer.parseInt(request.getParameter("id")));
	response.sendRedirect("index.jsp");
%>

