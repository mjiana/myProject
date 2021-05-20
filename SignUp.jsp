<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- 
최초 작성일 : 2021.05.19 
수정1 : 2021.05.20 
--%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="adrBean" class="mysite.AddressBean"/>
<jsp:setProperty property="*" name="adrBean"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>계정 만들기</title>
<link rel="stylesheet" type="text/css" href="Sign_style.css">
<script type="text/javascript" src="Sign_script.js"></script>
<script type="text/javascript">
function useEmail() {
	var e_no = document.getElementById("email_no");
	var email = document.getElementById("memail");
	var e_ck = document.getElementById("e_ck");
	
	if(e_no.checked == true){
		email.style.display = "none";
		e_ck.style.display = "none";
	}else{
		email.style.display = "inline";
		e_ck.style.display = "inline";
		email.focus();
	}
}
</script>
</head>
<body onload="signForm.mid.focus();useEmail()">
<br><br>
<form name="signForm" method="post" action="SignUpCk.jsp"> 
<table border="1">
	<tr>
		<td colspan="2"><b>계정 만들기</b></td>
	</tr>
	<tr>
		<td width="20%">아이디</td>
		<td width="70%">
			<input type="text" name="mid" id="mid" size="20">
			<input type="hidden" name="idCk" value="no">
			<input type="button" value="ID중복확인" onclick="idCheck(this.form.mid.value)">
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="mpw" size="20"></td>
	</tr>
	<tr>
		<td>비밀번호 확인</td>
		<td><input type="password" name="repw" size="20"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="mname" size="20"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>
			<input type="radio" name="memail_use" id="email_no" value="no" checked="checked" onclick="useEmail()">사용안함 &nbsp;
			<input type="radio" name="memail_use" id="email_yes"  value="yes" onclick="useEmail()">사용함 
			<input type="text" name="memail" id="memail" size="30" value="">
			<!-- <input type="button" name="e_ck" id="e_ck" value="중복확인"> -->
		</td>
	</tr>
	<tr>
		<td>핸드폰번호</td>
		<td>
			<input type="hidden" name="mphone" value="">
			<select name="mphone1" id="mphone1">
					<option value="000" selected="selected">선택하세요</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>
			- <input type="text" name="mphone2" size="5" maxlength="4" onkeypress="return isNum(event)"  onkeyup="if(this.value.length==4)signForm.mphone3.focus()"> 
			- <input type="text" name="mphone3" size="5" maxlength="4" onkeypress="return isNum(event)" >
		</td>
	</tr>
	<tr>
		<td>거주지</td>
		<td>
			<input type="hidden" name="maddress" value="">
			<jsp:include page="SignAddress.jsp"/>
			
			<!-- 
			05.19 AM1:46 SignAddress.jsp에서는 select된 값에 따라서 잘나오는데 include하니까 구가 안나온다 
			05.21 AM1:30 form을 지우고 데이터를 불러오니 maddress1의 최하단 값 '충청북도'의 구만 나온다.
			 -->
		</td>
	</tr>
	<tr>
		<td>주요 교통수단</td>
		<td>
			<!-- checkbox는 다중선택이 가능하므로 name이 다르다. -->
			<input type="checkbox" id="mtrans1" name="mtrans" value="버스"> 버스
			<input type="checkbox" id="mtrans2" name="mtrans" value="지하철"> 지하철
			<input type="checkbox" id="mtrans3" name="mtrans" value="기차"> 기차
			<input type="checkbox" id="mtrans4" name="mtrans" value="차량"> 차량
			<input type="checkbox" id="mtrans5" name="mtrans" value="도보" > 도보
		</td>
	</tr>
	<tr>
		<td colspan=2  align="center"><b>선택사항</b></td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td>
			<input type="hidden" name="mbirth">
			<input type="text" name="myear" id="myear" size="4" maxlength="4" value="0000" 
				onkeypress="return isNum(event)" onclick="this.value=''">년 
			<select name="mmonth" id="mmonth">
				<option value="0" selected="selected">월</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
			</select>
			<select name="mday" id="mday">
				<option value="0" selected="selected">일</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>성별</td>
		<td>
			<select name="mgender" id="mgender">
				<option value="0" selected="selected">선택안함</option>
				<option value="여성">여성</option>
				<option value="남성">남성</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="회원가입" onclick="inputCheck()">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="다시쓰기" onclick="signForm.mid.focus()">
		</td>
	</tr>
</table>
</form>
</body>
</html>