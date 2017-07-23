<%@page import="com.runwit.books.db.AuthorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	AuthorDAO dao = new AuthorDAO();
	dao.delete(Integer.parseInt(request.getParameter("id")));
	response.sendRedirect("index.jsp");
%>
