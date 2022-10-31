<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원가입 - 멘토 </title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="css/Join-detail.css" />
<jsp:include page="/WEB-INF/menubar.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<%
String memid = request.getParameter("memberid");
%>
</head>

<body>
	<div class="row" id="app">
		<div class="col-md-12">
			<form action="#">
				<h1> 멘토 상세 정보 </h1>
				<input type="text" name="career" placeholder="경력 사항" id="career" v-model="career">
				<input type="text" name="duty" placeholder="직업" id="duty" v-model="duty">
				<input type="text" name="company" placeholder="직장" id="company" v-model="company">
				<input type="text" name="opentalk" placeholder="오픈 톡 주소" id="opentalk" v-model="opentalk">
				<input type="text" name="introduce" placeholder="자기 소개" id="introduce" v-model="introduce">
				<div> 
					<label> 직종 선택 </label>
					<select name="job" id="job"  v-model="job" >
						<option value="1">경영.사무</option>
						<option value="2">마케팅.광고.홍보</option>
						<option value="3">IT.인터넷</option>
						<option value="4">디자인</option>
						<option value="5">무역.유통</option>
						<option value="6">영업.고객상담</option>
						<option value="7">서비스</option>
						<option value="8">연구개발.설계</option>
						<option value="9">생산.제조</option>
						<option value="10">교육</option>
						<option value="11">건설</option>
						<option value="12">의료</option>
						<option value="13">미디어</option>
						<option value="14">전문.특수직</option>
					</select><br> 
				</div>
				<div> 
					<label> 이미지 선택 </label>
						<div style="display: inline-flex; margin-left : 20px;">
							<input type="radio" v-model="img" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlP6NEiJVk43DcEvmo_hGPvS7kHHy-gu94bA&usqp=CAU">
							<br><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlP6NEiJVk43DcEvmo_hGPvS7kHHy-gu94bA&usqp=CAU" style="width: 80px;   height: 80px;">
							<div style="display: inline-flex; margin-left : 20px;">
							<input type="radio" v-model="img" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ36GcSU4IcsteY8PCI4rsstftgR1p2TCE60Q&usqp=CAU">
							<br><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ36GcSU4IcsteY8PCI4rsstftgR1p2TCE60Q&usqp=CAU" style="width: 80px;   height: 80px;">
							</div>
							<div style="display: inline-flex; margin-left : 20px;">
							<input type="radio" v-model="img" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsdSUOJwUa--fZQaisspnATEAXL-FlsX2aFA&usqp=CAU">
							<br><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsdSUOJwUa--fZQaisspnATEAXL-FlsX2aFA&usqp=CAU" style="width: 80px;   height: 80px;">
							</div>
							<div style="display: inline-flex; margin-left : 20px;">
							<input type="radio" v-model="img" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDtXTwXaT2cD2hJ343kFVl4WVao1hMBebKmw&usqp=CAU">
							<br><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDtXTwXaT2cD2hJ343kFVl4WVao1hMBebKmw&usqp=CAU" style="width: 80px;   height: 80px;">
							</div>
						</div>
				</div>
			</form>
			<div class="sing">
				<button class="singbutton"  @click="fnmentorcheck"> 가입하기 </button>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({ 
	    el: '#app',
	    data: {
	    	career  : ""
	      , duty  : ""
	      , company  : ""
	      , opentalk  : ""
	   	  , introduce : ""
	   	  , job : ""
	   	  , img : ""
	   	  , id :"<%= memid %>"
	    }   
	, methods: {
		fnmentorcheck : function(){
			var self = this;
	      	var nparmap = {
	      			career : self.career, duty : self.duty, company : self.company,
	      			opentalk : self.opentalk, introduce : self.introduce, id : self.id,
	      			job : self.job, img : self.img , img : self.img
	      	};
	
	      	if(this.career == "" || this.id == undefined){
	      		alert("경력을 다시 입력해주세요");
	      		return false;
	      	}
	      	if(this.duty == "" || this.id == undefined){
	      		alert("직업을 다시 입력해주세요");
	      		return false;
	      	}
	      	if(this.company == "" || this.id == undefined){
	      		alert("회사명을 다시 입력해주세요");
	      		return false;
	      	}
	      	if(this.opentalk == "" || this.id == undefined){
	      		alert("오픈톡 주소를 다시 입력해주세요");
	      		return false;
	      	}
	      	if(this.introduce == "" || this.id == undefined){
	      		alert("자기 소개를 다시 입력해주세요");
	      		return false;
	      	}
	      	if(this.job == "" || this.id == undefined){
	      		alert("직종을 다시 입력해주세요");
	      		return false;
	      	}
			$.ajax({
	        url:"/join-detail.dox",
		    dataType:"json",	
		    type : "POST", 
		    data : nparmap,
		    success : function(data) {
		  	 	alert("가입되었습니다.");
		  	 	location.href="/";
	          	}
	       	});        
		}
	}   
	    , created: function () {
	    	
		}
	});
</script>