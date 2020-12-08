<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>구글 차트 라이브러리</title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>  <!-- 라이브러리 Load -->
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<select id="sel">
		<option value="cavg.json">강좌별 평균 점수</option>
		<option value="savg.json">학생별 평균 점수</option>
		<option value="dcount.json">학과별 학생수</option>
	</select>
    <div id="chart_div" style="width:1000px; height:500px;"></div>
</body>
<script type="text/javascript">
    changeChart();
    $("#sel").on("change",function(){
    	changeChart();
    });
    function changeChart(){
       var url=$("#sel").val();
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawVisualization);
        function drawVisualization() { 
            $.ajax({
                type:"get",
                url: url,
                dataType:"json",
                success:function(result){
                    //var result = [["과목","점수"],["국어",90],["영어",80],["수학",100]];
                    var data = google.visualization.arrayToDataTable(result); /* 데이터 셋팅 */
                    var options = { title : '강좌별 평균 점수', seriesType: 'bars' }; /* 옵션 셋팅 */
                    var options1 = { title : '학생별 평균 점수', seriesType: 'bars' };
                    var options2 = { title : '학과별 학생수', 'width':700,'height':700, pieHole: 0.4};
                    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
                    var chart2 = new google.visualization.PieChart(document.getElementById('chart_div'));
                    if(url=="cavg.json") {
                    	chart.draw(data, options); /* 차트 그리기 */
                    } else if(url=="savg.json") {
                    	chart.draw(data, options1); /* 차트 그리기 */
                    } else {
                    	chart2.draw(data, options2); /* 차트 그리기 */
                    }
                    
                }
            });
        }
    }
</script>
</html>