<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/point.css" />
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>포인트충전 page</title>

</head>

<body>
	<div>
		<div>
			<h1>포인트 충전 안내</h1>
			<p>신청 후 계좌이체를 통하여 입금 확인 후 
			<br>포인트를 충전합니다.
				<br>입금확인은 5분~10분 소요됩니다.</p>
			<form name="form">
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
						<td><input style="width: 90%;"name="bank"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
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
