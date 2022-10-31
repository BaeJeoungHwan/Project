<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/mypage-myinfo.css" />
<meta charset="UTF-8">
<title>마이페이지 - 내정보</title>
<jsp:include page="/WEB-INF/menubar.jsp"></jsp:include>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<%
int num = Integer.parseInt(String.valueOf(session.getAttribute("memberNumSession")));
String id = String.valueOf(session.getAttribute("IdSession"));
String password = String.valueOf(session.getAttribute("pwdSession"));
String email = String.valueOf(session.getAttribute("EmailSession"));
int r_num = Integer.parseInt(String.valueOf(session.getAttribute("regionSession")));
String name = String.valueOf(session.getAttribute("NameSession"));
String phone = String.valueOf(session.getAttribute("PhoneSession"));
int point = Integer.parseInt(String.valueOf(session.getAttribute("PointSession")));
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
						<div id="memberprofile-box-info1">
							<p>{{info.MemberName}} 님
							<p>
						</div>
						<div id="memberprofile-box-info2">
							<p>환영합니다.
							<p>
						</div>
					</div>
				</div>
				<div id="memberevent-box">
					<div id="memberevent-box1" class="event-box">
						<h1>My Point</h1>
						<div id="event-box1-menu">
							<li>사용 가능한 포인트 : <a style="float: right; width: 40%">
									{{info.MemberPoint}} Point </a></li>
							<li>사용 가능한 쿠폰 : <a style="float: right; width: 40%"> 0 개
							</a></li>
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
						<h1>포인트 충전하기</h1>
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
						<li>MY PAGE</li>
						<li><a href="info.do"><img src="image/right.png"
								class="right-icon"> 내 정보 </a></li>
						<li><a href="mypage-activityList"><img
								src="image/right.png" class="right-icon"> 내 활동목록 </a></li>
						<li><a href="mypage-point"><img src="image/right.png"
								class="right-icon"> 포인트 관리 </a></li>
						<li><a href="mypage-buy-sell-List"><img
								src="image/right.png" class="right-icon"> 구매/판매 목록 </a></li>
					</ul>
				</nav>
			</div>
			<div id="Mypage-main">
				<fieldset>
					<legend> 내 정보 </legend>
					<form id="myinformation">
						<ul>
							<li><label> 이름: </label><input type="text" name="name"
								v-model="info.MemberName" disabled></li>
							<li><label> 아이디: </label><input type="text" name="id"
								v-model="info.MemberId" disabled></li>
							<li><label> 이메일: </label><input type="text" name="email"
								v-model="info.MemberEmail"></li>
							<li><label> 전화번호: </label><input type="text" name="phone"
								v-model="info.MemberPhone"></li>
							<li><label> 지역: </label><input type="text" name="region"
								v-model="info.ReName" disabled></li>
							<li><label> 성별: </label><input type="text" name="gender"
								v-model="info.MemberGender" disabled></li>
							<li><label> 보유 포인트: </label><input type="text" name="point"
								v-model="info.MemberPoint" disabled></li>
						</ul>
					</form>
				</fieldset>
				<div id="myinformation-btn">
					<button @click="fnDelete">탈퇴하기</button>
					<button @click="fnUpdate">수정하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			list : [],
			num :
<%=num%>
	,
			info : {},
			email : "",
			phone : "",
			orderpoint : ""
		},
		methods : {
			fnGetList : function() {
				var self = this;
				var nparmap = {
					membernum : self.num
				};
				$.ajax({
					url : "/info.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.info = data.list;
					}
				});
			},
			fnorderpoint : function() {
				var self = this;
				var nparmap = {
					membernum : self.num,
					orderpoint : self.orderpoint
				}
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
			},
			fnUpdate : function() {
				var self = this;
				var nparmap = self.info;
				$.ajax({
					url : "/infoupdate.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						alert("정보가 수정되었습니다")
						self.info = data.list;
					}
				});
			},
			fnDelete : function() {
				var self = this;
				if (confirm("정말 삭제하시겠습니까?")) {
					var nparmap = {
						membernum : self.num
					};
					$.ajax({
						url : "/infodelete.dox",
						dataType : "json",
						type : "POST",
						data : nparmap,
						success : function(data) {
							alert("그 동안 저희 사이트를 이용해주셔서 감사합니다.");
							location.href("/main");
						}
					});
				}
			}, fn1btn : function(){
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
		},
		created : function() {
			this.fnGetList();
		}
	});
</script>
