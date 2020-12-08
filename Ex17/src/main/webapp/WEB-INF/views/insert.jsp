<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품등록</title>
<style>
	div {margin:10px;}
</style>
</head>
<body>
	<h1>[상품 등록]</h1>
	<form name="frm" method="post" action="insert" enctype="multipart/form-data">
		<div>상품코드 : <input type="text" name="pcode"></div>
		<div>상 품 명 : <input type="text" name="pname"></div>
		<div>상품가격 : <input type="text" name="price"></div>
		<div>이 미 지 : <input type="file" name="file"></div>
		<div id="images" style="width:500px;background:gray; padding:10px">
			<input type="file" name="files" multiple>
		</div>
		<input type="submit" value="저장">
		<input type="reset" value="취소">
	</form>
</body>
</html>