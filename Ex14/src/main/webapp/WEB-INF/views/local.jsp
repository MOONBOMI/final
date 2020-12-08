<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4c9947b8b0448265ca15036c39a7fa4e"></script>
<title>지역검색</title>
</head>
<body>
	<h1>[지역검색]</h1>
	<table id="tbl" border=1></table>
	<script id="temp" type="text/x-handlebars-template">
		{{#each documents}}
			<tr class="row">
				<td>{{place_name}}</td>
				<td>{{address_name}}</td>
				<td>{{phone}}</td>
				<td><button x={{x}} y={{y}}>지도출력</button></td>
			</tr>		
		{{/each}}
	</script>
	<div id="map" style="width:500px;height:400px;"></div>
</body>
	<script>
		getlist();
		var page=1;
		$("#tbl").on("click",".row button",function(){
			var x=$(this).attr("x");
			var y=$(this).attr("y");
			
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(y, x),
				level: 3
			};

			var map = new kakao.maps.Map(container, options);
		});
		
		
		
		function getlist(){
			var query="버거킹";
			$.ajax({
				type:"get",
				url : "local.json",
				data : {"query":query, "page":page},
				dataType : "json",
				success : function(data){
					var temp=Handlebars.compile($("#temp").html());
					$("#tbl").html(temp(data));
				}
			});
		}
	</script>
</html>