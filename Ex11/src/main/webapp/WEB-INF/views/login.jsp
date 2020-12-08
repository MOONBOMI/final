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
				<td width=300><input type="text" name="uid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="upw"></td>
			</tr>
			<tr>
				<td colspan=2><input type="submit" value="로그인">
				<input type="checkbox" name="chklogin">로그인 상태유지
				</td>
			</tr>
		</table>
	</form>
</body>
<script>
	$(frm).submit(function(e){
		e.preventDefault();
		var upw=$(frm.upw).val();
		var uid=$(frm.uid).val();
		var chklogin=$(frm.chklogin).is(":checked")?true:false;
		$.ajax({
			type:"post",
			url:"login",
			data : {"uid":uid, "upw":upw, "chklogin":chklogin},
			success : function(data){
				if(data==0){
					alert("아이디 없음");
				} else if(data==2){
					alert("비번 틀림");
				} else {
					location.href="list";
				}
			}
		});
	});
	
</script>
</html>