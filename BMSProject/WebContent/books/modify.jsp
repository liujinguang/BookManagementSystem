<%@page import="java.util.Arrays"%>
<%@page import="com.runwit.books.db.PublisherDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.runwit.books.model.Author"%>
<%@page import="java.util.List"%>
<%@page import="com.runwit.books.db.AuthorDAO"%>
<%@page import="com.runwit.books.model.Publisher"%>
<%@page import="com.runwit.books.model.Title"%>
<%@page import="com.runwit.books.db.TitleDAO"%>
<%@page import="com.runwit.common.util.ParamUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	AuthorDAO authorDao = new AuthorDAO();
	List<Author> authors = authorDao.queryAll();
	List<Author> modifyAuthors = new ArrayList<>(); //the authors of the current book

	PublisherDAO publisherDao = new PublisherDAO();
	List<Publisher> publishers = publisherDao.queryAll();

	TitleDAO titleDao = new TitleDAO();
	Title title = titleDao.get(request.getParameter("isbn"));
	Integer[] titleAuthorIds = titleDao.getAuthorIdsByIsbn(request.getParameter("isbn"));
	System.out.println("titleAuthorIds=" + titleAuthorIds.length);
	if (titleAuthorIds != null && titleAuthorIds.length > 0) {
		Arrays.sort(titleAuthorIds);

		int id = -1;
		for (int i = 0; i < authors.size(); i++) {
			Author author = authors.get(i);
			id = Arrays.binarySearch(titleAuthorIds, author.getId());
			if (id >= 0) { //find the author of the book
				modifyAuthors.add(author);
			}
		}

		authors.removeAll(modifyAuthors); //remove the current authors from list
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>朗慧图书管理信息系统-图书管理</title>
<link rel="stylesheet" href="../inc/main.css" type="text/css">
<script type="text/javascript" src="../inc/main.js"></script>
</head>
<body>
	<%@include file="/inc/head.jsp"%>
	<%
		String url = "index.jsp";
		url = ParamUtil.appendParam(url, "page", request.getParameter("page"));
	%>
	<form action="update.jsp" method="post" name="form1"
		onsubmit="return checkBookForm(this)">
		<input type="hidden" name="url" value="<%=url%>">
		<table align="center" width="980">
			<caption>修改图书</caption>
			<tr>
				<td width="250" class="tcolumn">图书ISBN</td>
				<td width="730"><input type="text" name="isbn" size="40"
					value="<%=title.getIsbn()%>" style="background: #CCCCCC"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td class="tcolumn">书名</td>
				<td><input type="text" name="title" size="40"
					value=<%=title.getTitle()%>></td>
			</tr>
			<tr>
				<td class="tcolumn">出版社</td>
				<td><select name="publisherId">
						<option value="">请选择...</option>
						<%
							String selected = "";
							for (Publisher publisher : publishers) {
								if (publisher.getId() == title.getPublisherId()) {
									selected = "selected";
								} else {
									selected = "";
								}
						%>
						<option value="<%=publisher.getId()%>" selected="<%=selected%>"><%=publisher.getName()%>
						</option>
						<%
							}
						%>

				</select></td>
			</tr>
			<tr>
				<td class="tcolumn">价格</td>
				<td><input type="text" name="price"
					value="<%=title.getPrice()%>">*</td>
			</tr>
			<tr>
				<td class="tcolumn">出版年份</td>
				<td><input type="text" name="copyright"
					value="<%=title.getCopyright()%>">*</td>
			</tr>
			<tr>
				<td class="tcolumn">版本号</td>
				<td><input type="text" name="editionNumber"
					value="<%=title.getEditionNumber()%>">*</td>
			</tr>
			<tr>
				<td class="tcolumn">作者</td>
				<td>
					<table>
						<tr>
							<td><select name="allauthors" multiple="multiple" size="8">
									<%
										for (Author author : authors) {
									%>
									<option value="<%=author.getId()%>"><%=author.getFirstName()%>&nbsp;
										<%=author.getLastName()%></option>
									<%
										}
									%>
							</select></td>
							<td><input type="button" value="增加>>"
								onclick="moveitem(form1.allauthors, form1.authorIds)"> <br>
								<input type="button" value="<<删除"
								onclick="moveitem(form1.authorIds, form1.allauthors)"></td>
							<td><select name="authorIds" multiple="multiple" size="8">
									<%
										for (Author author : modifyAuthors) {
									%>
									<option value="<%=author.getId()%>"><%=author.getFirstName()%>&nbsp;
										<%=author.getLastName()%></option>
									<%
										}
									%>
							</select></td>
						</tr>

					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" class="tcolumn">
				    <input type="hidden" name="imageFile" value="default.jpg">
				    <input type="submit" value="修改">
				    <input type="reset" value="清空">
				    <input type="button" value="返回" onclick="history.go(-1)">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>