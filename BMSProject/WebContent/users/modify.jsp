<%@page import="com.runwit.books.db.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>朗慧图书管理信息系统-用户管理</title>
<link rel="stylesheet" href="../inc/main.css" type="text/css">
<script type="text/javascript" src="../inc/main.js"></script>
</head>
<body>
	<%@include file="../inc/head.jsp"%>
	<%
		UserDAO dao = new UserDAO();
		User user = dao.get(Integer.parseInt(request.getParameter("id")));
	%>
	<form action="update.jsp" method="post" name="form1"
		onsubmit="return checkUserForm(this);">
		<table align="center" width="980">
			<tr>
				<td>
				        姓名 <input type="text" name="name" size=20 value="<%=user.getName()%>"> 
				        账号 <input type="text" name="account" size=20 value="<%=user.getAccount()%>"> 
				        密码 <input type="password" name="password" size=20 value="<%=user.getPassword()%>">  
				        <input type="hidden" name="id" value="<%=user.getId()%>">
				        <input type="submit" value="修改新用户">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>