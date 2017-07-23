<%@page import="com.runwit.books.model.Author"%>
<%@page import="com.runwit.books.db.AuthorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	AuthorDAO dao = new AuthorDAO();
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
	int authorId = Integer.parseInt(request.getParameter("id"));

	Author author = new Author(authorId, firstName, lastName);

	dao.update(author);

	response.sendRedirect("index.jsp");
%>
