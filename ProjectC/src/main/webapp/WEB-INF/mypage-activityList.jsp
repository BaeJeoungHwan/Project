<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/mypage-activityList.css"/>
<meta charset="UTF-8">
<title> 마이페이지-활동목록 </title>
<jsp:include page="/WEB-INF/menubar.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
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
	    			<div id="memberprofile-box-info1"><p> {{info.MemberName}} 님 <p></div>
	    			<div id="memberprofile-box-info2"><p> 환영합니다. <p></div>
	    		</div>
	    	</div>
	    	<div id="memberevent-box">
	    		<div id="memberevent-box1" class="event-box">
	    			<h1> My Point </h1>
	    			<div id="event-box1-menu">
	    				<li> 사용 가능한 포인트 : <a style="float:right; width:40%"> {{info.MemberPoint}} Point </a></li>
	    				<li> 사용 가능한 쿠폰 : <a style="float:right; width:40%"> 0 개 </a></li>
	    			</div>
	    		</div>
	    		<div id="memberevent-box2" class="event-box">
	    			<h1> 수강 과목 </h1>
    				<div id="event-box2-menu">
    					<li> 수학의 정석1 </li>
    					<li> 컴퓨터활용능력 필기 </li>
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
					<li><a href="info.do"><img src="image/right.png" class="right-icon"> 내 정보 </a></li>
					<li><a href="mypage-activityList"><img src="image/right.png" class="right-icon"> 내 활동목록 </a></li>
					<li><a href="mypage-point"><img src="image/right.png" class="right-icon"> 포인트 관리 </a></li>
					<li><a href="mypage-buy-sell-List"><img src="image/right.png" class="right-icon"> 구매/판매 목록 </a></li>
				</ul>
			</nav>
    	</div>
    	<div id="activity-main">
    		<p> 내 활동목록 </p>
    		<div id="activity-list">
	    		<table class="activity-table">
		    		<thead>
		    			<tr>
		    				<th width="12%"> 글 번호 </th>
		    				<th> 제목 </th>
		    				<th> 내용 </th>
		    				<th width="15%"> 날짜 </th>
			    			<th width="13%"> 조회수 </th>
			    		</tr>
			    	</thead>
			    	<tbody>
			    		<tr v-for="(item, index) in list">
			    			<td>{{item.BoardNum}}</td>
			    			<td><a href="javascript:;" @click="fnView(item)">{{item.BoardT}}</a></td>
							<td><a href="javascript:;" @click="fnView(item)">{{item.BoardM}}</a></td>
							<td>{{item.BoardDate}}</td>
							<td>{{item.BoardCnt}}</td>
						</tr>
			    	</tbody>
		    	</table>
		    </div>
    	</div>
    </div>
</div>     	
</body>

<script type="text/javascript">
var app = new Vue({
		el : '#app',
		data : {
			list : [],
			num : <%=num%>,
			info : {},
			check : [],
			selectedItemList : [],
			orderpoint : ""
		},
		methods : {
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
			, fnActGetList : function() {
				var self = this;
				var nparmap = {membernum : self.num};
				$.ajax({
					url : "/activityboard.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
					}
				});
			}, fnorderpoint : function(){
				var self = this;
				var nparmap = { membernum : self.num , orderpoint : self.orderpoint }
				$.ajax({
					url : "/orderpoint.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						alert("충전신청 완료");
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
			, fnView : function(item) {
	            var self = this;
	            self.pageChange("/boardview.do", {
	                BoardNum : item.BoardNum
	            });
	        }
			, pageChange : function(url, param) {
				var target = "_self";
				if (param == undefined) {
					return;
				}
				var form = document.createElement("form");
				form.name = "dataform";
				form.action = url;
				form.method = "post";
				form.target = target;
				for ( var name in param) {
					var item = name;
					var val = "";
					if (param[name] instanceof Object) {
						val = JSON.stringify(param[name]);
					} else {
						val = param[name];
					}
					var input = document.createElement("input");
					input.type = "hidden";
					input.name = item;
					input.value = val;
					form.insertBefore(input, null);
				}
				document.body.appendChild(form);
				form.submit();
				document.body.removeChild(form);
			}  
		}
		, created: function () {
			this.fnGetList();
			this.fnActGetList();
	}
});
</script>			
</html>
