<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/mypage-point.css"/>
<link rel="stylesheet"  href="css/swiper.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title> 마이페이지 - 포인트 </title>
<jsp:include page="/WEB-INF/menubar.jsp"></jsp:include>
<%
	int num = Integer.parseInt(String.valueOf(session.getAttribute("memberNumSession")));
%>
</head>
<body>
<div id="app">
    <div id="memberinfo">
	    <div id="info">
	    	<div id="memberprofile-box">
	    		<div id="memberprofile-box-img">
	    			<img src="image/profile.png" width="120" height="120">
	    		</div>
	    		<div id="memberprofile-box-info">
	    			<div id="memberprofile-box-info1"><p>{{info.MemberName}} 님<p></div>
	    			<div id="memberprofile-box-info2"><p>환영합니다. <p></div>
	    		</div>
	    	</div>
	    	<div id="memberevent-box">
	    		<div id="memberevent-box1" class="event-box">
	    			<h1>My Point</h1>
	    			<div id="event-box1-menu">
	    				<li>사용 가능한 포인트 : <a style="float:right; width:40%">{{info.MemberPoint}} Point</a></li>
	    				<li>사용 가능한 쿠폰 : <a style="float:right; width:40%">0 개</a></li>
	    			</div>
	    		</div>
	    		
	    		<div id="memberevent-box2" class="event-box">
	    			<h1>수강 과목</h1>
    				<div id="event-box2-menu">
    					<li>수학의 정석1</li>
    					<li>컴퓨터활용능력 필기</li>
		    		</div>
			    </div>	    		
	    		<div id="memberevent-box2" class="event-box">
	    			<h1> 포인트 충전하기 </h1>
	    			<div class="pointbtnbox1">
	    				<button @click="fn1btn" id="pointbtn1">10,000</button>
	    				<button @click="fn2btn" id="pointbtn1">20,000</button>
	    				<button @click="fn3btn" id="pointbtn1">30,000</button>
	    				<button @click="fn4btn" id="pointbtn1">50,000</button>
	    				<button @click="fn5btn" id="pointbtn1">100,000</button>
    				</div>
	    			<div class="pointbtnbox1">
	    				<input type="text" v-model="orderpoint" name="orderpoint" id="orderpoint" placeholder="충전 금액 입력">
	    				<button @click="fnorderpoint" class="btn-candy">충전신청</button>
					</div>
	    		</div>
	    	</div>
	    </div>
    </div>  
    <div class=Blank></div>
    <div id="Mypage">
    	<div id="Mypage-sideBar">
	    	<nav>
				<ul id="Mypage-sideBar-menu">
					<li> MY PAGE </li>
					<li><a href="info.do"><img src="image/right.png" class="right-icon"> 내 정보 </a></li>
					<li><a href="mypage-activityList"><img src="image/right.png" class="right-icon"> 내 활동목록 </a></li>
					<li><a href="mypage-point"><img src="image/right.png" class="right-icon"> 포인트 관리 </a></li>
					<li><a href="mypage-buy-sell-List"><img src="image/right.png" class="right-icon"> 구매/판매 목록 </a></li>
				</ul>
			</nav>
    	</div>
    	<div id="Point-main">
    		<p> 내 포인트 관리 </p>
    		<div id="showpoint">
    			<div id="point">
    				<p> {{info.MemberName}}님의 보유 포인트: <a href="#">{{info.MemberPoint}} point </a></p>
    			</div>
    			<div >
    				<h1>포인트충전</h1>
    					<p style="font-size: 20px;">충전 신청 후 계좌이체를 통해 입금 확인 후 포인트 충전을 완료 하실 수 있습니다.</p>
    				<div id="pointsavebox">
    					<input type="text" v-model="orderpoint" name="orderpoint" id="orderpoint" placeholder="충전 금액 입력" style="height : 25px;">
	    				<button @click="fnorderpoint" class="btn-candy">충전신청</button>
	    			</div>
	    			<div class="pointbtnbox">
	    				<button @click="fn1btn" id="pointbtn">10,000</button>
	    				<button @click="fn2btn" id="pointbtn">20,000</button>
	    				<button @click="fn3btn" id="pointbtn">30,000</button>
	    				<button @click="fn4btn" id="pointbtn">50,000</button>
	    				<button @click="fn5btn" id="pointbtn">100,000</button>
    				</div>
    			</div>
    		</div>
    		<p> 포인트 샵 </p>
    		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide"><a href="#"><img src="image/point/img1.jpg" width="210" height="143.86"></a></div>
				<div class="swiper-slide"><a href="#"><img src="image/point/img2.jpg" width="210" height="143.86"></a></div>
				<div class="swiper-slide"><a href="#"><img src="image/point/img3.jpg" width="210" height="143.86"></a></div>
				<div class="swiper-slide"><a href="#"><img src="image/point/img4.jpg" width="210" height="143.86"></a></div>
				<div class="swiper-slide"><a href="#"><img src="image/point/img5.jpg" width="210" height="143.86"></a></div>
				<div class="swiper-slide"><a href="#"><img src="image/point/img6.jpg" width="210" height="143.86"></a></div>
				<div class="swiper-slide"><a href="#"><img src="image/point/img7.jpg" width="210" height="143.86"></a></div>
				<div class="swiper-slide"><a href="#"><img src="image/point/img8.jpg" width="210" height="143.86"></a></div>
				<div class="swiper-slide"><a href="#"><img src="image/point/img9.jpg" width="210" height="143.86"></a></div>
				<div class="swiper-slide"><a href="#"><img src="image/point/img10.jpg" width="210" height="143.86"></a></div>
				<div class="swiper-slide"><a href="#"><img src="image/point/img11.jpg" width="210" height="143.86"></a></div>
				<div class="swiper-slide"><a href="#"><img src="image/point/img12.jpg" width="210" height="143.86"></a></div>
				<div class="swiper-slide"><a href="#"><img src="image/point/img13.jpg" width="210" height="143.86"></a></div>
				<div class="swiper-slide"><a href="#"><img src="image/point/img14.jpg" width="210" height="143.86"></a></div>
				<div class="swiper-slide"><a href="#"><img src="image/point/img15.jpg" width="210" height="143.86"></a></div>
			</div>	
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-pagination"></div>
		</div>
   	</div>
   </div>
</div>	
<script>
new Swiper('.swiper-container', {

	slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 30, // 슬라이드간 간격
	slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

	// 그룹수가 맞지 않을 경우 빈칸으로 메우기
	// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
	loopFillGroupWithBlank : true,

	loop : true, // 무한 반복

	pagination : { // 페이징
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});
</script>
</body>
</html>

<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	list : [],
    	num : <%=num%>,
    	info : {},
    	email : "",
    	phone : "",
    	orderpoint : ""
    }   
    , methods: {
    	fnGetList : function(){
    		var self = this;
	      	var nparmap = {membernum : self.num};
	        $.ajax({
	            url:"/info.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {            
		           	 self.info = data.list;
	            }
	        }); 
    	}
    
    , fnorderpoint : function(){
		var self = this;
		var nparmap = { membernum : self.num , orderpoint : self.orderpoint }
		$.ajax({
			url : "/orderpoint.dox",
			dataType : "json",
			type : "POST",
			data : nparmap,
			success : function(data) {
				alert("충전신청 완료");
				window.open('point','point','width=400, height=280');
			}
		});
	}
    , fn1btn : function(){
    	$('input[name=orderpoint]').attr('value',"10000");
    }
    , fn2btn : function(){
    	$('input[name=orderpoint]').attr('value',"20000");
    }
    , fn3btn : function(){
    	$('input[name=orderpoint]').attr('value',"30000");
    }
    , fn4btn : function(){
    	$('input[name=orderpoint]').attr('value',"50000");
    }
    , fn5btn : function(){
    	$('input[name=orderpoint]').attr('value',"100000");
    }
 }
    , created: function () {
    	this.fnGetList();
	}
});
</script>