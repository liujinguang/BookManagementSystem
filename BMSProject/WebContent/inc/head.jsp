<%@page import="com.runwit.books.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table align="center" width="980" id="headtb"
		style="background: #6688AA">
		<tr>
			<td colspan="2" align="center"><img alt="head.jsp" src="../images/head.jpg"></td>
		</tr>

		<%
			User loginModel = (User) session.getAttribute("loginModel");
			String loginName = "";
			if (loginModel != null) {
				loginName = loginModel.getName();
			}
		%>
		<tr style="background: url('../images/headbg.jpg') repeat-x;">
			<td>
			         欢迎<%=loginName%>[<a href="">更改密码</a> | <a href="<%=request.getContextPath() %>/logout.jsp">退出系统</a>]
			</td>
			<td align="right" height="25">
			     <a href="/authors/index.jsp">作者管理</a> |
			     <a href="/authors/index.jsp">出版社管理</a> |
			     <a href="/authors/index.jsp">图书管理</a> |
			     <a href="/authors/index.jsp">图书查询</a> |
			     <a href="/authors/index.jsp">用户管理</a>
			</td>
		</tr>

	</table>
</body>
</html>