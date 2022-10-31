<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/login.css" />
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title> 로그인 </title>
<%String num = String.valueOf(session.getAttribute("memberNumSession"));%>
</head>
<body>
<script>
	$(document).ready(function(){
		if(<%=num%> != null){
			opener.location.reload();
			window.close();	
		}
	});
</script> 
 <div class="login-form">
     <img class="login-logo" src="image/logo.png">
     <p class="login"></p>
     <form action="login.dox" method="post">
	     <div class="form-group ">
	       <input type="text" class="form-control" placeholder="아이디 " name="MemberId">
	       <i class="fa fa-user"></i>
	     </div>
	     <div class="form-group log-status">
	       <input type="password" class="form-control" placeholder="비밀번호" name="MemberPasswd">
	       <i class="fa fa-lock"></i>
	     </div>
     	<a class="link" href="gotid"> 아이디 찾기 </a>
     	<a class="link" style="margin-left:10px" href="gotpw"> 비밀번호 찾기 </a>
     	<input type="submit" class="log-btn" value=" 로그인 "></input>
     </form>
   </div>
</body>
</html>
