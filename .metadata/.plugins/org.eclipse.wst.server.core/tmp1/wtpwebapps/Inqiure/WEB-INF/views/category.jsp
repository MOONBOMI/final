<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 카테고리 정보 </title>
</head>
<body>
<h2> [카테고리 정보] </h2>
	<input type="button" id="btnadd" value="입력칸 추가">
	<input type="button" id="btndel" value="입력칸 삭제">
<form id="frm" method="post" action="categoryinsert">
	<table id="tbl" border=1>
		<tr><input type="hidden" value="153-60-00064">
			<td width=100>대분류 상품 코드</td>
			<td width=300>대분류 상품 이름</td>
		</tr>
		<tbody>
		<tr class="lcategory">
			<td width=100 class="lcategorycode">001</td>
			<td width=300 class="lcategoryname"><input type="text" size=30 class="largename" placeholder="ex)노트북,데스크탑,휴대폰 등.."></td>
		</tr>
		<tr class="lcategory">
			<td width=100 class="lcategorycode">002</td>
			<td width=300 class="lcategoryname"><input type="text" size=30 class="largename" placeholder="ex)상의,하의,아우터 등.."></td>
		</tr>
		<tr class="lcategory">
			<td width=100 class="lcategorycode">003</td>
			<td width=300 class="lcategoryname"><input type="text" size=30 class="largename" placeholder="ex)커피,차,에이드 등.."></td>
		</tr>
		</tbody>
	</table>
	<input type="submit" value="저장">
	<input type="reset" value="취소"> 
</form>
<form id="frm1" method="post" action="categoryinsert">
	<table id="tbl1" border=1></table>
	
	<input type="submit" value="저장">
	<input type="reset" value="취소">
</form>
</body>
<script>
//$(frm1).hide();

getList();

function getList() {
	var addList = "";
	
	$.ajax({
		type:"get",
		url:"categorylist.json",
		success:function(data) {
			if($(data.NAME)!= null){
				addList += "<thead><td width=100>대분류</td><td width=100>중분류 상품 코드</td><td width=100>중분류 상품 이름</td></thead><tbody id='body'>";
				$(data).each(function() {
						addList += "<tr class='category' ><td width=100 class='lcategoryname'rowspan=4>"+this.NAME.split("/")[1]+"<input type='text' class='lcategorycode' value='"+this.CODE+"'></td></tr>";
						addList += "<tr class='row'><td width=100 class='mcategorycode'>001</td>";
						addList += "<td width=100 class='mcategoryname'><input value='"+this.CODE+"' type='text' size=30  class='midname' placeholder='ex)아메리카노,아이스라떼,카페모카 등..'></td></tr>";
						addList += "<tr class='row'><td width=100 class='mcategorycode'>002</td>";
						addList += "<td width=100 class='mcategoryname'><input value='"+this.CODE+"' type='text' size=30 class='midname' ></td></tr>";
						addList += "<tr class='row'><td width=100 class='mcategorycode'>003</td>";
						addList += "<td width=100 class='mcategoryname'><input value='"+this.CODE+"' type='text' size=30  class='midname' ></td></tr>";
				});
					addList +="</tbody>";
				$("#tbl1").html(addList);
			}
		}
	});
}
	$("#btnadd").click(function(){
		if(!$(frm).is(":hidden")){
			var trCnt=$("#tbl tr").length;
			if(trCnt<10){
				var trCnt1 ="00"+trCnt;
			}else if(trCnt<100 && trCnt>=10) {
				trCnt1="0"+trCnt;
			}else if(trCnt>=100) {
				trCnt1=trCnt;
			}
			var str="";
			str+="<tr class='lcategory'>";
			str+="<td class='lcategorycode'>"+trCnt1+"</td>";
			str+="<td class='lcategoryname'><input type='text' class='largename' size=30></td>";
			str+="</tr>";
			$("#tbl > tbody:last").append(str);
		}else if(!$(frm1).is(":hidden")){
			var trCnt=$("#tbl1 tbody .row").length;
			alert(trCnt);
			if(trCnt<10){
				var trCnt1 ="00"+trCnt;
			}else if(trCnt<100 && trCnt>=10) {
				trCnt1="0"+trCnt;
			}else if(trCnt>=100) {
				trCnt1=trCnt;
			}
			var str="";
			str+="<tr class='row'><td width=100 class='mcategorycode'>"+trCnt1+"</td>";
			str+="<td width=100 class='mcategoryname'><input type='text' size=30 class='midname' ></td></tr>";
			$("#tbl1 > tbody:last").append(str);
		}
	});
	
	$("#btndel").click(function(e){
		$("#tbl > tbody:last > tr:last").remove();
	});
	
	$(frm).submit(function(e){
		e.preventDefault();
		$("#tbl .lcategory").each(function(){
			var strlcode=$(this).find(".lcategorycode").html();
			var lcode="153-60-00064/"+strlcode+"/000";
			var strlname=$(this).find(".lcategoryname").find(".largename").val();
			var lname="골드스탁/"+strlname+"/empty";
			
				$.ajax({
				type : "post",
				url :"categoryinsert",
				data :{"categorycode": lcode, "categoryname":lname},
				success: function(){
				}
			});
		});
		alert("저장완료 되었습니다");
		$(frm).hide();
		$(frm1).show();
	});
	
	$(frm1).submit(function(e){
		e.preventDefault();
// 		$("#tbl1 .category").each(function(){
// 			var lcode=$(this).find(".lcategorycode").val();//153-60-00064/001
// 			var lname=$(this).find(".lcategoryname").html().split("<")[0];//컴퓨터
// 			//var attr=$(this).parent().find(".midname").val();
// 			//alert(attr);
// 		});	
			$("#tbl1 #body").each(function() {
				var attr=$(".midname").val();
				alert(attr);
 				var strmcode=$(this).find(".mcategorycode").html();//001
// 				var mcode=lcode+"/"+strmcode;
 				var strmname=$(this).find(".mcategoryname").find(".midname").val();
// 				var mname="골드스탁/"+lname+"/"+strmname;
				//alert(mcode+".........."+mname);
				
				//if(attr==lcode) return false;
// 				$.ajax({
// 					type : "post",
// 					url :"categoryinsert",
// 					data :{"categorycode": mcode, "categoryname":mname},
// 					success: function(){
// 					}
// 				});
			
			});
	
		alert("저장완료 되었습니다");
	});
</script>
</html>