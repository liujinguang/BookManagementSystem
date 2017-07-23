<%@page import="com.runwit.books.model.Publisher"%>
<%@page import="com.runwit.books.db.PublisherDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	PublisherDAO dao = new PublisherDAO();
    dao.delete(Integer.parseInt(request.getParameter("id")));
    
    response.sendRedirect("index.jsp");
%>
