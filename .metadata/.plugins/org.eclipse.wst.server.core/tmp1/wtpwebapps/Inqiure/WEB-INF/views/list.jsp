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
<title> 학생 정보 </title>
</head>
<body>
<h2> [학생 정보] </h2>
<table id="tbl"></table>
<script id="temp" type="text/x-handlebars-template">
	<tr>
		<td width=100> 학번 </td>
		<td width=100> 이름 </td>
		<td width=100> 학과 </td>
		<td width=100> 생일 </td>
		<td width=100> 담당교수 </td>
	</tr>
	{{#each list}}
		<tr>
			<td>{{SCODE}}</td>
			<td>{{SNAME}}</td>
			<td>{{DEPT}}</td>
			<td>{{dateFormat BIRTHDAY}}</td>
			<td>{{PNAME}}</td>
		</tr>
	{{/each}}
</script>
<script>
Handlebars.registerHelper("dateFormat", function(BIRTHDAY) {
    return new Handlebars.SafeString(
        moment(BIRTHDAY).format("YYYY-MM-DD").toUpperCase()
    );
});
</script>


<div id="pagination"></div>
</body>
<script>
var page = 1;

getList();

function getList() {
	$.ajax({
		type:"get",
		url:"list.json",
		data:{"page":page},
		success:function(data) {
			var temp = Handlebars.compile($("#temp").html());
			 $("#tbl").html(temp(data));
			//페이지 리스트 출력
			 var str="";
			 if(data.pm.prev){
			 str += "<a href='" + (data.pm.startPage-1) + "'>◀</a>"
			 }
			 for(var i=data.pm.startPage; i<= data.pm.endPage; i++){
			 if(page == i){
			 str += "[<a href='" + i + "' class='active'>" + i + "</a>]";
			 }else{
			 str += "[<a href='" + i + "'>" + i + "</a>]";
			 }
			 }
			 if(data.pm.next){
			 str += "<a href='" + (data.pm.endPage+1) + "'>▶</a>"
			 }
			 $("#pagination").html(str);
			 //전체 데이타 출력
			 $("#total").html(data.pm.totalCount);
		}
	});
}

//페이지 번호를 클릭했을 경우
$("#pagination").on("click", "a", function(event){
    event.preventDefault();
    page = $(this).attr("href");
    getList();
});
</script>
</html>