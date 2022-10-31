<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> board_d </title>
<link rel="stylesheet" href="/css/board_d.css">
<jsp:include page="/WEB-INF/menubar.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>

<body>
	<div id="app">
		<div class="app-container">
			<div class="app-content">
				<div class="projects-section">
					<div class="projects-section-header">
					  <p> 게시글 </p>
					</div>
					<div class="project-box">
					  <div class="project-box-header">
					  	<div class="header"> 제목: {{info.BoardT}} </div>
					  	<div class="w_id" style="text-align:right"> 조회수 {{info.BoardCnt}} </div>
					  </div>
					  <div class="project-box-content">
					    <div class="container">{{info.BoardM}}</div>
					  </div>
					</div>
					<div class="projects-section-footer">
						<button @click="fnRemove" class="delete"> 삭제 </button>
						<button @click="fnList" class="add"> 목록 </button>
					</div>
				</div>
				<div class="messages-section">
			    <div class="projects-section-header">
			      <p> 댓글 </p>
			    </div>
			    <div class="messages">
			      <div class="container">
				      <div class="message-box" v-for="(item, index) in commentList">
				        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
				        	<!--! Font Awesome Pro 6.2.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
				        	<path d="M144.4 208C144.4 190.3 158.7 176 176.4 176C194 176 208.4 190.3 208.4 208C208.4 225.7 194 240 176.4 240C158.7 240 144.4 225.7 144.4 208zM368.4 208C368.4 225.7 354 240 336.4 240C318.7 240 304.4 225.7 304.4 208C304.4 190.3 318.7 176 336.4 176C354 176 368.4 190.3 368.4 208zM328 328C341.3 328 352 338.7 352 352C352 365.3 341.3 376 328 376H184C170.7 376 160 365.3 160 352C160 338.7 170.7 328 184 328H328zM512 256C512 397.4 397.4 512 256 512C114.6 512 0 397.4 0 256C0 114.6 114.6 0 256 0C397.4 0 512 114.6 512 256zM256 464C370.9 464 464 370.9 464 256C464 141.1 370.9 48 256 48C141.1 48 48 141.1 48 256C48 370.9 141.1 464 256 464z"/>
				        </svg>
				        <div class="message-content">
				          <div class="message-header">
				            <div class="name">{{item.CommentM}}</div>
				            <div class="star-checkbox">
				              <input type="checkbox" id="star-4">
				              <label for="star-4">
				                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star">
				                  <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" />
				                </svg>
				              </label>
				            </div>
				          </div>
				          <p class="message-line"> {{item.CommentDate}} </p>
				      </div>
			      </div>
			    </div>
			    <div class="projects-section-footer">
					  <input type="text" name="content" v-model="comment" placeholder=" 댓글 ">
					  <button class="add" @click="fnCommentadd"> 등록 </button>
				</div>
			  </div>
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
	       , info : {}
	       , num : "${map.BoardNum}"
	       , comment: ""
	       , commentList : []
	    }   
	    , methods: {
	    	fnGetBoard : function(){
	            var self = this;
	            var nparmap = { BoardNum : self.num };
	            $.ajax({
	                url:"/boardview.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                                       
	                	self.info = data.board;
	                	self.commentList = data.commentList;
	                	console.log(self.commentList);
	                }
	            }); 
	        }
	    , fnList : function() {
            location.href = "/board.do";
        }
        , fnRemove : function() {
            var self = this;
            if(confirm("정말 삭제하시겠습니까?")){
                var nparmap = { BoardNum : self.num };
                $.ajax({
                    url : "/boardremove.dox",
                    dataType : "json",
                    type : "POST",
                    data : nparmap,
                    success : function(data) {
                        alert("삭제되었습니다.");
                        self.fnList();
                    }
                });
            }
        }
        , fnCommentadd : function(){
    		var self = this;
	      	var nparmap = { comment : self.comment, boardNum : self.num };
	      	if(confirm("댓글을 등록하시겠습니까?")){
		        $.ajax({
		            url:"/commentadd.dox",
		            dataType:"json",	
		            type : "POST", 
		            data : nparmap,
		            success : function(data) {
		           	 	self.comment = "";
		           	 	self.fnGetBoard();
		            }
		        }); 
	      	}
    	}
    }
    , created: function () {
        var self = this;
        self.fnGetBoard();
    }
});
</script>

