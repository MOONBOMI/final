<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자등록</title>
</head>
<body>
	<h1>[사용자 등록]</h1>
	<form name="frm" action="insert" method="post">
	<table border=1>
		<tr>
			<td width=100>아이디</td>
			<td width=200><input type="text" name="uid"></td>
		</tr>
		<tr>
			<td width=100>이름</td>
			<td width=200><input type="text" name="uname"></td>
		</tr>
		<tr>
			<td width=100>비밀번호</td>
			<td width=200><input type="text" name="upw"></td>
		</tr>
	</table>
	<input type="button" value="저장" onClick="location.href='list'">
	</form>
</body>
</html>