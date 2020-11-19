<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>주소수정</title>
<link rel="stylesheet" href="../resourse/home.css">
</head>
<body>
	<h1>[주소수정]</h1>
	<form action="update" method="post">
	<input type="hidden" name="ano" value="${vo.ano}">
		<table border=1>
			<tr>
				<td width=100>이름 : </td>
				<td width=500><input type="text" name="name" value="${vo.name }"></td>
			</tr>
			<tr>
				<td width=100>전화 : </td>
				<td width=500><input type="text" name="tel" value="${vo.tel }"></td>
			</tr>
			<tr>
				<td width=100>주소 : </td>
				<td width=500><input type="text" name="addr" value="${vo.addr }"></td>
			</tr>
		</table>
		<input type="submit" value="수정">
		<input type="button" value="삭제" id="btnDelete" onClick="location.href='delete?ano=${vo.ano}'">
		<input type="reset" value="취소">
		<input type="button" value="목록" onClick="location.href='list'">
	</form>
</body>
<script src="../resources/home.js"> </script>
<script>
 $("#btnDelete").on("click",function(){
	if(!confirm("삭제하싈삭제확실????")) return
	location.href="delete?ano=${vo.ano}";
 });
</script>
</html>