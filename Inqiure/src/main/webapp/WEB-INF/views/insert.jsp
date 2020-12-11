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
					<td><input type="text" id="sum"></td>
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
					<td width=100>대출원금</td>
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
	
	<form name="salefrm" action="salesinsert" method="post">
		<h1>[매출입력]</h1>
		<div id="predate" style="float:left;">◀</div>
		<div id="sadate" style="float:left;"></div>
		<div id="Nextdate">▶</div>
		<div style="float:left;">
			<table id="saletbl" border=1 style="border-collapse:collapse;"></table>
		</div>
		<div style="float:left; margin-right:50px;">
			<table id="saletbl1" border=1 style="border-collapse:collapse;"></table>
		</div>
		<div>
			<table id="saletbl2" border=1 style="border-collapse:collapse;">
				<tr>
					<td width=150>상품명</td>
					<td width=150>매출구분</td>
					<td width=200>결제방법</td>
					<td width=50>결제건수</td>
					<td width=300>결제금액</td>
				</tr>
				<tbody id= "body"></tbody>
			</table>
		</div>
		<input type="submit" value="저장">
		<input type="reset" value="취소">
	</form>	
</body>
	<script>
	$(salefrm).hide();
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
				$(salefrm).find("#sadate").html(date);
		} else {
			var date=year+"/"+month+"/"+strday;
				$("#date").html(date);
				$("#dedate").html(date);
				$("#lodate").html(date);
				$("#sadate").html(date);
		}
	}
	
	categorygetlist();
	//대분류리스트 불러오기
	function categorygetlist(){
		var str="<tr><td width=200>계정명</td></tr>";
		$.ajax({
			type : "get",
			url : "lcategorylist.json",
			dataType : "json",
			success : function(data){
				if($(data.CATEGORYCODE)!= null){
					$(data).each(function(){
						if(this.CATEGORYCODE.split("/")[2]=="000"){
						str +="<tr class='lcategoryrow'>";
						str +="<td width=150 class='lcategoryname' name='"+this.CATEGORYNAME+"' code='"+this.CATEGORYCODE+"'>"+this.CATEGORYNAME.split("/")[1]+"</td>";
						str +="</tr>";
						}
				});
					$("#saletbl").html(str);
				}
			}
		});
	}
	
	//중분류 불러오기
		$("#saletbl").on("click",".lcategoryname",function(){
			var categoryname=$(this).attr("name").split("/")[2];
			var categorycode=$(this).attr("code").split("/")[1];
			
			category();
			function category(){
				var str="";
				$.ajax({
				type : "get",
				url : "lcategorylist.json",
				dataType : "json",
				success : function(data){
					if($(data.CATEGORYCODE)!= null){
						$(data).each(function(){
							if((this.CATEGORYCODE.split("/")[2]!="000") && (this.CATEGORYCODE.split("/")[1]==categorycode)){
							str +="<tr class='categoryrow'>";
							str +="<td width=150 class='categoryname' lname='"+this.CATEGORYNAME+"' lcode='"+this.CATEGORYCODE+"'>"+this.CATEGORYNAME.split("/")[2]+"</td>";
							str +="</tr>";
							}
					});
						$("#saletbl1").html(str);
						
					}
				}
			});
			}
// 			var str="<tr class='costrow'><td class='costcode' costcode='"+costcode+"'>"+costname+"</td>";
// 				str+="<td><input type='text' class='cost'>원</td></tr>";
// 			$("#tbl1 > tbody:last").append(str);
// 			$("[name="+costname+"]").hide();
		});
	
	
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
							str +="<input type='hidden' loansamount='"+this.LOANSACCOUNTAMOUNT+"' sumamount='"+this.SUMAMOUNT+"'>"
							str +="<td width=150 class='loansname' >"+this.LOANSACCOUNTBANKNAME+"</td>";
							str +="<td width=150 class='loanscode' code='"+this.LOANSACCOUNTCODE+"'>"+this.LOANSACCOUNTCODE+"</td>";
							str +="</tr>";
						});
						$("#loanstbl").html(str);
					}
				}
			});
		}
		
	//매출 계정 추가시
		$("#saletbl1").on("click",".categoryname",function(){
			var code=$(this).attr("lcode");
			var name=$(this).attr("lname").split("/")[2];
			var cnt=$("#saletbl2 tr").length;
			
			var sum="";
			var str="<tr class='salerow'><td class='salecode' salecode='"+code+"' cnt='"+cnt+"'>"+name;
				str+="<td class='satype'><input type='radio' name='"+code+cnt+"' value='매출'checked/>매출";
				str+="<input type='radio' name='"+code+cnt+"' value='환불'/>환불</td>";
				str+="<td class='paytype'><input type='radio' name='"+cnt+"' value='카드'checked/>카드";
				str+="<input type='radio' name='"+cnt+"' value='현금'/>현금<input type='radio' name='"+cnt+"' value='기타'/>기타</td>";
				str+="<td><input type='text' class='count'>건</td>";
				str+="<td><input type='text' class='amount'></td></tr>";
			$("#saletbl2 > tbody:last").append(str);
			//$("[lcode="+code+"]").hide();
		});
		
		
		//비용 계정 추가시
		$("#tbl").on("click",".costname",function(){
			var costname=$(this).attr("name");
			var costcode=$(this).attr("code");
			var str="<tr class='costrow'><td class='costcode' costcode='"+costcode+"'>"+costname+"</td>";
				str+="<td><input type='text' class='cost'>원</td></tr>";
			$("#tbl1 > tbody:last").append(str);
			$("[name="+costname+"]").hide();
		});
		
		//비용 금액 입력시
		$("#tbl1").on("keyup",".cost",function(){
			var cnt=$(this).val().length;
			console.log(cnt);
			for(var i=1; i<cnt; i++){
				if(!isNaN($(this).val())&&($(this).val().length)!=0){
					var amount=0; 
					$("#tbl1").find(".costrow").each(function(){
						amount+=parseInt($(this).find(".cost").val()||0);
						console.log(amount);
					 })	;
				}
			}
			$("#tbl1").find("#sum").val(amount);
		});
		
		
		//예금 계정 추가시
			$("#deposittbl").on("click",".drow",function(){
				var attcode=$(this).attr("attcode");
				var balance=$(this).find("input").attr("balance");
				var sum="";
				var str="<tr class='depositrow'><td class='depositcode' depositcode='"+attcode+"'>"+attcode;
					str+="<input type='button' class='btnadd' value='입력 추가'><input type='button' class='btndel' value='입력 삭제'></td>";
					str+="<td class='balance' balance='"+balance+"'>"+balance+"</td>";
					str+="<td class='detype'><input type='radio' name='"+attcode+"' value='입금'checked/>입금<input type='radio' name='"+attcode+"' value='출금'/>출금</td>";
					str+="<td><input type='text' class='amount'>원</td>";
					str+="<td><input type='text' class='sum' value='"+sum+"'></td></tr>";
				$("#deposittbl1 > tbody:last").append(str);
				$("[attcode="+attcode+"]").hide();
			});
	
// 			$("#deposittbl1").on("click",".btnadd",function(){
				
// 				var cloneadd=$().clone(true);
				
// 				$("#deposittbl1 tr:last").append(cloneadd);
// 			});
		
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
			var balance=parseInt($(this).parent().parent().find(".balance").html());
			var sum=parseInt(amount+balance);
			var minus=parseInt(balance-amount);
			var attcode=$(this).parent().parent().find(".depositcode").attr("depositcode");
			var type=$("#deposittbl1").find(".depositrow").find("input[name='"+attcode+"']:checked").val();
			if(type=='입금') {
				console.log(sum);
				$(this).parent().parent().find(".sum").val(sum);
			}else if(type=='출금'){
				console.log(minus);
				$(this).parent().parent().find(".sum").val(minus);
			}
		});
		
		
		//대출 계정 추가시
		$("#loanstbl").on("click",".lrow",function(){
			var lattcode=$(this).attr("lattcode");
			var loansamount=$(this).find("input").attr("loansamount");
			var sumamount=$(this).find("input").attr("sumamount");
			var balance=loansamount-sumamount;
			alert(balance);
			var sum="";
			var str="<tr class='loansrow'><td class='loanscode' loanscode='"+lattcode+"'>"+lattcode;
				str+="<td class='loansamount' loansamount='"+loansamount+"'>"+loansamount+"</td>";
				str+="<td class='balance' balance='"+balance+"'>"+balance+"</td>";
				str+="<td><input type='text' class='amount'>원</td>";
				str+="<td><input type='text' class='sum' value='"+sum+"'></td></tr>";
			$("#loanstbl1 > tbody:last").append(str);
			$("[lattcode="+lattcode+"]").hide();
		});
		
		//대출 금액 입력시
		$("#loanstbl1").on("keyup",".amount",function(){
			var cnt=$(this).val().length;
			console.log(cnt);
			for(var i=1; i<cnt; i++){
				if(!isNaN($(this).val())&&($(this).val().length)!=0){
					var amount=parseInt($(this).val()||0);
					console.log(amount);
				}
			}
			var balance=parseInt($(this).parent().parent().find(".balance").html());
			var sum=parseInt(balance-amount);
				console.log(sum);
				$(this).parent().parent().find(".sum").val(sum);
		});
		//입력칸 추가
// 			$("#deposittbl1").on("click","#btnadd",function(){
// 		if(!$(frm).is(":hidden")){
// 			var trCnt=$("#tbl tr").length;
// 			var str="";
// 			str+="<tr class='depositaccount'>";
// 			str+="<td>"+trCnt+"</td>";
// 			str+="<td width=100 class='bankname'><input type='text' size=30 class='depositaccountbankname'></td>";
// 			str+="<td width=300 class='code'><input type='text' size=30 class='depositaccountcode'></td>";
// 			str+="<td width=200 class='name'><input type='text' size=30 class='depositaccountname' ></td>";
// 			str+="<td width=50 class='rate'><input type='text' size=30 class='depositaccountrate' ></td>";
// 			str+="<td width=100 class='start'><input type='text' size=30 class='depositaccountstart'></td>";
// 			str+="<td width=100 class='amount'><input type='text' size=30 class='depositaccrountamount'></td>";
// 			str+="</tr>";
// 			$("#tbl > tbody:last").append(str);
// 		} else if(!$(frm1).is(":hidden")){
// 			var trCnt1=$("#tbl1 tr").length;
// 			var str="";
// 			str+="<tr class='loansaccount'>";
// 			str+="<td>"+trCnt1+"</td>";
// 			str+="<td width=100 class='bankname'><input type='text' size=30 class='loansbankname'></td>";
// 			str+="<td width=300 class='code'><input type='text' size=30 class='loanscode'></td>";
// 			str+="<td width=200 class='name'><input type='text' size=30 class='loansname' ></td>";
// 			str+="<td width=50 class='rate'><input type='text' size=30 class='loansrate' ></td>";
// 			str+="<td width=100 class='amount'><input type='text' size=30 class='loansamount' ></td>";
// 			str+="<td width=100 class='start'><input type='text' size=30 class='loansstart'></td>";
// 			str+="<td width=100 class='end'><input type='text' size=30 class='loansend'></td>";
// 			str+="</tr>";
// 			$("#tbl1 > tbody:last").append(str);
// 		}
// 	});
	
	$("#deposittbl1").on("click","#btndel",function(){
		if(!$(frm).is(":hidden")){
			$("#tbl > tbody:last > tr:last").remove();
		}else if(!$(frm1).is(":hidden")){
			$("#tbl1 > tbody:last > tr:last").remove();
		}
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
 			var day = $("#dedate").html().substring(2);
 			$("#deposittbl1 #body .depositrow").each(function(){
				var code = $(this).find(".depositcode").attr("depositcode");
				var amount= $(this).find(".amount").val();
				var balance=$(this).find(".sum").val();
				var type=$(this).find("input[name='"+code+"']:checked").val();
				alert(code+amount+balance+type);
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
		
		//대출 저장시
		$(frm2).submit(function(e){
			e.preventDefault();
			var companycode = "347-88-00867";
 			var day = $("#lodate").html().substring(2);
 			$("#loanstbl1 #body .loansrow").each(function(){
				var code = $(this).find(".loanscode").attr("loanscode");
				var amount= $(this).find(".amount").val();
				var balance=$(this).find(".sum").val();
				alert(code+amount+balance);
				if(amount!=""){
				$.ajax({
					type : "post",
					url : "loansinsert",
					data : {"loans_companycode" : companycode ,"loans_loansaccountcode": code, "loans_repaymentday" : day, "loansamount":amount, "loansbalance": balance},
 					success : function(){
						
 					}
				});
				}
			});
			alert("저장완료되었습니다.");
			$(frm2).hide();
			$(salefrm).show();
	});
		
		//매출 저장시
		$(salefrm).submit(function(e){
			e.preventDefault();
			var companycode = "347-88-00867";
 			var day = $("#sadate").html().substring(2);
 			$("#saletbl2 #body .salerow").each(function(){
				var code = $(this).find(".salecode").attr("salecode");
				var amount= $(this).find(".amount").val();
				var count=$(this).find(".count").val();
				var cnt=$(this).find(".salecode").attr("cnt");
				var type=$(this).find("input[name='"+code+cnt+"']:checked").val();
				var salestype=$(this).find("input[name='"+cnt+"']:checked").val();;
				alert(code+amount+count+type+salestype);
				if(amount!=""){
				$.ajax({
					type : "post",
					url : "salesinsert",
					data : {"sales_companycode" : companycode ,"sales_day": day, "sales_categorycode" :code, "paytype" : type, "salesamount":amount, "salescount": count, "salestype": salestype},
 					success : function(){
						
 					}
				});
				}
			});
			alert("저장완료되었습니다.");
	});
	</script>
</html>