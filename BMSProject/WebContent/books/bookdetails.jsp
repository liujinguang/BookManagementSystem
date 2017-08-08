<%@page import="com.runwit.books.model.Author"%>
<%@page import="java.util.List"%>
<%@page import="com.runwit.books.model.Title"%>
<%@page import="com.runwit.books.db.TitleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	TitleDAO dao = new TitleDAO();
	Title title = dao.get(request.getParameter("isbn"));
	List<Author> authors = dao.getAuthorModelsByIsbn(request.getParameter("isbn"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>>朗慧图书管理信息系统-图书管理</title>
<link rel="stylesheet" href="../inc/main.css" type="text/css">
</head>
<body>
	<%@include file="/inc/head.jsp"%>
	<table align="center" width="980">
		<caption>图书详细信息</caption>
		<tr>
			<td width="250" class="tcolumn">ISBN</td>
			<td width="730"><%=title.getIsbn()%></td>
		</tr>
		<tr>
			<td class="tcolumn">书名</td>
			<td><%=title.getTitle()%></td>
		</tr>
		<tr>
			<td class="tcolumn">出版社</td>
			<td><%=title.getPublisherName()%></td>
		</tr>
		<tr>
			<td class="tcolumn">价格</td>
			<td><%=title.getPrice()%></td>
		</tr>
		<tr>
			<td class="tcolumn">版本号</td>
			<td><%=title.getCopyright()%></td>
		</tr>
		<tr>
			<td class="tcolumn">作者</td>
			<td>
				<%
					for (Author author : authors) {
					    out.println(author.getFirstName() + "&nbsp;" + author.getLastName() + "<br>");						
					}
				%>

			</td>
		</tr>
		<tr>
		  <td colspan="2" align="center" class="tcolumn">
		      <input type="button" value="关闭窗口" onclick="window.close();">
		  </td>
		</tr>
	</table>
</body>
</html>