<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_add</title>
<link rel="stylesheet" href="/css/find_de.css">
<jsp:include page="/WEB-INF/menubar.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="js/jquery.js"></script>
</head>
<%
    int num = Integer.parseInt(String.valueOf(session.getAttribute("memberNumSession")));
%>
<body>
	<div class="app-container" id="app">
        <div class="h1box">
            <h1>공고 상세 페이지</h1>
        </div>
        <div class="projects-section">
            <div class="projects-section-header"></div>
            <div class="project-box">
                <div class="project-box-header">
                    <input type="text" v-model="info.FindName" name="Findname" style="width: 800px;"></div>
                    <div class="idbox">{{info.MemberId}}</div>
                </div>
                <div class="project-box-content">
                    <input type="text" v-model="info.FindM" name="Findm" class="container"></div>
                </div>
            <div class="projects-section-footer">
                <button @click="fnRemove" class="addbtn">글 삭제</button>
                <button @click="fnList" class="addbtn">목록으로</button>
                <button @click="fnfindUpdate">수정하기</button>
                <button @click="fnpurchaserequest" id="mentorbtn">신청</button>
            </div>
        </div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			list : [],
			info : {},
			idx : "${map.FindNum}",  
			num :<%=num%>,
			point : ""
		},
		methods : {
			fnGetFind : function() {
				var self = this;
				var nparmap = {
					FindNum : self.idx
				};
				$.ajax({
					url : "/findview.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.info = data.find;
					}
				});
			},
			fnList : function() {
				location.href = "/findboard.do";
			},
			fnRemove : function() {
				var self = this;
				if(confirm("정말 삭제하시겠습니까?")){
					var nparmap = { FindNum : self.idx };
					$.ajax({
						url : "/remove.dox",
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
			, fnfindUpdate : function(){
                var self = this;
                  var nparmap = self.info;
                $.ajax({
                    url:"/findupdate.dox",
                    dataType:"json",
                    type : "POST", 
                    data : nparmap,
                    success : function(data) {
                        alert("정보가 수정되었습니다")
                           self.info = data.list;
                           console.log(self.info);
                    }
                });
            }
			, fnpurchaserequest : function() {
                var self = this;
                var nparmap = { FindNum : self.idx, membernum : self.num };
                $.ajax({
                    url : "/fnpurchaserequest.dox",
                    dataType : "json",
                    type : "POST",
                    data : nparmap,
                    success : function(data) {
                        if(data.msg == "success"){
                        	self.fnminuspoint();
                        	self.fnList();
                        } else {
                        	alert("포인트 부족");
                        }
                        
                    }
                });
            }
			, fnminuspoint : function() {
                var self = this;
                var nparmap = { membernum : self.num, point : self.point };
                 $.ajax({
                    url : "/minuspoint.dox",
                    dataType : "json",
                    type : "POST",
                    data : nparmap,
                    success : function(data) {
                        alert("신청이 완료되었습니다.");
                    }
                }); 
            }
		},
		created : function() {
			var self = this;
			self.fnGetFind();
		}
	});
</script>
