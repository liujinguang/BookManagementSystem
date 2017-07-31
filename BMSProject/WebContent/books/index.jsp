<%@page import="com.runwit.common.util.ParamUtil"%>
<%@page import="com.runwit.books.model.Title"%>
<%@page import="com.runwit.books.db.TitleDAO"%>
<%@page import="com.runwit.common.util.PageUtil"%>
<%@page import="com.runwit.books.model.Author"%>
<%@page import="java.util.List"%>
<%@page import="com.runwit.books.db.AuthorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/checkLoginSession.jsp"%>

<%
	List<Title> titles = null;
	TitleDAO dao = new TitleDAO();
	String isbn = ParamUtil.getString(request.getParameter("isbn"));
	String stitle = ParamUtil.getString(request.getParameter("title"));

	if (isbn.equals("") && stitle.equals("")) {
		titles = dao.queryAll();
	} else {
		titles = dao.quickSearch(isbn, stitle);
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>朗慧图书管理信息系统-图书管理</title>
<link rel="stylesheet" href="../inc/main.css" type="text/css">
<script type="text/javascript">
	function checkForm(myForm) {
		var firstName = myForm.firstName.value;
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
			window.location.href = "index.jsp?page=" + newPage;
		}
	}
</script>
</head>
<body>
	<%@ include file="/inc/head.jsp"%>
	<form action="index.jsp">
		<table align="center" width="980">
			<tr>
				<td>
				    ISBN<input type="text" name="isbn" size="20" value="<%=isbn%>"> 
				        书名<input type="text" name="title" 	size="20" value="<%=stitle%>"> 
				        <input type="submit" value="快速搜索">
				</td>
			</tr>
		</table>
	</form>
	<table align="center" width="980">
		<tr>
			<td colspan="7"><a href="add.jsp">+添加图书</a></td>
		</tr>
		<caption>图书列表</caption>
		<tr>
			<th width="50">序号</th>
			<th width="130">图书ISBN</th>
			<th width="300">书名</th>
			<th width="150">出版社名称</th>
			<th width="70">价格</th>
			<th width="70">版本号</th>
			<th width="80">出版年份</th>
			<th width="130">操作</th>
		</tr>
		<%
			int pageSize = 10;
			int recordCount = titles.size();

			String currentPageStr = request.getParameter("page");
			int currentPage = 1;
			if (currentPageStr != null) {
				currentPage = Integer.parseInt(currentPageStr);
			}

			PageUtil pageUtil = new PageUtil(pageSize, recordCount, currentPage);

			for (int i = pageUtil.getFromIndex(); i < pageUtil.getToIndex(); i++) {
				Title title = titles.get(i);
		%>
		<tr>
			<td width="50"><%=(i + 1)%></td>
			<td width="130"><%=title.getIsbn()%></td>
			<td width="300"><a
				href="bookdetails.jsp?isbn=<%=title.getIsbn()%>" target="_blank"><%=title.getTitle()%></a></td>
			<td width="150"><%=title.getPublisherName()%></td>
			<td width="70"><%=title.getPrice()%></td>
			<td width="70"><%=title.getEditionNumber()%></td>
			<td width="80"><%=title.getCopyright()%></td>
			<td width="130"><a
				href="modify.jsp?isbn=<%=title.getIsbn()%>&page=<%=pageUtil.getCurrentPage()%>&qisbn=<%=title.getIsbn()%>&title=<%=title%>">修改</a>
				| <a
				href="delete.jsp?isbn=<%=title.getIsbn()%>&page=<%=pageUtil.getCurrentPage()%>&qisbn=<%=title.getIsbn()%>&title=<%=title%>"
				onclick="return confirm('确定要删除该记录[ISBN：<%=title.getIsbn()%>]吗？');">删除</a></td>
		</tr>

		<%
			}
		%>

		<tr>
			<td colspan="8" align="right">记录总数<%=recordCount%>条 每页显示<%=pageSize%>条
				当前页/总页数 <%=pageUtil.getCurrentPage()%>/<%=pageUtil.getPageCount()%>
				<a href="index.jsp?page=1">首页</a> <a
				href="index.jsp?page=<%=pageUtil.getPrevPage()%>">上页</a> <a
				href="index.jsp?page=<%=pageUtil.getNextPage()%>">下页</a> <a
				href="index.jsp?page=<%=pageUtil.getPageCount()%>">末页</a> 跳到<input
				type="text" size="3" id="newPage">页 <input type="button"
				value="Go" onclick="processGoPage()">
			</td>
		</tr>
	</table>
</body>
</html>