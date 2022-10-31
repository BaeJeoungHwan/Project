<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> board_add </title>
<link rel="stylesheet" href="/css/board_add.css">
<jsp:include page="/WEB-INF/menubar.jsp"></jsp:include>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>

<body>
	<div id="app">
		<div class="app-container">
			<div class="h1box">
				<h1> 게시글 등록s </h1>
			</div>
			<div class="projects-section">
				<div class="projects-section-header">
				  <p> 작성하기 </p>
				</div>
				<div class="project-box">
				  <div class="project-box-header">
				    <input type="text" name="content-header" v-model="title" placeholder=" 제목 ">
				  </div>
				  <div class="project-box-content">
				    <textarea class="container" v-model="content" placeholder=" 내용 "></textarea>
				  </div>
				</div>
				<div class="projects-section-footer">
				  <button @click="fnSave" class="add"><a href="board"> 등록 </a></button>
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
	       list : [] 
	       , selectedItemList : []
	       , content : ""
	       , title : ""
	       , membernum : ""
	    }   
	    , methods: {
	    	fnSave : function(){
	    		var self = this;
		      	var nparmap = {title : self.title, content : self.content, membernum : self.membernum};
		        $.ajax({
		            url:"/boardadd.dox",
		            dataType:"json",	
		            type : "POST", 
		            data : nparmap,
		            success : function(data) {
		           	 	alert("저장되었습니다.");
		           		location.href="/board.do";
		            }
		        }); 
	    	}
		    , fnList : function(){
				location.href="/board.do";
			}
	    }   
	    , created: function () {
	    	
		}
	});
</script>