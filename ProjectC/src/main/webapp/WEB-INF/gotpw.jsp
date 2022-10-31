<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/gotid.css" />
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title> 비밀번호 찾기 </title>
<script>
	$(document).ready(function(){
	    $('.log-btn').click(function(){
	        $('.log-status').addClass('wrong-entry');
	       $('.alert').fadeIn(500);
	       setTimeout( "$('.alert').fadeOut(1500);",3000 );
	    });
	    $('.form-control').keypress(function(){
	        $('.log-status').removeClass('wrong-entry');
	    });
	});
</script>
</head>

<body>
	<div class="login-form" id="app">
		<div v-if="!pwCheck">
			<h1> 비밀번호 찾기 </h1>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="아이디" id="id" name="id" v-model="id">
				<i class="fa fa-user"></i>
			</div>
			<div class="form-group log-status">
				<input type="text" class="form-control" placeholder="이름" id="name" name="name" v-model="name">
				<i class="fa fa-lock"></i>
			</div>
			<div class="form-group log-status" style="margin-bottom: 0px;">
				<input type="text" class="form-control" placeholder="이메일" id="email" name="email" v-model="email" >
				<i class="fa fa-lock"></i>
			</div>
			<a class="link" href="#"> 고객센터 </a>
			<button type="button" class="log-btn" @click="fngetpw" > 비밀번호 찾기 </button>
		</div>
     	<div v-if="pwCheck">
			<span>아이디 : {{findpw}}</span>
			<button type="button" class="log-btn" @click="fnCheck"> 돌아가기 </button>
		</div>
   </div>
</body>
</html>

<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			id : "",
			name : "",
			email : "",
			pwCheck : false,
			findpw : ""
		}
		,
		methods : {
			fngetpw : function() {
				var self = this;
				var send = {
					id : this.id,
					name : this.name,
					email : this.email
				};
				
				$.ajax({
					url : "/getpw.dox",
					dataType : "json",
					type : "POST",
					data : send,
					success : function(data) {
						if(data.result == "success"){
							alert("비밀번호찾기 성공");
							self.pwCheck = true;
							self.findpw = data.findpw;
						} else {
							alert(data.msg);	
						}
					}
				});
			}
			, fnCheck : function(){
				var self = this;
				location.href="/login.do";
			}
		},
		created : function() {

		}
	});
</script>
