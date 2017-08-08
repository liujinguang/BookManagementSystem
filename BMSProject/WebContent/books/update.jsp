<%@page import="com.runwit.books.db.TitleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
    request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="model" class="com.runwit.books.model.Title">
	<jsp:setProperty name="model" property="*" />
</jsp:useBean>

<%
	TitleDAO dao = new TitleDAO();
	dao.update(model);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>朗慧图书管理信息系统-图书管理</title>
<link rel="stylesheet" href="../inc/main.css" type="text/css">
</head>
<body>
	<table align="center" width="150">
		<caption>图书修改成功</caption>
		<tr>
			<td><a href="<%=request.getParameter("url")%>">返回图书列表页面</a></td>
		</tr>
	</table>
</body>
</html>