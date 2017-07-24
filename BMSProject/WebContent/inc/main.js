/**
 * 
 */

function processGoPage() {
	var newPage = document.getElementById("newPage").value;
	var reg = /\d+$/;
	if (!newPage.match(reg)) {
		alert('页面格式非法！');
		document.getElementById("newPage").focus();
	} else {
		window.location.href = "index.jsp?page=" + newPage;
	}
}

function checkUserForm(myform) {
	var name = myform.name.value;
	var account = myform.account.value;
	var password = myform.password.value;
	
	if (name == "") {
		alert("姓名不能为空!");
		myform.name.focus();
		
		return false;
	}
	
	if (account == "") {
		alert("账户不能为空!");
		myform.account.focus();
		
		return false;
	}	
	
	if (password == "") {
		alert("密码不能为空!");
		myform.password.focus();
		
		return false;
	}		
	
	return true;
}