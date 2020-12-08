<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>cgv영화차트</title>
</head>
<body>
	<h1>[CGV영화차트]</h1>
	<button id="btnSave">저장</button>
	오늘의 날씨 : <span id="weather">weather();</span>
	<div id="container"></div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
			<div class="box" image="{{img}}" rank="{{rank}}" title="{{title}}"  
				style="float:left; margin: 10px; width:150px">
				<img src="{{img}}" width=150>
				<div>{{rank}} : {{title}}</div>
			</div>
		{{/each}}
	</script>
</body>
<script>
	getlist();
	function weather(){
		$.ajax({
			type : "get",
			url : "weather.json",
			success: function(data){
				var temp=Handlebars.compile($("#temp").html());
				$("#weather").html(temp(data));
			}
		});
	}
	
	$("#btnSave").on("click",function(){
		if(!confirm("저장하실???")) return;
		$("#container .box").each(function(){
			var title=$(this).attr("title");
			var fullRank=$(this).attr("rank");
			var rank=fullRank.split(".")[1];
			var fullImage=$(this).attr("image");
			var image=fullImage.split("/")[8];
			$.ajax({
				type : "get",
				url : "insert",
				data : {"title":title, "rank":rank, "image":image,"fullImage":fullImage},
				success : function(){
				}
			});
		});
		alert("저장완료");
	});
	
	function getlist(){
		$.ajax({
			type:"get",
			url : "cgv.json",
			dataType : "json",
			success : function(data){
				var temp=Handlebars.compile($("#temp").html());
				$("#container").html(temp(data));
			}
		});
	}
</script>
</html>