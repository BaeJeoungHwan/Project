<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토 상세 정보</title>
<link rel="stylesheet" href="css/mentordetail.css" />
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="js/jquery.js"></script>
<jsp:include page="/WEB-INF/menubar.jsp"></jsp:include>
<style>
.reviewbox{
	position : relative;
	width : 980px;
}
.reviewbtnbox{
	position : absolute;
	right: 10px;
    top: 10px;
}
</style>
</head>

<body>
	<div class="profile" id="app">
		<div class=detailtext>
			<div class="div11">
			<img style="width:100%; height:100%;" v-bind:src="info.MentorImg" />
			</div>
			<div class="div12">
				<ul class="li1">
					<li class="proli">ID : {{info.MemberId}}</li>
					<li class="proli">직업 :{{info.MentorDuty}}</li>
					<li class="proli">경력 : {{info.MentorCareer}}</li>
					<li class="proli">회사 : {{info.MentorCompany}}</li>
					<li class="proli">평균점수 : {{info.avg}}</li>
				</ul>
			</div>
			<div class="div13">
				<button class="talkbtn">신청하기</button>
			</div>
			<div class="intro">
				<fieldset class="textarea">
					<legend>자기소개</legend>
					{{info.MentorIntr}}
				</fieldset>
<!-- 				<button class="talkbtn">수정하기</button>
				<button class="talkbtn">등록하기</button> -->
				<button @click="fnFList" class="talkbtn">목록으로</button> 
			</div>
			<fieldset class="comment">
				<legend>후기</legend>
					<table>
						<thead>
							<tr>
								<th >후기내용</th>
								<th >작성자</th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="(item, index) in reviewList">
								<td>{{item.ReviewM}}</td>
								<td style="text-align : center;">{{item.ReviewWriter}}</td>
							</tr>
						</tbody>
					</table>
			</fieldset>
			<div class="reviewbox">
				<input class="commentinput" type="text" placeholder="후기 작성(작성후 엔터)" name="review" v-model="review" v-on:keyup.enter="fnreivewadd">
				<div class="reviewbtnbox">
					<select class="selectbox" name="score" id="score" v-model ="score">  <!-- v-model="score" -->
								<option value=""> 점수선택</option>
								<option value="1">1점</option>
								<option value="2">2점</option>
								<option value="3">3점</option>
								<option value="4">4점</option>
								<option value="5">5점</option>
					</select>
					<button class="selectbtn" @click="fnreivewadd">댓글 등록하기</button>
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
       , idx : "${map.MemberNum}"
       , reviewList : []
       , review : ""
       , score : ""
    }   
    , methods: {
    	fnGetMentor : function(){
            var self = this;
            var nparmap = {MemberNum : self.idx};
            $.ajax({
                url:"/Mentorview.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.info = data.mentor;
	                self.reviewList = data.reviewList;
	                console.log(data);
                }
            }); 
        }
    	, fnFList : function(){
    		location.href="/findboard.do";
    	}
    	, fnreivewadd : function(){
    		var self = this;
    		if(self.score == "" || this.review == "" || this.review == undefined){
    			alert("댓글작성과 점수선택을 해주세요!");
    			return;
    		}
	      	var nparmap = { MemberNum :self.idx, review : self.review, score : self.score};
	        $.ajax({
	            url:"/reviewadd.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {
	           	 	alert("댓글 등록!");
	           	 	self.review = "";
	           	 	self.fnGetMentor();
	            }
	        }); 
    	}
    }   
    , created: function () {
    	var self = this;
    	self.fnGetMentor();
	}
});
</script>