<%@page import="com.runwit.books.db.PublisherDAO"%>
<%@page import="com.runwit.books.model.Publisher"%>
<%@page import="com.runwit.common.util.PageUtil"%>
<%@page import="com.runwit.books.model.Author"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/checkLoginSession.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>朗慧图书管理信息系统-出版社管理</title>
<link rel="stylesheet" href="../inc/main.css" type="text/css">
<script type="text/javascript">
	function checkForm(myform){
	    var name = myform.name.value;
	    if(name == "") {
	        alert('名不能为空！');
	        myform.name.focus();
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
				出版社名称 <input type="text" name="name" size="20"> 
				<input type="submit" value="添加出版社">
				</td>
			</tr>
		</table>
	</form>
	<table align="center" width="980">
		<caption>作者列表</caption>
		<tr>
			<th width="150">出版社ID</th>
			<th width="600">出版社名称</th>
			<th width="230">操作</th>
		</tr>
		<%
			PublisherDAO dao = new PublisherDAO();
	        
			List<Publisher> publishers = dao.queryAll();
			int pageSize = 10;
			int recordCount = publishers.size();

			String currentPageStr = request.getParameter("page");
			int currentPage = 1;
			if (currentPageStr != null) {
				currentPage = Integer.parseInt(currentPageStr);
			}

			PageUtil pageUtil = new PageUtil(pageSize, recordCount, currentPage);

			for (int i = pageUtil.getFromIndex(); i < pageUtil.getToIndex(); i++) {
				Publisher publisher = publishers.get(i);
		%>
		<tr>
			<td width="150"><%=publisher.getId()%></td>
			<td width="600"><%=publisher.getName()%></td>
			<td width="230"><a href="modify.jsp?id=<%=publisher.getId()%>">修改</a>|<a
				href="delete.jsp?id=<%=publisher.getId()%>">删除</a></td>
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