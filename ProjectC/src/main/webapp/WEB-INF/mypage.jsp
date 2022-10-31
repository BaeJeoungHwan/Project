<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/mypage.css"/>
<meta charset="UTF-8">
<title> 마이페이지 </title>
<jsp:include page="/WEB-INF/menubar.jsp"></jsp:include>
</head>

<body>
    <div id="memberinfo">
	    <div id="info">
	    	<div id="memberprofile-box">
	    		<div id="memberprofile-box-img">
	    			<img src="image/profile.png" width="120" height="120">
	    		</div>
	    		<div id="memberprofile-box-info">
	    			<div id="memberprofile-box-info1"><p>홍길동님 <p></div>
	    			<div id="memberprofile-box-info2"><p>환영합니다. <p></div>
	    		</div>
	    	</div>
	    	<div id="memberevent-box">
	    		<div id="memberevent-box1" class="event-box">
	    			<h1>My Point</h1>
	    			<div id="event-box1-menu">
	    				<li>사용 가능한 포인트 : 1000 Point</li>
	    				<li>사용 가능한 쿠폰 : 0 개</li>
	    			</div>
	    		</div>
	    		
	    		<div id="memberevent-box2" class="event-box">
	    			<h1>수강 과목</h1>
    				<div id="event-box2-menu">
    					<li>수학의 정석1</li>
    					<li>컴퓨터활용능력 필기</li>
		    		</div>
			    </div>	    		
	    		<div id="memberevent-box3" class="event-box">
	    			
	    			<h3>무료 포인트까지...</h3>
	    			<div>
						<progress id="Number-applications" value="20" max="100"></progress>
					</div>
					<h4>10번 신청하면 한번이 무료!</h4>
	    		</div>
	    	</div>
	    </div>
    </div>  
    <div class=Blank></div>
    <div id="Mypage">
    	<div id="Mypage-sideBar">
	    	<nav>
				<ul id="Mypage-sideBar-menu">
					<li><a href="#"><img src="image/right.png" class="right-icon">MY PAGE</a></li>
					<li><a href="#"><img src="image/right.png" class="right-icon">내 정보</a></li>
					<li><a href="#"><img src="image/right.png" class="right-icon">내 활동목록</a></li>
					<li><a href="#"><img src="image/right.png" class="right-icon">포인트 관리</a></li>
					<li><a href="#"><img src="image/right.png" class="right-icon">구매/판매 목록</a></li>
				</ul>
			</nav>
    	</div>
    	<div id="Mypage-main">
    	
    	</div>
    </div>
     	
</body>
</html>