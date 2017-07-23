<%@page import="com.runwit.books.model.Publisher"%>
<%@page import="com.runwit.books.db.PublisherDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</script>
</head>
<body>
    <%@ include file="/inc/head.jsp"%>
    <%
    PublisherDAO dao = new PublisherDAO();
    Publisher publisher = dao.get(Integer.parseInt(request.getParameter("id")));
    %>
    <form action="update.jsp" method="post" name="form1" onsubmit="return checkForm(this)">
        <table align="center" width="980">
            <tr>
                <td>
                                出版社名称 <input type="text" name="name" size="20" value="<%=publisher.getName()%>"> 
                <input type="hidden" name="id" size="20" value="<%=publisher.getId()%>">
                <input type="submit" value="修改出版社">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>