<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/gotid.css" />
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title> 아이디찾기 </title>
<script>
	$(document).ready(function() {
		$('.log-btn').click(function() {
			$('.log-status').addClass('wrong-entry');
			$('.alert').fadeIn(500);
			setTimeout("$('.alert').fadeOut(1500);", 3000);
		});
		$('.form-control').keypress(function() {
			$('.log-status').removeClass('wrong-entry');
		});
	});
</script>
</head>

<body>
	<div class="login-form" id="app">
		<div v-if="!idCheck">
			<h1> 아이디 찾기 </h1>
			<div class="form-group ">
				<input type="text" class="form-control" placeholder="이름 " id="name" v-model="name" name="name">
				<i class="fa fa-user"></i>
			</div>
			<div class="form-group log-status">
				<input type="password" class="form-control" placeholder="이메일" id="email" name="email" v-model="email">
				<i class="fa fa-lock"></i>
			</div>
			<div class="gender">
				<label> 성별 </label>
				<select name="gender" id="gender" v-model="gender">
					<option value="남"> 남성 </option>
					<option value="여"> 여성 </option>
				</select>
			</div>
			<a class="link" href="gotpw"> 비밀번호 찾기 </a>
			<button type="button" class="log-btn" @click="fngetid"> 아이디 찾기 </button>
		</div>
		<div v-if="idCheck">
			<span> 아이디: {{findid}}</span>
			<button type="button" class="log-btn" @click="fnCheck"> 돌아가기 </button>
		</div>
	</div>
</body>

<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			name : "",
			email : "",
			gender : "",
			idCheck : false,
			findid : ""
		}
		,
		methods : {
			fngetid : function() {
				var self = this;
				var send = {
					name : this.name,
					email : this.email,
					gender : this.gender
				};
				$.ajax({
					url : "/getid.dox",
					dataType : "json",
					type : "POST",
					data : send,
					success : function(data){
						if(data.result == "success"){
							self.idCheck = true;
							self.findid = data.findid;
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
</html>
