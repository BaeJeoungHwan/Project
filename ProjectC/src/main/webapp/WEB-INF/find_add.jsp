<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공고상세정보</title>
<link rel="stylesheet" href="/css/find_add.css">
<jsp:include page="/WEB-INF/menubar.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="js/jquery.js"></script>
<%
    int num = Integer.parseInt(String.valueOf(session.getAttribute("memberNumSession")));
%>
</head>
<body>
	<div class="app-container" id="app">
		<div class="h1box">
			<h1>멘토 등록</h1>
		</div>
		<div class="projects-section">
			<div class="projects-section-header">
				<p>작성하기</p>
			</div>
			<div class="project-box">
				<div class="project-box-header">
					<input type="text" name="title" placeholder="제목" id="title" v-model="title">
				</div>
				<div class="project-box-content">
					<textarea class="container" name="content" placeholder="내용" id="content" v-model="content"></textarea>
				</div>
			</div>
			<div class="projects-section-footer">
				<button @click="fnList" class="addbtn">목록으로</button>
				<button @click="fnSave" class="addbtn">등록</button>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
       list : [] 
       , selectedItemList : []
       , content : ""
       , title : ""
    }   
    , methods: {
    	fnSave : function(){
    		var self = this;
	      	var nparmap = {title : self.title, content : self.content, membernum : <%=num%> };
	        $.ajax({
	            url:"/findadd.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {            
	           	 	alert("등록되었습니다.");
	           		location.href="/findboard.do";
	            }
	        }); 
    	}
	    , fnList : function(){
			location.href="/findboard.do";
		}
    }   
    , created: function () {
    	
	}
});
</script>