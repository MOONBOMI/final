<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>메세지 보내기</title>
</head>
<body>
	<h1>[메세지보내기]</h1>
	<table border=1>
		<tr>
			<td width=100>보낸이</td>
			<td width=500>${vo.uname } | 포인트 : <span id="point">${vo.point }</span></td>
		</tr>
		<tr>
			<td>받는이</td>
			<td>
				<select id="receiver">
					<c:forEach items="${list }" var="v">
						<c:if test="${vo.uid !=v.uid }">
							<option value="${v.uid }">${v.uname}</option>
						</c:if>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><input type="text" size=70 id="txtMessage"></td>
		</tr>
	</table>
	<button id="btnSend">보내기</button>
	<h1>[보낸메세지]</h1>
	<table id="tbl" border=1></table>
	<script id="temp" type="text/x-handlebars-template">
		<tr>
			<td width=100>받은이</td>
			<td width=250>내용</td>
			<td width=180>보낸날짜</td>
			<td width=150>수신확인</td>
		</tr>
		{{#each .}}
		<tr class="row">
			<td>{{receiver}}:{{uname}}</td>
			<td>{{message}}</td>
			<td>{{sendDate}}</td>
			<td>{{{confirm readDate}}}&nbsp;&nbsp;<a href="{{mid}}">삭제</a></td>
		</tr>
		{{/each}}
	</script>
	<script>
		Handlebars.registerHelper("confirm",function(readDate) {
			if(!readDate) return "<span style='color:red;'>읽지않음</span>";
			else return "<span style='color:blue;'>읽음</span>";
		});
	</script>
</body>
	<script>
	var sender="${vo.uid}";
	
	$("#tbl").on("click",".row a",function(e){
		e.preventDefault();
		var mid=$(this).attr("href");
		if(!confirm(mid+"을(를) 삭제하시겠습니까?")) return;
			$.ajax({
				type: "post",
				url : "delete",
				data :{"mid":mid},
				success : function() {
					alert("삭제완료되었습니다.");
					getList();
				}
			});
	});
	
	getList();
	function getList(){
		$.ajax({
			type : "get",
			url : "sendList",
			data : {"sender" : sender},
			success : function(data) {
				var temp=Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));
			}
		});	
	}
	
	
		$("#btnSend").on("click",function(){
			var receiver=$("#receiver").val();
			var message=$("#txtMessage").val();
			if(message=="") {
				alert("내용을 입력하십씨오!!!!");
				return;
			}
			if(!confirm("메세지를 보내시겠습니깡?!?!?")) return;
			$.ajax({
				type:"post",
				url:"insert",
				data:{"sender":sender, "receiver" :receiver, "message" :message},
				success: function(){
					alert("메세지가 전송되었습니다~~~~");
					$("#txtMessage").val("");
					getList();
					getUser();
				}
			});
		});
		
		function getUser(){
			$.ajax({
				type:"get",
				url:"read",
				data : {"uid":sender},
				success : function(data){
					$("#point").html(data.point);
				}
			});
		}
	</script>
</html>