<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자정보</title>
</head>
<body>
	<h1>[사용자 정보]</h1>
	<table border=1>
		<tr>
			<td width=100>아이디</td>
			<td width=200><input type="text" name="uid" value="${vo.uid}"></td>
		</tr>
		<tr>
			<td width=100>이름</td>
			<td width=200><input type="text" name="uname" value="${vo.uname}"></td>
		</tr>
		<tr>
			<td width=100>비밀번호</td>
			<td width=200><input type="text" name="upw" value="${vo.upw}"></td>
		</tr>
	</table>
	<input type="button" value="목록" onClick="location.href='list'">
</body>
</html>