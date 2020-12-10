<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%Calendar cal = new GregorianCalendar();
String year= cal.get(GregorianCalendar.YEAR)+"";
String month=cal.get(GregorianCalendar.MONTH)+1+"";
String day = cal.get(GregorianCalendar.DAY_OF_MONTH)+"";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[비용 입력]</title>
</head>
<body>
	<form name="frm" action="costinsert" method="post">
	<h1>[비용 입력]</h1>
		<div id="predate" style="float:left;">◀</div>
		<div id="date" style="float:left;"></div>
		<div id="Nextdate">▶</div>
		<div style="float:left; margin-right:50px;">
			<table id="tbl" border=1 style="border-collapse:collapse;"></table>
		</div>
		<div>
			<table id="tbl1" border=1 style="border-collapse:collapse;">
				<tr>
					<td>합계금액</td>
					<td><input type="text"></td>
				<tr>
				<tr>
					<td width=200>계정명</td>
					<td width=200>발생금액</td>
				</tr>
				<tbody id= "body"></tbody>
			</table>
		</div>
		<input type="submit" value="저장">
		<input type="reset" value="취소">
	</form>
	
	<form name="frm1" action="depositinsert" method="post">
		<h1>[예금입력]</h1>
		<div id="predate" style="float:left;">◀</div>
		<div id="dedate" style="float:left;"></div>
		<div id="Nextdate">▶</div>
		<div style="float:left; margin-right:50px;">
			<table id="deposittbl" border=1 style="border-collapse:collapse;"></table>
		</div>
		<div>
			<table id="deposittbl1" border=1 style="border-collapse:collapse;">
				<tr>
					<td width=300>계좌번호</td>
					<td width=100>전일잔액</td>
					<td width=80>구분</td>
					<td width=100>금액</td>
					<td width=100>현재잔액</td>
				</tr>
				<tbody id= "body"></tbody>
			</table>
		</div>
		<input type="submit" value="저장">
		<input type="reset" value="취소">
	</form>
	
	<form name="frm2" action="loansinsert" method="post">
		<h1>[대출입력]</h1>
		<div id="predate" style="float:left;">◀</div>
		<div id="lodate" style="float:left;"></div>
		<div id="Nextdate">▶</div>
		<div style="float:left; margin-right:50px;">
			<table id="loanstbl" border=1 style="border-collapse:collapse;"></table>
		</div>
		<div>
			<table id="loanstbl1" border=1 style="border-collapse:collapse;">
				<tr>
					<td width=300>대출계좌번호</td>
					<td width=100>현재잔액</td>
					<td width=100>상환금액</td>
					<td width=100>잔금</td>
				</tr>
				<tbody id= "body"></tbody>
			</table>
		</div>
		<input type="submit" value="저장">
		<input type="reset" value="취소">
	</form>
</body>
	<script>
	$(frm1).hide();
    $(frm2).hide();
    
	date();
	//날짜 출력
	function date(){
		var year=<%=year%>
		var month=<%=month%>
		var strday=<%=day%>
		if(strday<10){
			var day="0"+strday;
			var date=year+"/"+month+"/"+day;
				$(frm).find("#date").html(date);
				$(frm1).find("#dedate").html(date);
				$(frm2).find("#lodate").html(date);
		} else {
			var date=year+"/"+month+"/"+strday;
				$("#date").html(date);
				$("#dedate").html(date);
				$("#lodate").html(date);
		}
	}
		getlist();
		//비용리스트 불러오기
		function getlist(){
			var str="<tr><td width=200>계정명</td></tr>";
			$.ajax({
				type : "get",
				url : "costaccount.json",
				dataType : "json",
				success : function(data){
					if($(data.COSTACCOUNTNAME)!= null){
						$(data).each(function(){
							str +="<tr class='crow'>";
							str +="<td width=150 class='costname' name='"+this.COSTACCOUNTNAME+"' code='"+this.COSTACCOUNTCODE+"'>"+this.COSTACCOUNTNAME+"</td>";
							str +="</tr>";
						});
						$("#tbl").html(str);
					}
				}
			});
		}
	//예금리스트불러오기	
	depositgetlist();
	function depositgetlist(){
			var str="<tr><td width=80>은행명</td><td width=200>계좌번호</td></tr>";
			$.ajax({
				type : "get",
				url : "depositaccountlist.json",
				dataType : "json",
				success : function(data){
					if($(data.DEPOSITACCOUNTCODE)!= null){
						$(data).each(function(){
							str +="<tr class='drow' attcode='"+this.DEPOSITACCOUNTCODE+"'>";
							str +="<input type='hidden' balance='"+this.STARTBALANCE+"'>"
							str +="<td width=150 class='depositname' >"+this.DEPOSITACCOUNTBANKNAME+"</td>";
							str +="<td width=150 class='depositcode' code='"+this.DEPOSITACCOUNTCODE+"'>"+this.DEPOSITACCOUNTCODE+"</td>";
							str +="</tr>";
						});
						$("#deposittbl").html(str);
					}
				}
			});
		}
	//대출리스트불러오기
	loansgetlist();
	function loansgetlist(){
			var str="<tr><td width=80>대출은행명</td><td width=200>계좌번호</td></tr>";
			$.ajax({
				type : "get",
				url : "loansaccountlist.json",
				dataType : "json",
				success : function(data){
					if($(data.LOANSACCOUNTCODE)!= null){
						$(data).each(function(){
							str +="<tr class='lrow' lattcode='"+this.LOANSACCOUNTCODE+"'>";
							str +="<td width=150 class='loansname' >"+this.LOANSACCOUNTBANKNAME+"</td>";
							str +="<td width=150 class='loanscode' code='"+this.LOANSACCOUNTCODE+"'>"+this.LOANSACCOUNTCODE+"</td>";
							str +="</tr>";
						});
						$("#loanstbl").html(str);
					}
				}
			});
		}
		
		//비용 계정 추가시
		$("#tbl").on("click",".costname",function(){
			var costname=$(this).attr("name");
			var costcode=$(this).attr("code");
			var str="<tr class='costrow'><td class='costcode' costcode='"+costcode+"'>"+costname+"</td><td><input type='text' class='cost'>원</td></tr>";
			$("#tbl1 > tbody:last").append(str);
			$("[name="+costname+"]").hide();
		});
		//예금 계정 추가시
		$("#deposittbl").on("click",".drow",function(){
			var attcode=$(this).attr("attcode");
			var balance=$(this).find("input").attr("balance");
			var sum="";
			var str="<tr class='depositrow'><td class='depositcode' depositcode='"+attcode+"'>"+attcode+"</td><td class='balance' balance='"+balance+"'>"+balance+"</td><td class='detype'><input type='radio' name='type' value='입금'checked/>입금<input type='radio' name='type' value='출금'/>출금</td><td><input type='text' class='amount'>원</td><td><input type='text' class='sum' value='"+sum+"'></td></tr>";
			$("#deposittbl1 > tbody:last").append(str);
			$("[attcode="+attcode+"]").hide();
		});
		//예금 금액 입력시
		$("#deposittbl1").on("keyup",".amount",function(){
			var cnt=$(this).val().length;
			console.log(cnt);
			for(var i=1; i<cnt; i++){
				if(!isNaN($(this).val())&&($(this).val().length)!=0){
					var amount=parseInt($(this).val()||0);
					console.log(amount);
				}
			}
			var balance=parseInt($("#deposittbl").find(".drow").find("input").attr("balance"));
			var sum=parseInt(amount+balance);
			console.log(sum);
			$(".depositrow .sum").val(sum);
			
		});
		//대출 계정 추가시
		$("#loanstbl").on("click",".lrow",function(){
		
			var lattcode=$(this).attr("lattcode");
			var balance="";
			var sum="";
			var str="<tr class='loansrow'><td class='loanscode' loanscode='"+lattcode+"'>"+lattcode+"</td><td class='balance' balance='"+balance+"'>"+balance+"</td><td class='amount'><input type='text'>원</td><td class='sum' sum='"+sum+"'>"+sum+"</td></tr>";
			$("#loanstbl1 > tbody:last").append(str);
			$("[lattcode="+lattcode+"]").hide();
		});
		
		//비용저장시
		$(frm).submit(function(e){
			e.preventDefault();
			var companycode = "153-60-00064";
 			var day = $("#date").html().substring(2);
 			$("#tbl1 #body .costrow").each(function(){
				var code = $(this).find(".costcode").attr("costcode");
				var amount= $(this).find(".cost").val();
				if(amount!=""){
				$.ajax({
					type : "post",
					url : "costinsert",
					data : {"cost_companycode" : companycode ,"cost_day": day, "cost_costaccountcode" :code, "costamount":amount},
 					success : function(){
						
 					}
				});
				}
			});
			alert("저장완료되었습니다.");
			$(frm).hide();
			$(frm1).show();
	});
		//예금 저장시
		$(frm1).submit(function(e){
			e.preventDefault();
			var companycode = "347-88-00867";
 			var day = $("#date").html().substring(2);
 			$("#deposittbl1 #body .depositrow").each(function(){
				var code = $(this).find(".depositcode").attr("depositcode");
				var amount= $(this).find(".amount").val();
				var balance=$(this).find(".sum").val();
				var type=$(this).find("[name=type]").val();
				alert(code+"/"+amount+"/"+balance+"/"+type);
				if(amount!=""){
				$.ajax({
					type : "post",
					url : "depositinsert",
					data : {"deposit_companycode" : companycode ,"deposit_day": day, "deposit_depositaccountcode" :code, "deposittype" : type, "depositamount":amount, "depositbalance": balance},
 					success : function(){
						
 					}
				});
				}
			});
			alert("저장완료되었습니다.");
			$(frm1).hide();
			$(frm2).show();
	});
	</script>
</html>