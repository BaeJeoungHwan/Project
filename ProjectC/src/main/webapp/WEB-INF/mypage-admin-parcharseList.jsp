<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/mypage-admin-parcharseList.css"/>
<meta charset="UTF-8">
<title> 관리자 - 구매 신청 내역 </title>
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
    		<p> 구매 신청 내역 </p>
    		<div id="point-list">
	    		<table class="point-table">
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
							<td>{{item.MentorName}}</td>
							<td>{{item.OrderTime}}</td>
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
			selectedItemList : []
		}
		, methods : {
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
			, fnPurchaseGetList : function(){
			var self = this;
			var nparmap;/*  = {membernum : self.num}; */
			$.ajax({
				url : "/fnPurchaseGetList.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.list;
				}
			});
		} 
		}
		, created: function () {
			this.fnGetList();
			this.fnPurchaseGetList();
	}
});
</script>			
</html>
