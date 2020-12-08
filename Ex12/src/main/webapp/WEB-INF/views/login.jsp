<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>로그인</title>
</head>
<body>
	<h1>[로그인]</h1>
	<form name="frm" action="login" method="post">
		<table border=1>
			<tr>
				<td width=100>아이디</td>
				<td width=200><input type="text" name="uid"></td>
			</tr>
			<tr>
				<td width=100>비밀번호</td>
				<td width=200><input type="password" name="upw"></td>
			</tr>
			<tr>
				<td colspan=2>
					<input type="submit" value="로그인">
					<input type="checkbox" name="chkLogin">로그인상태유지
				</td>
			</tr>
		</table>
	</form>
</body>
<script>
	$(frm).submit(function(e){
		e.preventDefault();
		var uid=$(frm.uid).val();
		var upw=$(frm.upw).val();
		var chkLogin=$(frm.chkLogin).is(":checked")? true:false;
		$.ajax({
			type : "post",
			url : "login",
			data : {"uid": uid, "upw": upw, "chkLogin" : chkLogin},
			success : function(data){
				if(data==0) {
					alert("아이디가 없습니다");
				} else if(data==2) {
					alert("비밀번호가 틀립니다");
				} else if(data==1) {
					alert("로그인 성공");
					location.href="list";
				}
			}
		});
	});
</script>
</html>