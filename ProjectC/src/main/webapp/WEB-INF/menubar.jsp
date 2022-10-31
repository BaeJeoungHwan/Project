<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/menubar.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta charset="UTF-8">
<title> Menubar </title>
<%String num = String.valueOf(session.getAttribute("memberNumSession"));%>
</head>
<script>
	$(document).ready(function(){
		target1 = document.getElementById("btn1")
		target2 = document.getElementById("btn2")
		target3 = document.getElementById("btn3")
		if(<%=num%> != null){
			document.getElementById("logining1").style.visibility = "hidden"; // hide
			document.getElementById("logining2").style.visibility = "hidden"; // hide
			document.getElementById("logouting").style.visibility = "show"; // hide
			target1.disabled=true;
			target2.disabled=true;
			target3.disabled=false;
			document.getElementById('btn2').firstChild.style.pointerEvents = "none";
		} else {
			document.getElementById("logining1").style.visibility = "show"; // hide
			document.getElementById("logining2").style.visibility = "show"; // hide
			document.getElementById("logouting").style.visibility = "hidden"; // hide
			target1.disabled=false;
			target2.disabled=false;
			target3.disabled=true;
			document.getElementById('btn3').firstChild.style.pointerEvents = "none";
		}
	});
</script>
<script type="text/javascript">
function check(url){
    if(<%=num%> == null){
    	alert("로그인 후 이용해주세요");
    	url="#";
    }
    location.href=url;
}
</script>
<body>
    <div id="header">
        <a href="/" class="logo">
            <img src="image/logo.png" width="400px" height="100px">
        </a>
        <div id="header_left">
	        <ul>
	            <li><a href="#" onclick="check('info.do');"> 마이페이지 </a></li>
	            <li><a href="#" onclick="check('board');"> 자유게시판 </a></li>
	            <li><a href="#" onclick="check('findboard.do');"> 공고게시판 </a></li>
	            <li><a href="#" onclick="check('Customer_service');"> 고객센터 </a></li>
	        </ul>
	        <Button type="button" id="btn1" onclick="window.open('login.do','Login','width=380, height=460');">
	        	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" id="logining1" style="cursor:pointer">
	        		<path d="M352 128c0 70.7-57.3 128-128 128s-128-57.3-128-128S153.3 0 224 0s128 57.3 128 128zM0 482.3C0 383.8 79.8 304 178.3 304h91.4C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7H29.7C13.3 512 0 498.7 0 482.3zM625 177L497 305c-9.4 9.4-24.6 9.4-33.9 0l-64-64c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l47 47L591 143c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9z"/>
	        	</svg>
	        </Button>
	           
	        <Button type="button" id="btn2"><a href="join.do" id="btn_a">
	        	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" id="logining2" style="cursor:pointer">
	        		<path d="M352 128c0 70.7-57.3 128-128 128s-128-57.3-128-128S153.3 0 224 0s128 57.3 128 128zM0 482.3C0 383.8 79.8 304 178.3 304h91.4C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7H29.7C13.3 512 0 498.7 0 482.3zM504 312V248H440c-13.3 0-24-10.7-24-24s10.7-24 24-24h64V136c0-13.3 10.7-24 24-24s24 10.7 24 24v64h64c13.3 0 24 10.7 24 24s-10.7 24-24 24H552v64c0 13.3-10.7 24-24 24s-24-10.7-24-24z"/>
	        	</svg></a>
	        </Button>
	        
	        <Button type="button" id="btn3"><a href="logout" id="btn_b">
	       		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" id="logouting" style="cursor:pointer">
	        		<path d="M352 128c0 70.7-57.3 128-128 128s-128-57.3-128-128S153.3 0 224 0s128 57.3 128 128zM0 482.3C0 383.8 79.8 304 178.3 304h91.4C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7H29.7C13.3 512 0 498.7 0 482.3zM471 143c9.4-9.4 24.6-9.4 33.9 0l47 47 47-47c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9l-47 47 47 47c9.4 9.4 9.4 24.6 0 33.9s-24.6 9.4-33.9 0l-47-47-47 47c-9.4 9.4-24.6 9.4-33.9 0s-9.4-24.6 0-33.9l47-47-47-47c-9.4-9.4-9.4-24.6 0-33.9z"/>
	        	</svg></a>
	        </Button>
		</div>
    </div>
</body>
</html>
