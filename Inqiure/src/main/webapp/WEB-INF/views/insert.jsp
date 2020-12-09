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
	<form id="frm" action="costinsert" method="post">
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
	
	<form id="frm1" action="costinsert" method="post">
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
	
	<form id="frm2" >
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
    
	date();
	//날짜 출력
	function date(){
		var year=<%=year%>
		var month=<%=month%>
		var strday=<%=day%>
		if(strday<10){
			var day="0"+strday;
			var date=year+"/"+month+"/"+day;
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
							str +="<tr class='row'>";
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
							str +="<tr class='row' attcode='"+this.DEPOSITACCOUNTCODE+"'>";
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
	function depositgetlist(){
			var str="<tr><td width=80>대출은행명</td><td width=200>계좌번호</td></tr>";
			$.ajax({
				type : "get",
				url : "loansaccountlist.json",
				dataType : "json",
				success : function(data){
					if($(data.LOANSACCOUNTCODE)!= null){
						$(data).each(function(){
							str +="<tr class='row' attcode='"+this.LOANSACCOUNTCODE+"'>";
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
		$("#deposittbl").on("click",".row",function(){
			var depositcode=$(this).find(".depositcode").attr("code");
			var attcode=$(this).attr("attcode");
			var balance="";
			var sum="";
			var str="<tr class='depositrow'><td class='depositcode' depositcode='"+depositcode+"'>"+depositcode+"</td><td class='balance' balance='"+balance+"'>"+balance+"</td><td class='detype'><input type='text' value='입금'></td><td><input type='text' class='amount'>원</td><td class='sum' sum='"+sum+"'>"+sum+"</td></tr>";
			$("#deposittbl1 > tbody:last").append(str);
			$("[attcode="+attcode+"]").hide();
		});
		//대출 계정 추가시
		$("#loanstbl").on("click",".row",function(){
			var loanscode=$(this).find(".loanscode").attr("code");
			var attcode=$(this).attr("attcode");
			var balance="";
			var sum="";
			var str="<tr class='loansrow'><td class='loanscode' loanscode='"+loanscode+"'>"+loanscode+"</td><td class='balance' balance='"+balance+"'>"+balance+"</td><td class='amount'><input type='text'>원</td><td class='sum' sum='"+sum+"'>"+sum+"</td></tr>";
			$("#loanstbl1 > tbody:last").append(str);
			$("[attcode="+attcode+"]").hide();
		});
		
		//저장시
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
	</script>
</html>