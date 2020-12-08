<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>기초설정</title>
<style>
	#body {background : gray; width:800px;}
	#BS, #property, #cost {background : blue; width: 700px;}
	.container {background : pink; width:600px;}
</style>
</head>
<body>
	<h1>[기초설정]</h1>
	<div id="body">
		<div id="BS" class="slide active">
			<div id="sale" class="container">
				sale
			</div>
			<div id="refund" class="container">
				refund
			</div>
		</div>
		<div id="property" class="slide">
			<div id="deposit" class="container">
				deposit
			</div>
			<div id="loan" class="container">
				loan
			</div>
		</div>
		<div id="cost" class="slide">
			<div id="costName" class="container">
				cost
			</div>
		</div>
		<button id="prev">Back</button>
  		<button id="next">Next</button>
	</div>
</body>
<script>
	$(document).ready(function(){
		var windowWidth=$(window).width();
		var slideCount=$(".slide").length();
		
		$("#body").on("click", "#next", function(){
			alert("0000000");
			var slideActive=$(".slide .active");
			var nextSlide=slideActive.next(".slide");
			
			slideActive.addClass("active").animate({
				"right" : windowWidth
			},300);
			
			if($(".silde").index(nextSlide)=== -1) {
				nextSlide=$(".slide").eq(0);
			}
			
			nextSlide.addClass("pre-active");
			
			setTimeout(function(){
				slideActive.css({
					'right':'0px'
				});
				nextSlide.removeClass("pre-active");
				slideActive.removeClass("active");
				nextSlide.addClass("active");
			},500);
		});
	});
</script>
</html>