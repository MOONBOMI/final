<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>대분류 입력</title>
</head>
<body>
	<h1>[대분류 입력]</h1>
	<form id="frm" method="post" action="insert">
	<input type="button" id="btnadd" value="입력칸 추가">
	<input type="button" id="btndel" value="입력칸 삭제">
	<table id="tbl" border=1>
		<tr>
			<td width=100>대분류 코드</td>
			<td width=300>대분류 이름</td>
		</tr>
		<tbody>
		<tr class="large">
			<td width=100 class="lcategorycode">1001</td>
			<td width=300  class="lcategoryname"><input type="text" size=30 class="largename" placeholder="ex)노트북,데스크탑,휴대폰 등.."></td>
		</tr>
		<tr class="large">
			<td width=100 class="lcategorycode">1002</td>
			<td width=300 class="lcategoryname"><input type="text" size=30 class="largename" placeholder="ex)상의,하의,아우터 등.."></td>
		</tr>
		<tr class="large">
			<td width=100 class="lcategorycode">1003</td>
			<td width=300 class="lcategoryname"><input type="text" size=30 class="largename" placeholder="ex)커피,차,에이드 등.."></td>
		</tr>
		</tbody>
	</table>
	<input type="submit" value="저장">
	<input type="reset" value="취소"> 
	</form>
</body>
<script>
	$("#btnadd").click(function(){
		var trCnt=$("#tbl tr").length;
		var trCnt1 = 1000+trCnt;
		var str="";
		str+="<tr class='large'>";
		str+="<td class='lcategorycode'>"+trCnt1+"</td>";
		str+="<td class='lcategoryname'><input type='text' class='largename' size=30></td>";
		str+="</tr>";
		$("#tbl > tbody:last").append(str);
	});
	
	$("#btndel").click(function(e){
		$("#tbl > tbody:last > tr:last").remove();
	});
	
	$(frm).submit(function(e){
		e.preventDefault();
		$("#tbl .large").each(function(){
			var lcode=$(this).find(".lcategorycode").html();
			var lname=$(this).find(".lcategoryname").find(".largename").val();
			$.ajax({
				type : "post",
				url :"insert",
				data :{"lcategorycode": lcode, "lcategoryname":lname},
				success: function(){
					
				}
			});
		});
		alert("저장완료 되었습니다");
	});
</script>
</html>