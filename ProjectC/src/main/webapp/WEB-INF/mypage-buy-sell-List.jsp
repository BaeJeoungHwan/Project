<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/mypage-buy-sell-List.css"/>
<meta charset="UTF-8">
<title> 마이페이지 - 구매/판매목록 </title>
<jsp:include page="/WEB-INF/menubar.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<%
	char select = (Character) session.getAttribute("SelectSession");
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
					<li> MY PAGE </li>
					<li><a href="info.do"><img src="image/right.png" class="right-icon">내 정보</a></li>
					<li><a href="mypage-activityList"><img src="image/right.png" class="right-icon">내 활동목록</a></li>
					<li><a href="mypage-point"><img src="image/right.png" class="right-icon">포인트 관리</a></li>
					<li><a href="mypage-buy-sell-List"><img src="image/right.png" class="right-icon">구매/판매 목록</a></li>
				</ul>
			</nav>
    	</div>
    	<div id="buy-sell-main">
    		<p>구매/판매 목록</p>
    		<div id="buy-sell-list">
	    		<table class="buy-sell-table">
		    		<thead>
		    			<tr>
		    				<th width="15%"> 신청인 </th>
		    				<th> 과목명 </th>
		    				<th width="15%"> 강사명 </th>
			    			<th width="20%"> 신청날짜 </th>
			    		</tr>
			    	</thead>
			    	<tbody>
			    		<tr v-for="(item, index) in list">
			    			<td>{{item.MenteeName}}</td>
			    			<td>{{item.FindName}}</td>
							<td>{{item.MentorName}}</a></td>
							<td>{{item.OrderTime}}</td>
						</tr>
			    	</tbody>
		    	</table>
		    </div>
    	</div>
    </div>
</div>
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
    	orderpoint: "",
    	select : '<%=select%>'
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
		           	 console.log(self.info)
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
	    , fnPurchaseGetList : function(){
			var self = this;
			var nparmap  = {membernum : self.num};
			if(self.select == 'T'){
				$.ajax({
					url : "/fnPurchaseGetList-sell.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
					}
				});
			}
			else{
				$.ajax({
					url : "/fnPurchaseGetList-buy.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
						console.log(self.list);
					}
				});
			}
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
    	this.fnPurchaseGetList();
	}
});
</script>