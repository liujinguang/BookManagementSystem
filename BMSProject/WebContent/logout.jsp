<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
session.removeAttribute("loginModel");
%>
<jsp:forward page="/login.jsp"></jsp:forward>
