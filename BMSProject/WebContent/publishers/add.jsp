<%@page import="com.runwit.books.model.Publisher"%>
<%@page import="com.runwit.books.db.PublisherDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");

	PublisherDAO dao = new PublisherDAO();
	dao.save(new Publisher(0, name));

	response.sendRedirect("index.jsp");
%>
