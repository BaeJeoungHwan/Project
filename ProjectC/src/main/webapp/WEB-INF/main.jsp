<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/main.css"/>
<meta charset="UTF-8">
<title> 메인 </title>
<script type="text/javascript"></script>
<script src="js/bannerSwitcher.js"></script>
<jsp:include page="/WEB-INF/menubar.jsp"></jsp:include>
<%
	String num = String.valueOf(session.getAttribute("memberNumSession"));
%>
</head>
<body>
    <section id="section-1">
	    <div class="content-slider">
	      <input type="radio" id="banner1" class="sec-1-input" name="banner" checked>
	      <input type="radio" id="banner2" class="sec-1-input" name="banner">
	      <input type="radio" id="banner3" class="sec-1-input" name="banner">
	      <input type="radio" id="banner4" class="sec-1-input" name="banner">
	      <div class="slider">
	        <div id="top-banner-1" class="banner">
	          <div class="banner-inner-wrapper">
	            <img src="image/1.png">
	          </div>
	        </div>
	        <div id="top-banner-2" class="banner">
	          <div class="banner-inner-wrapper">
	            <img src="image/2.png">
	          </div>
	        </div>
	        <div id="top-banner-3" class="banner">
	          <div class="banner-inner-wrapper">
	            <img src="image/3.png">
	          </div>
	        </div>
	        <div id="top-banner-4" class="banner">
	          <div class="banner-inner-wrapper">
	            <img src="image/4.png">
	          </div>
	        </div>
	      </div>
	      <nav>
	        <div class="controls">
	          <label for="banner1"><span class="progressbar"><span class="progressbar-fill"></span></span></label>
	          <label for="banner2"><span class="progressbar"><span class="progressbar-fill"></span></span></label>
	          <label for="banner3"><span class="progressbar"><span class="progressbar-fill"></span></span></label>
	          <label for="banner4"><span class="progressbar"><span class="progressbar-fill"></span></span></label>
	        </div>
	      </nav>
	    </div>
    </section>
    
    <div class="sec">
        <h2> Mentoring Effects </h2>
        <p>
        	Who questions much, shall learn much, and retain much. <br>
        	An investment in knowledge pays the best interest. <br>
        	A well-educated mind will always have more questions than answers. <br>
        	I find that the harder I work, the more luck I seem to have. <br>
        	As a general rule, the most successful man in life is the man who has the best information. <br>
        	Push yourself, because no one else is going to do it for you. <br>
        	Live as if you were to die tomorrow. Learn as if you were to live forever. <br>
        	The capacity to learn is a gift; the ability to learn is a skill; the willingness to learn is a choice.
        </p>
    </div>
    
    <footer>
        <a href="https://cafe.naver.com/thejoeunjava"> ⓒ THEJOEUN ACADEMY Corp. </a>
    </footer>
</body>
</html>
