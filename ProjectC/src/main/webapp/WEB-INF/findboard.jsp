<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공고게시판</title>
<link rel="stylesheet" href="css/findboard.css" />
<jsp:include page="/WEB-INF/menubar.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<!--슬라이드 cdn-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />

<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<script src="js/jquery.js"></script>
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
</head>
<body>
<div id="app">
	<div class="checkbox1">
		<div class="checkbox2">
			<form action="#">
				지역 
				<span v-for="(item, index) in regionList">
					<input type="checkbox" name="region" v-bind:id="'idx_' + index" v-bind:value="item" v-model="selectedRegionList">
					<span>{{item.ReName}}</span>	
				</span>
				
				
			</form>
			<br> <br>
			<form action="#">
				직군 
				<span v-for="(item, index) in jobList" style="font-size:15px;">
					<input type="checkbox" name="job" v-bind:id="'idx_' + index" v-bind:value="item" v-model="selectedJobList">
				<span>{{item.JobName}}</span>	
			</form>
		</div>
		<button class="searchbtn" @click="fnSearch(1)">선택 검색</button>
	</div>
	
	<div class="btnbox">
		<p>공고게시판</p>
		<button class="writebtn" @click="fnAdd" style="color: white;">등록하기</button>
	</div>
	<!--공고 게시판 리스트 목록  -->
	<div class="listtab">
		<table class="listna">
			<thead>
				<tr>
					<th style="width: 10%;">직군</th>
					<th style="width: 40%;">제목</th>
					<th style="width: 10%;">작성자</th>
					<th style="width: 10%;">지역</th>
				</tr>
			</thead>
			<tbody>
				<tr v-for="(item, index) in list">
					<td>{{item.JobName}}</td>
					<td><a href="javascript:;" @click="fnfindView(item)">{{item.FindName}}</a></td>
					<td><a href="javascript:;" @click="fnMentorView(item)">{{item.MemberId}}</td>
					<td>{{item.ReName}}</td>
				</tr>
			</tbody>
		</table>
		<div class="bannertab">
			<div class="swiper mySwiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img src="image/f1.png" style="width: 100%; height: 500px">
					</div>
					<div class="swiper-slide">
						<img src="image/f2.png" style="width: 100%; height: 500px">
					</div>
					<div class="swiper-slide">
						<img src="image/f3.png" style="width: 100%; height: 500px">
					</div>
				</div>
			</div>
		</div>
		<!--공고 게시판 리스트 우측 배너 슬라이드  -->
	</div>
				<template>
	  <paginate
	    :page-count="pageCount"
	    :page-range="10"
	    :margin-pages="2"
	    :click-handler="fnSearch"
	    :prev-text="'-'"
	    :next-text="'+'"
	    :container-class="'pagination'"
	    :page-class="'page-item'">
	  </paginate>
	</template>
</div>
</body>
<script type="text/javascript">
Vue.component('paginate', VuejsPaginate)
	var param = {}
	param.regionList = ${regionList};
	param.jobList = ${jobList};
	var app = new Vue({
		el : '#app',
		data : {
			list : [] // 전체 데이터 리스트
			, check : [] //체크박스 리스트
			, selectedRegionList : []
			, selectedJobList : []
			, regionList : param.regionList
			, jobList : param.jobList
			// 페이징
			, selectPage: 1
			, pageCount: 1
		},
		methods : {
			fnGetList : function() {
				var self = this;
				var startNum = ((self.selectPage-1) * 15);
	    		var lastNum = self.selectPage * 15
				var nparmap = {startNum : startNum, lastNum : lastNum};
				$.ajax({
					url : "/findboard.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
						self.pageCount = Math.ceil(data.cnt / 15);
					}
				});
			} //공고 게시판 상세 조회 
			, fnSearch : function(pageNum){
				var self = this;
				self.selectPage = pageNum;
				var startNum = ((pageNum-1) * 15);
				var lastNum = pageNum * 15
				var nparmap = {startNum : startNum, lastNum : lastNum};
				if(self.selectedRegionList.length > 0){
					nparmap.regionList = JSON.stringify(self.selectedRegionList); 
				}
				if(self.selectedJobList.length > 0){
					nparmap.jobList = JSON.stringify(self.selectedJobList);
				}
				$.ajax({
					url : "/findboard.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
						self.pageCount = Math.ceil(data.cnt / 10);
					}
				});
			}
			,
			fnfindView : function(item) {
				var self = this;
				self.pageChange("./findview.do", {
					FindNum : item.FindNum
				});
			} //멘토 아이디 클릭시 상세 조회
			,
			fnMentorView : function(item) {
				var self = this;
				self.pageChange("./Mentorview.do", {
					MemberNum : item.MemberNum
				});
			}//공고페이지 글추가
			,
			fnAdd : function() {
				var self = this;
				self.pageChange("./findadd.do", {});
			}
			//페이지 전환 필수
			,
			pageChange : function(url, param) {
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
		, created : function() {
			this.fnGetList();
		}
	});
</script>
<script>
	
</script>
</html>
<script>
	var swiper = new Swiper(".mySwiper", {
		loop : true,
		autoplay : {
			delay : 600
		},
	});
</script>
