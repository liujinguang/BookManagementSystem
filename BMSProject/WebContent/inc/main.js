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

function checkBookForm(myform) {
	var authorOpts = myform.authorIds.options;
	if (authorOpts != null) {
		for (var i = 0; i < authorOpts.length; i++) {
			authorOpts[i].selected = true;
		}
	} else {
		alert("请选择作者");
		myform.allauthors.focus();
		return false;
	}

	if (myform.isbn.value == "") {
		alert("ISBN必须输入");
		myform.isbn.focus();
		return false;
	}

	if (myform.title.value == "") {
		alert('书名必须输入！');
		myform.title.focus();
		return false;
	}

	if (myform.publisherId.value == "") {
		alert('出版社必须选择！');
		myform.publisherId.focus();
		return false;
	}

	var price = parseFloat(myform.price.value);
	if (isNaN(price)) {
		alert('价格必须为数字！');
		myform.price.focus();
		return false;
	}
	
	var copyright = myform.copyright.value;
	if (copyright.length != 4 || isNaN(parseInt(copyright))) {
		alert('出版年份必须为4位数字!');
		myform.copyright.focus();
		return false;
	}
	
	var editionNumber = parseInt(myform.editionNumber.value);
	if (isNaN(editionNumber)) {
		alert('版本号必须为数字！');
		myform.editionNumber.focus();
		return false;
	}

	return true;
}