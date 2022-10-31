<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/menubar.jsp"></jsp:include>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" href="css/Customer_Service.css"/>
<script>
 	function showPopup() {
 		window.open("phoneNumber", "전화번호 알려드림", "width=400, height=300, left=100, top=50"); }
 	function showPopup2() {
 		window.open("chatting", "1대1채팅문의", "width=400, height=300, left=100, top=50"); }
 	</script>
</head>

<body>
 <div class = "container">
 	<div id="Qheader"><h4 class = "h4">고객센터</h4></div>
 		
 	<div id="Qmain">
	 	<div id = question_box>
	 	 	<div class = "question_Title"><p>자주하는 질문</p></div> 	 
	 		<table id = "question_table" >
		 		<tr>
		 			<td>
		 				<details>
		 					<summary><img src = "image/questionicon.png" width = "40px"><a>환불은 어떻게 받나요?</a></summary>
		 					<p>환불 유형에 따라 다양한 수단으로 환불을 받으실 수 있어요.<br>
		 						결제 카드 환불 — 결제에 사용한 카드로 환불해 드려요. 다른 카드로 환불을 받으실 수는 없답니다</p>
		 				</details>
		 			</td>
		 		</tr>
		 		<tr>
		 			<td>
		 				<details>
			 				<summary><img src = "image/questionicon.png" width = "40px"><a>회원 탈퇴는 어떻게 하나요?</a></summary>
			 				<p class = "p">마이페이지 - 내정보 - 탈퇴하기를 누르시면 탈퇴하실 수 있습니다.</p>
			 			</details>
		 			</td>
		 		</tr>
		 		<tr>
		 			<td>
		 				<details>
			 				<summary><img src = "image/questionicon.png" width = "40px"><a>포인트는 무엇인가요?</a></summary>
			 				<p class = "p">포인트는 돈과 같은 역할을 하는데, <br>
			 						포인트로 멘토의 수업을 살 수도 있고 기프티콘도 구매가능합니다.</p>
		 				</details>
		 			</td>
		 		</tr>
		 		<tr>
		 			<td>
		 				<details>
			 				<summary><img src = "image/questionicon.png" width = "40px"><a>탈퇴 후 재가입은 가능한가요?</a></summary>
			 				<p class = p>네 다시 회원가입 창에서 회원가입 진행해 주시면 되세요</p>
		 				</details>
		 			</td>
		 		</tr>
		 		<tr>
		 			<td>
		 				<details>
			 				<summary><img src = "image/questionicon.png" width = "40px"><a>멘토를 고를 때 유의할 점이 있나요?</a></summary>
			 				<p class = p>저희 멘토분들은 한명한명 좋으신 분들만 있으시지만 자기와 맞는 멘토를<br>
		 							고르기 위해서는 공고게시판의 멘토창을 자세히 봐주세요.</p>
		 				</details>
		 			</td>
		 		</tr>
		 		<tr>
		 			<td>
		 				<details>
			 				<summary><img src = "image/questionicon.png" width = "40px"><a>만 14세 미만도 회원가입이 가능한가요?</a></summary>
			 				<p>네 가능합니다. 만 14세 미만도 멘티가 될 수있습니다. 하지만 멘토는 할 수 없습니다. </p>
		 				</details>
		 			</td>
		 		</tr>
	 		</table>
	 	</div>
		<div style="padding:116px;">
			<input type = "button" value = "전화걸기" class = "phone" onclick="showPopup();" />
			<div>
				<div style="margin-top: 50px; padding-left:20px">
					<h1>포인트 충전 안내</h1>
					<p>신청 후 계좌이체를 통하여 입금 확인 후 
					<br>포인트를 충전합니다.
						<br>입금확인은 5분~10분 소요됩니다.</p>
					<form name="form" style="margin-top: 20px">
						<table>
							<tr>
								<td >입 금 은 행 :</td>
								<td widht="400">			
								<select name="selectbank" onchange="bankDisplay(this.form)">
									<option selected value=0>은행선택
									<option value=1>국민은행
									<option value=2>기업은행
									<option value=3>우리은행
									<option value=4>신한은행
									<option value=5>우체국
								</select></td>
							</tr>
							<tr>
								<td>입 금 계 좌 :</td>
								<td><input style="width: 100%;"name="bank"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div> 	
</div>
<div style="height:100px;">
	
</div>
<script = "javascript">
 	window.addEventListener('DOMContentLoaded', function(){
 	    document.querySelectorAll('details').forEach(function(item){
 	        item.addEventListener("toggle", event => {
 	        let toggled = event.target;
 	        if (toggled.attributes.open) {/* 열었으면 */
 	          document.querySelectorAll('details[open]').forEach(function(opened){	
 	              if(toggled != opened) /* 현재 열려있는 요소가 아니면 */
 	                opened.removeAttribute('open'); /* 열림 속성 삭제 */
 	          });
 	         var element = document.getElementById('question_table');
 	         var h = element.clientHeight;
 	         document.getElementById('question_box').style.height = 60+h;
 	         /* var height_value = document.getElementById('question_table').height; */
       	  /* document.getElementById('question_box').style.height = height_value */
 	        }
 	      })
 	    });
 	   
 	});
 	
 	</script>
<script language="javascript">
	function bankDisplay(frm) {

		var bank = frm.selectbank.selectedIndex;

		switch (bank) {
		case 0:
			frm.bank.value = '은행 및 계좌번호가 표시됩니다.';
			break;
		case 1:
			frm.bank.value = '(국민은행 034-98-6481-6541';
			break;
		case 2:
			frm.bank.value = '(기업은행) 312-9841-08-012';
			break;
		case 3:
			frm.bank.value = '(우리은행) 197-98-0151712';
			break;
		case 4:
			frm.bank.value = '(신한은행) 987121-651-32512';
			break;
		case 5:
			frm.bank.value = '(우체국) 98123-21-651612';
		}

		return true;
	}
</script>
 	
</body>
</html>
<!-- a{
	box-shadow: 4px 5px 5px rgba(0, 0, 0, 0.4);
} -->