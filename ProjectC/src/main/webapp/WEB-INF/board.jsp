<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
<link rel="stylesheet" href="/css/board.css">
<jsp:include page="/WEB-INF/menubar.jsp"></jsp:include>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
	<div id="app">
		<div class="app-container">
			<div class="app-content">
				<div class="projects-section">
					<div class="projects-section-header">
						<p> board </p>
						<button class="add" @click="fnAdd"> 등록하기 </button>
					</div>
					<div class="project-boxes jsGridView">
						<div class="message-box" v-for="(item, index) in list">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
				        	<!--! Font Awesome Pro 6.2.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
				        	<path d="M144.4 208C144.4 190.3 158.7 176 176.4 176C194 176 208.4 190.3 208.4 208C208.4 225.7 194 240 176.4 240C158.7 240 144.4 225.7 144.4 208zM368.4 208C368.4 225.7 354 240 336.4 240C318.7 240 304.4 225.7 304.4 208C304.4 190.3 318.7 176 336.4 176C354 176 368.4 190.3 368.4 208zM328 328C341.3 328 352 338.7 352 352C352 365.3 341.3 376 328 376H184C170.7 376 160 365.3 160 352C160 338.7 170.7 328 184 328H328zM512 256C512 397.4 397.4 512 256 512C114.6 512 0 397.4 0 256C0 114.6 114.6 0 256 0C397.4 0 512 114.6 512 256zM256 464C370.9 464 464 370.9 464 256C464 141.1 370.9 48 256 48C141.1 48 48 141.1 48 256C48 370.9 141.1 464 256 464z"/>
				        </svg>
							<div class="message-content">
								<a href="javascript:;" @click="fnView(item)">
									<div class="message-header">
										<div class="name">{{item.BoardT}}</div>
										<div class="cnt">
											댓글 {{item.commentCnt}}
											조회수 {{item.BoardCnt}}											
										</div>
									</div>
									<p class="message-line"> {{item.BoardM}}</p>
									<p class="message-line time">{{item.BoardDate}}</p>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="messages-section">
					<div class="projects-section-header">
						<p> Mentor Ranking </p>
					</div>
					<div class="messages">
						<a href="javascript:;" @click="fnMentorView(item)">
							<div class="message-box" v-for="(item, index) in mlist">
								<div class="r"> {{index + 1}} </div>
								<div class="message-content">
									<div class="message-header">
										<div class="name"> {{item.MemberId}} </div>
										<div class="star-checkbox">
											<input type="checkbox" id="star-2">
											<label for="star-2">
												<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
													viewBox="0 0 24 24" fill="none" stroke="currentColor"
													stroke-width="2" stroke-linecap="round"
													stroke-linejoin="round" class="feather feather-star">
								                  <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" />
								                </svg>
											</label>
										</div>
									</div>
									<p class="message-line"> {{item.avg}} </p>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			list : [],
			mlist : [],
			selectedItemList : []
		},
		methods : {
			fnGetList : function() {
				var self = this;
				var nparmap = {};
				$.ajax({
					url : "/board.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
						self.mlist = data.mlist;
						console.log(self.list);
					}
				});
			}
			, fnMentorView : function(item) {
				var self = this;
				self.pageChange("./Mentorview.do", {
					MemberId : item.MemberId
				});
			}
			// 상세 
	        , fnView : function(item) {
	            var self = this;
	            self.pageChange("/boardview.do", {
	                BoardNum : item.BoardNum
	            });
	        }
	        // 추가
	        , fnAdd : function() {
	            var self = this;
	            self.pageChange("/boardadd.do", {});
	        }
	        , pageChange : function(url, param) {
				var target = "_self";
				if (param == undefined) {
					//	this.linkCall(url);
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
			this.fnGetList();       
		}
	});
</script>