<%@page import="com.runwit.books.model.Author"%>
<%@page import="com.runwit.books.db.AuthorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");

	AuthorDAO dao = new AuthorDAO();
	Author author = new Author(0, firstName, lastName);
	dao.save(author);

	response.sendRedirect("index.jsp");
%>
