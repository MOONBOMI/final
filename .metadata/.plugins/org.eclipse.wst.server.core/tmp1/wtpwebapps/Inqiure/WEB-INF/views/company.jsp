<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<h1>[사업자조회]</h1>
<form id="frm">
	<input type="text" name="number" value="1536000064">
	<input type="button" name="btnSave" value="저장">

	<div id="container"></div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
				<div>{{result}}</div>
		{{/each}}
	</script>
</form>
</body>
<script>

	function getlist(){
		var number=$(frm.number).val();
		$.ajax({
			type:"get",
			url : "company.json",
			data : {"number":number},
			success : function(data){
				var temp=Handlebars.compile($("#temp").html());
				$("#container").html(temp(data));
				alert(data);
			}
		});
	}
	
	$(frm.btnSave).on("click", function(){
		getlist();
	});
</script>
</html>