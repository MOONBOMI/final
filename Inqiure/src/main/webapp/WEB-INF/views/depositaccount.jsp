<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<title>예금 입력</title>
</head>
<body>
	<input type="button" id="btnadd" value="입력칸 추가">
	<input type="button" id="btndel" value="입력칸 삭제">
	
	<form id="frm" method="post" action="depositaccountinsert">
	<table id="tbl" border=1>
	<h1>[예금 입력]</h1>
		<tr>
			<td width=50>번호</td>
			<td width=100>예금은행명</td>
			<td width=300>예금계좌번호</td>
			<td width=200>예금계좌명</td>
			<td width=50>예금이율</td>
			<td width=100>예금개설일</td>
			<td width=100>예금기초잔액</td>
		</tr>
		<tbody>
		<tr class="depositaccount">
			<td width=50>1</td>
			<td width=100 class="bankname"><input type="text" size=30 class="depositaccountbankname" ></td>
			<td width=300 class="code"><input type="text" size=30 class="depositaccountcode"></td>
			<td width=200 class="name"><input type="text" size=30 class="depositaccountname" ></td>
			<td width=50 class="rate"><input type="text" size=30 class="depositaccountrate" ></td>
			<td width=100 class="start"><input type="text" size=30 class="depositaccountstart" placeholder="yyyy/mm/dd"></td>
			<td width=100 class="amount"><input type="text" size=30 class="depositaccrountamount"></td>
		</tr>
		<tr class="depositaccount">
			<td width=50>2</td>
			<td width=100 class="bankname"><input type="text" size=30 class="depositaccountbankname"></td>
			<td width=300 class="code"><input type="text" size=30 class="depositaccountcode"></td>
			<td width=200 class="name"><input type="text" size=30 class="depositaccountname" ></td>
			<td width=50 class="rate"><input type="text" size=30 class="depositaccountrate" ></td>
			<td width=100 class="start"><input type="text" size=30 class="depositaccountstart"></td>
			<td width=100 class="amount"><input type="text" size=30 class="depositaccrountamount"></td>
		</tr>
		<tr class="depositaccount">
			<td width=50>3</td>
			<td width=100 class="bankname"><input type="text" size=30 class="depositaccountbankname"></td>
			<td width=300 class="code"><input type="text" size=30 class="depositaccountcode"></td>
			<td width=200 class="name"><input type="text" size=30 class="depositaccountname" ></td>
			<td width=50 class="rate"><input type="text" size=30 class="depositaccountrate" ></td>
			<td width=100 class="start"><input type="text" size=30 class="depositaccountstart"></td>
			<td width=100 class="amount"><input type="text" size=30 class="depositaccrountamount"></td>
		</tr>
		</tbody> 
	</table>
		<input type="submit" value="저장">
		<input type="reset" value="취소">
	</form>
	
	<form id="frm1" method="post" action="loansaccountinsert">
	<table id="tbl1" border=1>
	<h1>[대출 입력]</h1>
		<tr>
			<td width=50>번호</td>
			<td width=100>대출은행명</td>
			<td width=300>대출계좌번호</td>
			<td width=200>대출계좌명</td>
			<td width=50>대출이율</td>
			<td width=100>대출원금</td>
			<td width=100>대출실행일</td>
			<td width=100>대출만기일</td>
		</tr>
		<tbody>
		<tr class="loansaccount">
			<td width=50>1</td>
			<td width=100 class="bankname"><input type="text" size=30 class="loansbankname"></td>
			<td width=300 class="code"><input type="text" size=30 class="loanscode"></td>
			<td width=200 class="name"><input type="text" size=30 class="loansname" ></td>
			<td width=50 class="rate"><input type="text" size=30 class="loansrate" ></td>
			<td width=100 class="amount"><input type="text" size=30 class="loansamount" ></td>
			<td width=100 class="start"><input type="text" size=30 class="loansstart" placeholder="yyyy/mm/dd"></td>
			<td width=100 class="end"><input type="text" size=30 class="loansend" placeholder="yyyy/mm/dd"></td>
		</tr>
		<tr class="loansaccount">
			<td width=50>2</td>
			<td width=100 class="bankname"><input type="text" size=30 class="loansbankname"></td>
			<td width=300 class="code"><input type="text" size=30 class="loanscode"></td>
			<td width=200 class="name"><input type="text" size=30 class="loansname" ></td>
			<td width=50 class="rate"><input type="text" size=30 class="loansrate" ></td>
			<td width=100 class="amount"><input type="text" size=30 class="loansamount" ></td>
			<td width=100 class="start"><input type="text" size=30 class="loansstart"></td>
			<td width=100 class="end"><input type="text" size=30 class="loansend"></td>
		</tr>
		<tr class="loansaccount">
			<td width=50>3</td>
			<td width=100 class="bankname"><input type="text" size=30 class="loansbankname"></td>
			<td width=300 class="code"><input type="text" size=30 class="loanscode"></td>
			<td width=200 class="name"><input type="text" size=30 class="loansname" ></td>
			<td width=50 class="rate"><input type="text" size=30 class="loansrate" ></td>
			<td width=100 class="amount"><input type="text" size=30 class="loansamount" ></td>
			<td width=100 class="start"><input type="text" size=30 class="loansstart"></td>
			<td width=100 class="end"><input type="text" size=30 class="loansend"></td>
		</tr>
		</tbody>
	</table>
		<input type="submit" value="저장">
		<input type="reset" value="취소">
	</form>

</body>
<script>
	$(frm1).hide();
	
	$("#btnadd").click(function(){
		if(!$(frm).is(":hidden")){
			var trCnt=$("#tbl tr").length;
			var str="";
			str+="<tr class='depositaccount'>";
			str+="<td>"+trCnt+"</td>";
			str+="<td width=100 class='bankname'><input type='text' size=30 class='depositaccountbankname'></td>";
			str+="<td width=300 class='code'><input type='text' size=30 class='depositaccountcode'></td>";
			str+="<td width=200 class='name'><input type='text' size=30 class='depositaccountname' ></td>";
			str+="<td width=50 class='rate'><input type='text' size=30 class='depositaccountrate' ></td>";
			str+="<td width=100 class='start'><input type='text' size=30 class='depositaccountstart'></td>";
			str+="<td width=100 class='amount'><input type='text' size=30 class='depositaccrountamount'></td>";
			str+="</tr>";
			$("#tbl > tbody:last").append(str);
		} else if(!$(frm1).is(":hidden")){
			var trCnt1=$("#tbl1 tr").length;
			var str="";
			str+="<tr class='loansaccount'>";
			str+="<td>"+trCnt1+"</td>";
			str+="<td width=100 class='bankname'><input type='text' size=30 class='loansbankname'></td>";
			str+="<td width=300 class='code'><input type='text' size=30 class='loanscode'></td>";
			str+="<td width=200 class='name'><input type='text' size=30 class='loansname' ></td>";
			str+="<td width=50 class='rate'><input type='text' size=30 class='loansrate' ></td>";
			str+="<td width=100 class='amount'><input type='text' size=30 class='loansamount' ></td>";
			str+="<td width=100 class='start'><input type='text' size=30 class='loansstart'></td>";
			str+="<td width=100 class='end'><input type='text' size=30 class='loansend'></td>";
			str+="</tr>";
			$("#tbl1 > tbody:last").append(str);
		}
	});
	
	$("#btndel").click(function(e){
		if(!$(frm).is(":hidden")){
			$("#tbl > tbody:last > tr:last").remove();
		}else if(!$(frm1).is(":hidden")){
			$("#tbl1 > tbody:last > tr:last").remove();
		}
	});
	
	$(frm).submit(function(e){
		e.preventDefault();
		if(!$(frm).is(":hidden")){
		$("#tbl .depositaccount").each(function(){
			var bankname=$(this).find(".bankname").find(".depositaccountbankname").val();
			var code=$(this).find(".code").find(".depositaccountcode").val();
			var name=$(this).find(".name").find(".depositaccountname").val();
			var rate=$(this).find(".rate").find(".depositaccountrate").val();
			var start=$(this).find(".start").find(".depositaccountstart").val();
			var amount=$(this).find(".amount").find(".depositaccrountamount").val();
			$.ajax({
				type : "post",
				url :"depositaccountinsert",
				data :{"depositaccountbankname": bankname, "depositaccountcode":code,"depositaccountname":name, "depositaccountrate":rate,"depositaccount_startday":start,"depositaccountamount":amount},
				success: function(data){
					alert("성공");
				}
			});
		});
		alert("저장완료 되었습니다");
		$(frm).hide();
		$(frm1).show(); 
		}
	});
	
	
	$(frm1).submit(function(e){
		e.preventDefault();
		if(!$(frm1).is(":hidden")){
		$("#tbl1 .loansaccount").each(function(){
			var bankname=$(this).find(".bankname").find(".loansbankname").val();
			var code=$(this).find(".code").find(".loanscode").val();
			var name=$(this).find(".name").find(".loansname").val();
			var rate=$(this).find(".rate").find(".loansrate").val();
			var amount=$(this).find(".amount").find(".loansamount").val();
			var start=$(this).find(".start").find(".loansstart").val();
			var end=$(this).find(".end").find(".loansend").val();
			$.ajax({
				type : "post",
				url : "loansaccountinsert",
				data : {"loansaccountbankname": bankname, "loansaccountcode":code, "loansaccountname":name, "loansaccountrate":rate, "loansaccount_startday":start, "loansaccount_endday":end, "loansaccountamount":amount},
				success: function(data){
					alert("성공");
				}
			});
		});
		alert("저장완료 되었습니다");
		}
	});
</script>
</html>