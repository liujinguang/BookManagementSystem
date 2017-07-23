<%@page import="com.runwit.books.model.Author"%>
<%@page import="com.runwit.books.db.AuthorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>朗慧图书管理信息系统-作者管理</title>
<link rel="stylesheet" href="../inc/main.css" type="text/css">
<script type="text/javascript">
    function checkForm(myform){
        var fName = myform.firstName.value;
        var lName = myform.lastName.value;
        if(fName == "") {
            alert('名不能为空！');
            myform.firstName.focus();
            return false;
        }
        if(lName == "") {
            alert('姓不能为空！');
            myform.lastName.focus();
            return false;
        }
        return true;
    }
</script>
</head>
<body>
	<%@include file="../inc/head.jsp"%>
	<%
	   AuthorDAO dao = new AuthorDAO();
	   Author author = dao.get(Integer.parseInt(request.getParameter("id")));
	%>
	<form action="update.jsp" method="post" name="form1"
		onsubmit="return checkForm(this)">
		<table align="center" width="980">
			<tr>
				<td>
				名 <input type="text" name="firstName" size="20" value="<%=author.getFirstName() %>"> 
				姓 <input type="text" name="lastName" size="20" value=<%=author.getLastName() %>> 
				<input type="hidden" name="id" value="<%=author.getId() %>">
				<input type="submit" value="修改作者">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>