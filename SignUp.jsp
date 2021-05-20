<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- 
���� �ۼ��� : 2021.05.19 
����1 : 2021.05.20 
--%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="adrBean" class="mysite.AddressBean"/>
<jsp:setProperty property="*" name="adrBean"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �����</title>
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
		<td colspan="2"><b>���� �����</b></td>
	</tr>
	<tr>
		<td width="20%">���̵�</td>
		<td width="70%">
			<input type="text" name="mid" id="mid" size="20">
			<input type="hidden" name="idCk" value="no">
			<input type="button" value="ID�ߺ�Ȯ��" onclick="idCheck(this.form.mid.value)">
		</td>
	</tr>
	<tr>
		<td>��й�ȣ</td>
		<td><input type="password" name="mpw" size="20"></td>
	</tr>
	<tr>
		<td>��й�ȣ Ȯ��</td>
		<td><input type="password" name="repw" size="20"></td>
	</tr>
	<tr>
		<td>�̸�</td>
		<td><input type="text" name="mname" size="20"></td>
	</tr>
	<tr>
		<td>�̸���</td>
		<td>
			<input type="radio" name="memail_use" id="email_no" value="no" checked="checked" onclick="useEmail()">������ &nbsp;
			<input type="radio" name="memail_use" id="email_yes"  value="yes" onclick="useEmail()">����� 
			<input type="text" name="memail" id="memail" size="30" value="">
			<!-- <input type="button" name="e_ck" id="e_ck" value="�ߺ�Ȯ��"> -->
		</td>
	</tr>
	<tr>
		<td>�ڵ�����ȣ</td>
		<td>
			<input type="hidden" name="mphone" value="">
			<select name="mphone1" id="mphone1">
					<option value="000" selected="selected">�����ϼ���</option>
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
		<td>������</td>
		<td>
			<input type="hidden" name="maddress" value="">
			<jsp:include page="SignAddress.jsp"/>
			
			<!-- 
			05.19 AM1:46 SignAddress.jsp������ select�� ���� ���� �߳����µ� include�ϴϱ� ���� �ȳ��´� 
			05.21 AM1:30 form�� ����� �����͸� �ҷ����� maddress1�� ���ϴ� �� '��û�ϵ�'�� ���� ���´�.
			 -->
		</td>
	</tr>
	<tr>
		<td>�ֿ� �������</td>
		<td>
			<!-- checkbox�� ���߼����� �����ϹǷ� name�� �ٸ���. -->
			<input type="checkbox" id="mtrans1" name="mtrans" value="����"> ����
			<input type="checkbox" id="mtrans2" name="mtrans" value="����ö"> ����ö
			<input type="checkbox" id="mtrans3" name="mtrans" value="����"> ����
			<input type="checkbox" id="mtrans4" name="mtrans" value="����"> ����
			<input type="checkbox" id="mtrans5" name="mtrans" value="����" > ����
		</td>
	</tr>
	<tr>
		<td colspan=2  align="center"><b>���û���</b></td>
	</tr>
	<tr>
		<td>�������</td>
		<td>
			<input type="hidden" name="mbirth">
			<input type="text" name="myear" id="myear" size="4" maxlength="4" value="0000" 
				onkeypress="return isNum(event)" onclick="this.value=''">�� 
			<select name="mmonth" id="mmonth">
				<option value="0" selected="selected">��</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
			</select>
			<select name="mday" id="mday">
				<option value="0" selected="selected">��</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>����</td>
		<td>
			<select name="mgender" id="mgender">
				<option value="0" selected="selected">���þ���</option>
				<option value="����">����</option>
				<option value="����">����</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="ȸ������" onclick="inputCheck()">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="�ٽþ���" onclick="signForm.mid.focus()">
		</td>
	</tr>
</table>
</form>
</body>
</html>