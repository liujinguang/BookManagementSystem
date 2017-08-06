<%@page import="com.runwit.common.util.ParamUtil"%>
<%@page import="com.runwit.books.db.TitleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	TitleDAO dao = new TitleDAO();
	dao.delete(request.getParameter("isbn"));

	String url = "index.jsp";
	url = ParamUtil.appendParam(url, "page", request.getParameter("page"));

	response.sendRedirect(url);
%>

