<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>Insert title here</title>
<style>
body, html {height: 100%; position: relative;}
body {font-size: 14px; color: #fff;}
nav {position: absolute;top: 2rem;right: 2rem;z-index: 99;}
section {height: 100%;display: flex;align-items: center;position: absolute;right: 0;left: 0;}
section#BS {background-color: #2c3e50;}
section#aboutMe {background-color: #e74c3c;}
section#smthElse {background-color: #1abc9c;}
section#cost {background-color:pink;}
.active{z-index: 2;}
.pre-active{z-index: 1;}
</style>
</head>
<body>
	<h1>[테스트]</h1>
<nav>
  <button id="prev">Back</button>
  <button id="next">Next</button>
</nav>
<section id="BS" class="slide active">
  <div class="container">
    <p>대분류 입력</p>
  </div>
</section>
<section id="aboutMe" class="slide">
  <div class="container">
    <p>중분류 입력</p>
  </div>
</section>
<section id="smthElse" class="slide">
  <div class="container">
    <p>예금입력</p>
  </div>
</section>
<section id="cost" class="slide">
  <div class="container">
    <p>대출입력</p>
  </div>
</section>
</body>
<script>
$(document).ready(function() {

	  var windowWidth = $(window).width();
	  var slideCount = $('.slide').length;

	  $('button#next').on('click', function() {
	    var slideActive = $('.slide.active');
	    var nextSlide = slideActive.next('.slide');

	    slideActive.addClass('active').animate({
	      'right': windowWidth
	    }, 500);

	    if ($('.slide').index(nextSlide) === -1) {
	      nextSlide = $('.slide').eq(0);
	    }

	    nextSlide.addClass('pre-active');

	    setTimeout(function() {
	      slideActive.css({
	        'right': '0px'
	      });
	      nextSlide.removeClass('pre-active');
	      slideActive.removeClass('active');
	      nextSlide.addClass('active');
	    }, 510);

	  });
	  
	  $('button#prev').on('click', function() {
		    var slideActive = $('.slide.active');
		    var prevSlide = slideActive.prev('.slide');

		    slideActive.addClass('active').animate({
		      'left': windowWidth
		    }, 500);

		    if ($('.slide').index(prevSlide) === -1) {
		      prevSlide = $('.slide').eq(slideCount - 1);
		    }

		    prevSlide.addClass('pre-active');

		    setTimeout(function() {
		      slideActive.css({
		        'left': '0px'
		      });
		      prevSlide.removeClass('pre-active');
		      slideActive.removeClass('active');
		      prevSlide.addClass('active');
		    }, 510);

		  });
});
</script>
</html>