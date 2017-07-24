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
<script type="text/javascript" src="../inc/main.js"></script>
</head>
<body>
	<%@include file="../inc/head.jsp"%>
	<form action="add.jsp" method="post" name="form1"
		onsubmit="return checkUserForm(this)">
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
			<td><a href="modify.jsp?id=<%=user.getId()%>">修改</a>|<a
				href="delete.jsp?id=<%=user.getId()%>"
				onclick="return confirm('确定要删除该记录[用户ID: <%=user.getId()%>]')">删除</a></td>
		</tr>
		<%
			}
		%>
		<tr>
			<td colspan="8" align="right">记录总数<%=recordCount%>条 每页显示<%=pageSize%>条 
				 当前页/总页数 <%=pageUtil.getCurrentPage()%>/<%=pageUtil.getPageCount() %>
				<a href="index.jsp?page=1">首页</a>
				<a href="index.jsp?page=<%=pageUtil.getPrevPage()%>">上页</a>
				<a href="index.jsp?page=<%=pageUtil.getNextPage()%>">下页</a>
				跳到<input type="text" size="3" id="newPage">页
				<input type="button" value="Go" onclick="return processGoPage()">
			</td>
		</tr>
	</table>
</body>
</html>