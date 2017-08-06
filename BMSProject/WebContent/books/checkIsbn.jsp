<%@page import="com.runwit.books.db.TitleDAO"%>
<%@page import="com.runwit.books.model.Title"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>朗慧图书管理信息系统-图书管理</title>
<link rel="stylesheet" href="../inc/main.css" type="text/css">

</head>
<body>
	<p align="center">
		<%
			String isbn = request.getParameter("isbn");
			Title model = new TitleDAO().get(isbn);
			if (model == null) {
				out.println("ISBN不存在，可以正常使用");
			} else {
				out.println("ISBN已存在，不能录入");
			}
		%>
	
	<p>
	<p align="center">
		<a href="#" onclick="javascript:window.close(); return false;">关闭窗口</a>
	</p>
</body>
</html>