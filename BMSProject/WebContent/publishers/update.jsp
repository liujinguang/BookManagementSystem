<%@page import="com.runwit.books.model.Publisher"%>
<%@page import="com.runwit.books.db.PublisherDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
	PublisherDAO dao = new PublisherDAO();

	Publisher publisher = new Publisher(Integer.parseInt(request.getParameter("id")),
			request.getParameter("name"));
	System.out.println(publisher);
	dao.update(publisher);
	
	response.sendRedirect("index.jsp");
%>
