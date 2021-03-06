<%@page import="com.runwit.common.util.PageUtil"%>
<%@page import="com.runwit.books.model.Author"%>
<%@page import="java.util.List"%>
<%@page import="com.runwit.books.db.AuthorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/checkLoginSession.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>朗慧图书管理信息系统-作者管理</title>
<link rel="stylesheet" href="../inc/main.css" type="text/css">
<script type="text/javascript">
    function checkForm(myForm) {
		var firstName= myForm.firstName.value;
		var lastName = myForm.lastName.value;
		
		if (firstName == "") {
			alert("名不能为空!");
			myForm.firstName.focus();
			return false;
		}
		
		if (lastName == "") {
			alert("姓不能为空!");
			myForm.lastName.focus();
			
			return false;
		}
		
		return true;
	}

	function processGoPage() {
		var newPage = document.getElementById("newPage").value;
		var reg = /\d+$/;
		
		if (!newPage.match(reg)) {
			alert('页面格式非法!');
			document.getElementById("newPage").focus();
		} else {
			window.location.href="index.jsp?page=" + newPage;
		}
	}
</script>
</head>
<body>
	<%@ include file="/inc/head.jsp"%>
	<form action="add.jsp">
		<table align="center" width="980">
			<tr>
				<td>
				名 <input type="text" name="firstName" size="20"> 
				姓 <input type="text" name="lastName" size="20"> 
				<input type="submit" value="添加新作者">
				</td>
			</tr>
		</table>
	</form>
	<table align="center" width="980">
		<caption>作者列表</caption>
		<tr>
			<th width="150">作者ID</th>
			<th width="300">名</th>
			<th width="300">姓</th>
			<th width="230">操作</th>
		</tr>
		<%
			AuthorDAO dao = new AuthorDAO();
			List<Author> authors = dao.queryAll();
			int pageSize = 10;
			int recordCount = authors.size();

			String currentPageStr = request.getParameter("page");
			int currentPage = 1;
			if (currentPageStr != null) {
				currentPage = Integer.parseInt(currentPageStr);
			}

			PageUtil pageUtil = new PageUtil(pageSize, recordCount, currentPage);

			for (int i = pageUtil.getFromIndex(); i < pageUtil.getToIndex(); i++) {
				Author author = authors.get(i);
		%>
		<tr>
			<td width="150"><%=author.getId()%></td>
			<td width="300"><%=author.getFirstName()%></td>
			<td width="300"><%=author.getLastName()%></td>
			<td width="230"><a href="modify.jsp?id=<%=author.getId()%>">修改</a>|<a
				href="delete.jsp?id=<%=author.getId()%>">删除</a></td>
		</tr>

		<%
			}
		%>

		<tr>
			<td colspan="4" align="right">记录总数<%=recordCount%>条 每页显示<%=pageSize%>条 
				当前页/总页数 <%=pageUtil.getCurrentPage()%>/<%=pageUtil.getPageCount()%>
				<a href="index.jsp?page=1">首页</a> 
				<a href="index.jsp?page=<%=pageUtil.getPrevPage()%>">上页</a> 
				<a href="index.jsp?page=<%=pageUtil.getNextPage()%>">下页</a> 
				<a href="index.jsp?page=<%=pageUtil.getPageCount()%>">末页</a>
				跳到<input type="text" size="3" id="newPage">页 
				<input type="button" value="Go" onclick="processGoPage()">
			</td>
		</tr>
	</table>
</body>
</html>