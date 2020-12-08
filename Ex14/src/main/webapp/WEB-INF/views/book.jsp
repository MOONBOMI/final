<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4c9947b8b0448265ca15036c39a7fa4e"></script>
<title>도서검색</title>
</head>
<body>
	<h1>[도서검색]</h1>
	<div id="divSearch">
		<input type="text" id="query" value="스프링">
		<button id="btnSave">저장</button>
	</div>
	<div id="divBook"></div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each items}}
			<div class="box" id="{{isbn}}" title="{{{title}}}" price="{{price}}" image="{{image}}">
				<img src="{{image}}" width=150>
				<div>{{{title}}}</div>
				<div>{{price}}원</div>
			</div>
		{{/each}}
	</script>
</body>
	<script>
		getlist();
		var page=1;
		
		$("#btnSave").on("click",function(){
			if(!confirm("저장하실???")) return;
				$("#divBook .box").each(function(){
					 var id=$(this).attr("id");
					 var title=$(this).attr("title");
					 var price=$(this).attr("price");
					 var fullName=$(this).attr("image");
					 var image=fullName.substring(fullName.lastIndexOf("/")+1, fullName.lastIndexOf("?"));
					 $.ajax({
						 type: "post",
						 url : "insert",
						 data : {"id":id, "title":title, "price":price, "image":image, "fullName":fullName},
						 success : function(){ 
						 }
					 });
				});
				alert("성공");
		});
		
		$("#query").keydown(function(key){
			if(key.keyCode==13) {
				getlist();
			}
		});
		function getlist(){
			var query=$("#query").val();
			$.ajax({
				type:"get",
				url : "book.json",
				data : {"query":query, "page":page},
				dataType : "json",
				success : function(data){
					var temp=Handlebars.compile($("#temp").html());
					$("#divBook").html(temp(data));
				}
			});
		}
	</script>
</html>