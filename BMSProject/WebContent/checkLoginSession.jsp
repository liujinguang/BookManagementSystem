<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Object obj = session.getAttribute("loginModel");
	if (obj == null) {
		request.getRequestDispatcher("/").forward(request, response);
	}
%>
