<%@page import="com.runwit.common.util.PageUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.runwit.books.db.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>朗慧图书管理信息系统-用户管理</title>
<link rel="stylesheet" href="../inc/main.css" type="text/css">
</head>
<body>
	<%@include file="../inc/head.jsp"%>
	<form action="add.jsp" method="post" name="form1"
		onsubmit="return checkForm(this)">
		<table align="center" width="980">
			<tr>
				<td>姓名 <input type="text" name="name" size=20> 账号<input
					type="text" name="account" size=20> 密码<input
					type="password" name="password" size=20> <input
					type="submit" value="添加新用户">
				</td>
			</tr>
		</table>
	</form>

	<table align="center" width="980">
		<caption>用户列表</caption>
		<tr>
			<th width="150">用户ID</th>
			<th width="200">姓名</th>
			<th width="200">账号</th>
			<th width="230">创建时间</th>
			<th width="200">操作</th>
		</tr>
		<%
			UserDAO dao = new UserDAO();
			List<User> users = dao.queryAll();

			int pageSize = 10;
			int recordCount = users.size();
			String currentPageStr = request.getParameter("page");
			int currentPage = 1;
			if (currentPageStr != null) {
				currentPage = Integer.parseInt(currentPageStr);
			}

			PageUtil pageUtil = new PageUtil(pageSize, recordCount, currentPage);

			for (int i = pageUtil.getFromIndex(); i < pageUtil.getToIndex(); i++) {
				User user = users.get(i);
		%>
		<tr>
			<td><%=user.getId()%></td>
			<td><%=user.getName()%></td>
			<td><%=user.getAccount()%></td>
			<td><%=user.getCreateTime()%></td>
			<td><a>修改</a>|<a>删除</a></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>