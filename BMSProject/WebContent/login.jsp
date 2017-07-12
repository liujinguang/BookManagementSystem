<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>朗慧图书管理系统</title>
<style type="text/css">
table {
	font-size: 14px;
}

table caption {
	font-size: 16px;
}
</style>
<script type="text/javascript">
	function checkForm(myForm) {
		var msg = "";
		var setFocused = false;
		
		if (myForm.account.value == "") {
			msg += "账号不能为空\n";
			
			myForm.account.focus();
			
			setFocused = true;
		}
		
		if (myForm.password.value == "") {
			msg += "密码不能为空";
			
			myForm.password.focus();
			
			setFocused = true;
		}
		
		if (msg != "") {
			alert(msg);
			
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>
	<table align="center">
		<tr>
			<td><img alt="pic"
				src="<%=request.getContextPath()%>/images/head.jpg"></td>
		</tr>
	</table>
	<form action="" name="form1" method="post" onsubmit="return checkForm(this)">
		<table align="center">
			<caption>用户登录</caption>
			<tr>
				<td colspan="2"><span style="color: red; font-weight: bold">a</span>
				</td>
			</tr>
			<tr>
				<td>用户账号</td>
				<td><input type="text" name="account" style="width: 150px"></td>
			</tr>
			<tr>
				<td>用户密码</td>
				<td><input type="text" name="password" style="width: 150px"></td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input type="submit" value="登录">
					<input type="reset" value="清空"></td>
			</tr>
		</table>
	</form>
</body>
</html>