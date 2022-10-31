<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원가입 </title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="css/Join.css" />
<jsp:include page="/WEB-INF/menubar.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>

<body>
	<div class="row" id="app">
		<div class="col-md-12">
			<form action="#">
				<h1> 회원 가입 </h1>
				<div class="checkbox">
					<input type="text" name="id" placeholder="아이디(4~15자리)" id="id" v-model="id">
					<button type="button" class="checkbtn" onclick="checkId()"> 중복 확인 </button>
				</div>
				<input type="password" name="password" placeholder="비밀번호(문자,숫자 8~20자리)" id="password" v-model="password">
				<input type="password" name="password2" placeholder="비밀번호 재입력" id="password2" v-model="password2">
				<div class="checkbox">
					<input type="text" name="email" placeholder="이메일" id="email" v-model="email">
				 	<input type="text" name="name" placeholder="이름" id="name" v-model="name">
				</div> 
				<input type="text" name="phone" placeholder="('-'제외 11자리)" id="phone" v-model="phone">
				<div> 
					<label> 지역 선택 </label>
						<select name="region" id="region"  v-model="region">
							<option value="1"> 서울 </option>
							<option value="2"> 경기 인천 </option>
							<option value="3"> 충남 </option>
							<option value="4"> 충북 </option>
							<option value="5"> 전남 </option>
							<option value="6"> 전북 </option>
							<option value="7"> 경북 </option>
							<option value="8"> 경남 </option>
							<option value="9"> 부산 </option>
							<option value="10"> 울산 </option>
							<option value="11"> 대구 </option>
							<option value="12"> 광주 </option>
							<option value="13"> 강원 </option>
							<option value="14"> 제주 </option>
						</select><br> 
				</div>
				<div>
					<label> 성별 선택 </label> 
						<select  name="gender" id="gender" v-model="gender">
							<option value="남"> 남성 </option>
							<option value="여"> 여성 </option>
					    </select><br> 
				</div>
				<div>   
					<label> 멘티 * 멘토 선택 </label> 
						<select name="select" id="select" v-model="select" >
							<option value="T"> 멘토(Mentor) </option>
							<option value="S"> 멘티(Mentee) </option>
						</select>
				</div>
			</form>
			<div class="sing">
				<button class="singbutton" @click="fncheck"> 가입하기 </button>
			</div>
		</div>
	</div>
</body>
</html>

<script type="text/javascript">
	function checkId() {
		var id = $('#id').val();
	    if (id != undefined && id != "") {
	    	$.ajax({
	    		url : '/selectId.dox',
	    		type : 'post',
	    		data : { id : id }
	    	, success : function(cnt) {
	    		if (cnt == 0) {
	    			alert("사용가능한 아이디입니다.");
	    		} else {
	    			alert("존재하는 아이디입니다.");
	                $('#id').val('');
	            }
	    	}
	    	, error : function() {
	    		alert("에러입니다");
	    	}});
	    } else {
	       alert("아이디를 입력해주세요.");
	    }
	};
	var app = new Vue({
		el: '#app',
	    data: {
	    	id  : ""
	      , password  : ""
	      , email  : ""
	      , name  : ""
	   	  , phone : ""
		  , region  : ""
		  , gender  : ""
		  , select : ""
		  , password2 : ""
		}
		, methods: {
			fncheck : function(){
				var self = this;
				var nparmap = { id : self.id, password : self.password,
						email : self.email, name : self.name, phone : self.phone,
						region : self.region, gender : self.gender,
						select : self.select };
				//문자숫자 4~15
		      	var idreg = /^[a-zA-Z0-9]{4,15}$/;
		      	//문자숫자 8~20
		      	var pwreg = /^[A-Za-z0-9]{8,20}$/;
		      	//이메일 @
		      	var mailreg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
		      	//한글 2 ~ 5
		      	var namereg = /^[가-힣]{2,5}$/;
		      	//전화번호(숫자) 10~11
		      	var phonereg = /^[0-9]{10,11}$/;
		
		      	if(this.id == "" || this.id == undefined || !idreg.test(this.id)){
		      		alert("아이디를 다시 입력해주세요");
		      		return false;
		      	}
		      	
		   		if(this.password == "" || this.password == undefined || !pwreg.test(this.password)){
		   			alert("비밀번호를 다시 입력해주세요");
		   			return false;
		   		} 
		     		
				if(this.password2 != this.password){
					alert("재입력 비밀번호를 확인해주세요");
					return false;
				}
		     		
				if(this.email == "" || this.email == undefined || !mailreg.test(this.email)){
					alert("이메일을 다시 입력해주세요");
					return false;
		    	}
		     		
		 		if(this.name == "" || this.name == undefined || !namereg.test(this.name)){
					alert("이름을 다시 입력해주세요");
					return false;
				}
		 			
		 		if(this.phone = "" || this.phone == undefined || !phonereg.test(this.phone)){
					alert("전화번호를 다시 입력해주세요");
					return false;
				}
		 		if(this.region == ""){
					alert("지역을 다시 선택해주세요");
					return false;
				}
		 		if(this.gender == ""){
					alert("지역을 다시 선택해주세요");
					return false;
				}
		 		if(this.select == ""){
					alert("멘토 멘티를 선택해주세요")
					return false;
				} 
		 		
				$.ajax({
		        url:"/join.dox",
			    dataType:"json",	
			    type : "POST", 
			    data : nparmap,
			    success : function(data) {
			    	if(self.select=="T"){
			    		alert("멘토 상세 정보를 입력해주세요.");
			  	 		location.href="join-detail?memberid=" + self.id;
			  	 	} else {
			  	 		alert("가입되었습니다.");
			  	 		location.href="/";	
			  	 	}
			    }});
			}
		}
		, created: function () {
		    	
		}
	});
</script>
