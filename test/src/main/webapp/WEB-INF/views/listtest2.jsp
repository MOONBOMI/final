<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>기초설정</title>
	<link rel="stylesheet" href="/src/css/style.css">
	<style>
	@import url(https://fonts.googleapis.com/css?family=Montserrat);

body {font-size: 14px; color: #fff;height: 20%; position: relative;font-family: "Montserrat", sans-serif;overflow: hidden;margin: 0;padding: 0;letter-spacing: .2px;background: url("../images/bg.jpg") top center repeat;}
html {height: 100%; position: relative;}
nav {position: absolute;top: 2rem;right: 2rem;z-index: 99;}
section {height: 80%;display: flex;align-items: center;position: absolute;right: 0;left: 0;}
ul {width: 800px;list-style: none;}

li {cursor: pointer;}
.active{z-index: 2;}
.pre-active{z-index: 1;}
section#BS {background-color: #2c3e50;}
section#aboutMe {background-color: #e74c3c;}
/*------------ Main Menu ------------*/
.mainmenu {
    font-size: 16px;
    position: relative;
    margin: 90px auto;
    padding: 0;
}

.mainmenu > li {
    box-sizing: border-box;
    height: 48px;
    color: #f7f1e3;
    border-top: 1px solid #d05942;
    background-color: #e4644b;
}

.mainmenu > li:first-child {
    border-top: 0;
    border-radius: 7px 7px 0 0;
}

.mainmenu > li:last-child {
    border-radius: 0 0 7px 7px;
}

.mainmenu > li span {
    line-height: 48px;
    display: block;
}

.mainmenu > li .icon {
    display: block;
    float: left;
    width: 20px;
    height: 20px;
    padding: 14px 20px 0 20px;
}

.mainmenu > li .messages {
    font-size: 11px;
    line-height: 19px;
    display: block;
    float: right;
    width: 34px;
    height: 18px;
    margin-top: -33px;
    margin-right: 19px;
    padding: 0;
    text-align: center;
    background: url("../images/messages.png") no-repeat;
}

.expand-triangle {
    width: 800px;
    height: 10px;
    content: " ";
}

.expand-triangle img {
    width: inherit;
    height: inherit;
    margin-left: -40px;
    vertical-align: top;
}

/*------------ Sub Menu ------------*/
.submenu {
    font-size: 13px;
    box-sizing: border-box;
    content: " ";
    color: #ae9f9f;
}

.submenu li {
    line-height: 20px;
    height: 35px;
    margin-left: -40px;
    padding-top: 11px;
    transition: border-left 220ms ease-in;
    border-left: solid 6px #484141;
    background-color: #484141;
}

.submenu .chosen,
.submenu .chosen:hover {
    border-left: solid 6px #96d145;
}

.submenu li:hover {
    border-left: solid 6px #d05942;
}

.submenu li span {
    margin-left: 30px;
}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
</head>
<body>
<h1>[기초설정]</h1>
	<ul class="mainmenu">
		<li><img src="/SRC2/accmenu1/images/envelope.png" alt="User icon" class="icon"><span>상품입력<span></li>
			<ul class="submenu">
				<div class="expand-triangle"><img src="/SRC2/accmenu1/images/expand.png"></div>
				<li>
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
				</li>
			</ul>
		<li><img src="/SRC2/accmenu1/images/envelope.png" alt="Envelope icon" class="icon"><span>Messages</span><div class="messages">23</div></li>
			<ul class="submenu">
				<div class="expand-triangle"><img src="/SRC2/accmenu1/images/expand.png"></div>
				<li><span>New</span></li>
				<li><span>Sent</span></li>
				<li><span>Trash</span></li>
			</ul>
		<li><img src="/SRC2/accmenu1/images/cog.png" alt="Cog icon" class="icon"><span>Settings</span></li>
			<ul class="submenu">
				<div class="expand-triangle"><img src="/SRC2/accmenu1/images/expand.png"></div>
				<li><span>Language</span></li>
				<li><span>Password</span></li>
				<li><span>Notifications</span></li>
				<li><span>Privacy</span></li>
				<li><span>Payments</span></li>
			</ul>
		<li><img src="/SRC2/accmenu1/images/key.png" alt="Key icon" class="icon"><span>Logout</span></li>
	</ul>
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

$(document).ready( function() {
	var $submenu = $('.submenu');
	var $mainmenu = $('.mainmenu');
	$submenu.hide();
	$submenu.first().delay(200).slideDown(700);
	$submenu.on('click','li', function() {
		$submenu.siblings().find('li').removeClass('chosen');
		$(this).addClass('chosen');
	});
	$mainmenu.on('click', 'li', function() {
		$(this).next('.submenu').slideToggle().siblings('.submenu').slideUp();
	});
	$mainmenu.children('li:last-child').on('click', function() {
		$mainmenu.fadeOut().delay(500).fadeIn();
	});
});
</script>
<script>
!function(){
	function a(){
		
	}function b(a){
		return f.retinaImageSuffix+a
	}function c(a,c){
		if(this.path=a||"","undefined"!=typeof c&&null!==c)
			this.at_2x_path=c,this.perform_check=!1;
		else{
			if(void 0!==document.createElement){
				var d=document.createElement("a");
				d.href=this.path,d.pathname=d.pathname.replace(g,b),this.at_2x_path=d.href
			}else{
				var e=this.path.split("?");
				e[0]=e[0].replace(g,b),this.at_2x_path=e.join("?")
			}
			this.perform_check=!0
			}
		}function d(a){
			this.el=a,this.path=new c(this.el.getAttribute("src"),this.el.getAttribute("data-at2x"));
			var b=this;
			this.path.check_2x_variant(function(a){
				a&&b.swap()})
			}
		var e="undefined"==typeof exports?window:exports,f={retinaImageSuffix:"@2x",check_mime_type:!0,force_original_dimensions:!0};
		e.Retina=a,a.configure=function(a){
			null===a&&(a={
					
			});
			for(var b in a)a.hasOwnProperty(b)&&(f[b]=a[b])},a.init=function(a){
				null===a&&(a=e);
			var b=a.onload||function(){
				
			};a.onload=function(){var a,c,e=document.getElementsByTagName("img"),f=[];
			for(a=0;a<e.length;a+=1)c=e[a],c.getAttributeNode("data-no-retina")||f.push(new d(c));b()}},a.isRetina=function(){
				var a="(-webkit-min-device-pixel-ratio: 1.5), (min--moz-device-pixel-ratio: 1.5), (-o-min-device-pixel-ratio: 3/2), (min-resolution: 1.5dppx)";
				return e.devicePixelRatio>1?!0:e.matchMedia&&e.matchMedia(a).matches?!0:!1};
				var g=/\.\w+$/;e.RetinaImagePath=c,c.confirmed_paths=[],c.prototype.is_external=function(){
					return!(!this.path.match(/^https?\:/i)||this.path.match("//"+document.domain))},c.prototype.check_2x_variant=function(a){
						var b,d=this;return this.is_external()?a(!1):this.perform_check||"undefined"==typeof this.at_2x_path||null===this.at_2x_path?this.at_2x_path in c.confirmed_paths?a(!0):(b=new XMLHttpRequest,b.open("HEAD",this.at_2x_path),b.onreadystatechange=function(){if(4!==b.readyState)return a(!1);if(b.status>=200&&b.status<=399){if(f.check_mime_type){var e=b.getResponseHeader("Content-Type");if(null===e||!e.match(/^image/i))return a(!1)}return c.confirmed_paths.push(d.at_2x_path),a(!0)}return a(!1)},b.send(),void 0):a(!0)},e.RetinaImage=d,d.prototype.swap=function(a){function b(){c.el.complete?(f.force_original_dimensions&&(c.el.setAttribute("width",c.el.offsetWidth),c.el.setAttribute("height",c.el.offsetHeight)),c.el.setAttribute("src",a)):setTimeout(b,5)}"undefined"==typeof a&&(a=this.path.at_2x_path);var c=this;b()},a.isRetina()&&a.init(e)}();
</script>
</html>