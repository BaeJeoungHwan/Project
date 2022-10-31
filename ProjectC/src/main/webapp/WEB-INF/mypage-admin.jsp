<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/mypage-admin.css"/>
<meta charset="UTF-8">
<title> 관리자 - 회원 포인트 관리 </title>
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
	    			<div id="memberprofile-box-info1"><p>관리자 님<p></div>
	    			<div id="memberprofile-box-info2"><p> 환영합니다. <p></div>
	    		</div>
	    	</div>
	    </div>
    </div>  
    <div class=Blank></div>
    <div id="Mypage">
    	<div id="Mypage-sideBar">
	    	<nav>
				<ul id="Mypage-sideBar-menu">
					<li> 관리자 페이지 </li>
					<li><a href="info.do"><img src="image/right.png" class="right-icon"> 회원 포인트 관리 </a></li>
					<li><a href="PurchaseList.do"><img src="image/right.png" class="right-icon"> 구매 신청 내역 </a></li>
				</ul>
			</nav>
    	</div>
    	<div id="point-main">
    		<p> 회원 포인트 관리 </p>
    		<div class="savebox">
    		<input type="text" placeholder="포인트 입력" v-model="point" style="width : 120px;" id="point" name="point">
    		<button class="saveboxbtn"@click="fnPoint">충전</button>
    		</div>
    		<div id="point-list">
	    		<table class="point-table">
		    		<thead>
		    			<tr>
		    				<th width="5%"></th>
		    				<th width="12%"> ID </th>
		    				<th width="10%"> 이름 </th>
		    				<th width="15%"> 보유포인트 </th>
		    				<th width="15%"> 신청포인트 </th>
			    			<th width="13%"> 신청날짜 </th>
			    			
			    		</tr>
			    	</thead>
			    	<tbody>
			    		<tr v-for="(item, index) in list">
			    			<td><input type="radio" v-model="memberNum" v-bind:value="item.MemberNum" name="num" id="num"></td>
			    			<td>{{item.MemberId}}</td>
			    			<td>{{item.MemberName}}</td>
							<td>{{item.MemberPoint}}</td>
							<td>{{item.PointApp}}</td>
							<td>{{item.PointDate}}</td>
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
			item : {},
			num : <%=num%>,
			point : "",
			memberNum : 0
		}, 
		
		methods : {
			fnPointList : function(){
	    		var self = this;
		      	var nparmap;
		        $.ajax({
		            url:"/pointList.dox",
		            dataType:"json",	
		            type : "POST", 
		            data : nparmap,
		            success : function(data) {  
			           	 self.list = data.list;
			           	console.log(self.list);
			           	 
		            }
		        }); 
	    	}
		
			, fnPoint : function(){
	    		var self = this;
	    		console.log(self.memberNum);
		      	var nparmap = { point : self.point, memberNum : self.memberNum};
		         $.ajax({
		            url:"/pointsave.dox",
		            dataType:"json",	
		            type : "POST", 
		            data : nparmap,
		            success : function(data) {  
			           	alert("포인트 충전 완료");
			           	self.fnpointRemove();
		            }
		        }); 
				 
			}
			, fnpointRemove : function() {
				var self = this;
				console.log(self.memberNum);
				var nparmap = { memberNum : self.memberNum};
					$.ajax({
						url : "/pointremove.dox",
						dataType : "json",
						type : "POST",
						data : nparmap,
						success : function(data) {
							self.fnPointList();
						}
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
			this.fnPointList();
	}	
});
</script>			
</html>
