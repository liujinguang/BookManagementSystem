<%@page import="com.runwit.books.model.Author"%>
<%@page import="com.runwit.books.db.AuthorDAO"%>
<%@page import="com.runwit.books.model.Publisher"%>
<%@page import="java.util.List"%>
<%@page import="com.runwit.books.db.PublisherDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/checkLoginSession.jsp"%>

<%
	PublisherDAO dao = new PublisherDAO();
	List<Publisher> publishers = dao.queryAll();
	AuthorDAO dao1 = new AuthorDAO();
	List<Author> authors = dao1.queryAll();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>朗慧图书管理信息系统-图书管理</title>
<link rel="stylesheet" href="../inc/main.css" type="text/css">
<style type="text/css">
table select {
	width: 200px;
}

.tcolumn {
	background: #DDDDFF;
}
</style>
<script type="text/javascript">
	function moveitem(fromSel, toSel) {
		var fromOpts = fromSel.options;
		var toOpts = toSel.options;
		var idx = 0;

		var toLen = toOpts.length;

		for (var i = fromOpts.length - 1; i >= 0; i--) {
			if (fromOpts[i].selected) {
				toOpts[toLen + idx] = new Option(fromOpts[i].text,
						fromOpts[i].value);
				fromOpts[i] = null;
				idx++;
			}
		}
	}

	function checkIsbn() {
		if (form1.isbn.value == "") {
			alert("请先输入ISBN");
			form1.isbn().focus();
			return;
		}

		window.open("checkIsbn.jsp?isbn=" + form1.isbn.value, 'checkwin',
				'width=500,height=400,scrollbar=yes,resizable=no,status=yes')
	}
</script>
</head>
<body>
	<%@ include file="../inc/head.jsp"%>
	<form action="addDo.jsp" method="post" name="form1">
		<table align="center" width="980">
			<caption>添加新图书</caption>
			<tr>
				<td width="250" class="tcolumn">ISBN</td>
				<td width="730"><input type="text" name="isbn" size="40">
					* <input type="button" value="检查ISBN是否存在" onclick="checkIsbn()"></td>
			</tr>
			<tr>
				<td class="tcolumn">书名</td>
				<td><input type="text" name="title" size="40"> *</td>
			</tr>
			<tr>
				<td>出版社</td>
				<td><select name="publisherId">
						<option value="">请选择</option>
						<%
							for (Publisher model : publishers) {
						%>
						<option value="<%=model.getId()%>"><%=model.getName()%></option>
						<%
							}
						%>
				</select></td>
			</tr>
			<tr>
				<td class="tcolumn">价格</td>
				<td><input type="text" name="price" size="40">*</td>
			</tr>
			<tr>
				<td class="tcolumn">出版年份</td>
				<td><input type="text" name="copyright"> *</td>
			</tr>
			<tr>
				<td class="tcolumn">版本号</td>
				<td><input type="text" name="editionNumber"> *</td>
			</tr>
			<tr>
				<td class="tcolumn">作者</td>
				<td>
					<table>
						<tr>
							<td><select name="allauthors" multiple="multiple" size="8">
									<%
										for (Author model : authors) {
									%>
									<option value="<%=model.getId()%>">
										<%=model.getFirstName()%> &nbsp;
										<%=model.getLastName()%>
									</option>
									<%
										}
									%>
							</select></td>
							<td><input type="button" value="增加>>"
								onclick="javascript:moveitem(form1.allauthors, form1.authorIds);">
								<br> <input type="button" value="<<删除"
								onclick="javascript:moveitem(form1.authorIds, form1.allauthors);">
							</td>
							<td><select name="authorIds" multiple="multiple" size="8">

							</select></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" class="tcolumn">
				<input type="hidden" name="imageFile" value="default.jpg" >
				<input
					type="submit" value="增加"> <input type="reset" value="清空">
				</td>
			</tr>

		</table>
	</form>
</body>
</html>