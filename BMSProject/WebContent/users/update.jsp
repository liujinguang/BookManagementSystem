<%@page import="com.runwit.books.db.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="user" class="com.runwit.books.model.User">
	<jsp:setProperty name="user" property="*" />
</jsp:useBean>

<%
	UserDAO dao = new UserDAO();
	dao.update(user);
	response.sendRedirect("index.jsp");
%>