<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, mysite.*" %>
<%-- 
���� �ۼ��� : 2021.05.19 
����1 : 2021.05.20 
����2 : 2021.05.24
--%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="memMgr" class="mysite.MemberMgr" />
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
<form name="signForm" method="post" action="SignUpInsert.jsp"> 
<table>
	<tr>
		<td colspan="2"><b>���� �����</b></td>
	</tr>
	<tr>
		<td class="t1">���̵�</td>
		<td>
			<input type="text" name="mid" id="mid" size="20">
			<input type="hidden" name="idCk" value="no">
			<input type="button" class="btn1" value="ID�ߺ�Ȯ��" onclick="idCheck(this.form.mid.value)">
		</td>
	</tr>
	<tr>
		<td class="t1">��й�ȣ</td>
		<td><input type="password" name="mpw" size="20"></td>
	</tr>
	<tr>
		<td class="t1">��й�ȣ Ȯ��</td>
		<td><input type="password" name="repw" size="20"></td>
	</tr>
	<tr>
		<td class="t1">�̸�</td>
		<td><input type="text" name="mname" size="20"></td>
	</tr>
	<tr>
		<td class="t1">�̸���</td>
		<td>
			<input type="radio" name="memail_use" id="email_no" value="no" checked="checked" onclick="useEmail()">������ &nbsp;
			<input type="radio" name="memail_use" id="email_yes"  value="yes" onclick="useEmail()">����� 
			<input type="text" name="memail" id="memail" size="30" value="">
			<!-- <input type="button" name="e_ck" id="e_ck" value="�ߺ�Ȯ��"> -->
		</td>
	</tr>
	<tr>
		<td class="t1">�ڵ�����ȣ</td>
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
		<td class="t1">������</td>
		<td>
			<input type="hidden" name="maddress" value="">
			<%
			List cList = memMgr.selectCity();
			int ccnt = cList.size();
			String maddress1 = "";
			String maddress2 = "";
			List dList = null;
			AddressBean dBean = null;
			int dcnt = 0;
			%>
			<select name="maddress1" id="maddress1" onchange="selectAdr1(this.value)">
				<option value="0">��/��/��</option>
				<%
				for(int i=0; i<ccnt; i++){
					AddressBean cBean = (AddressBean)cList.get(i);
					maddress1 = cBean.getCity();
					dList = memMgr.selectDistrict(maddress1);
					%>
					<option value="<%=maddress1%>"><%=maddress1%></option>
				<%
				}
				dcnt = dList.size();
				%>
				</select>
				<iframe id="adr2Frame" src="SignAddress.jsp" class="iframe1" >������ �� select�ڽ�</iframe>
			<!-- 
			05.19 AM1:46 SignAddress.jsp������ select�� ���� ���� �߳����µ� include�ϴϱ� ���� �ȳ��´� 
			05.21 AM1:30 form�� ����� �����͸� �ҷ����� maddress1�� ���ϴ� �� '��û�ϵ�'�� ���� ���´�.
			05.24 PM11:07 <jsp:include page="SignAddress.jsp"/> ���� 
			 -->
		</td>
	</tr>
	<tr>
		<td class="t1">�ֿ� �������</td>
		<td>
			<!-- checkbox�� ���߼����� �����ϹǷ� name�� ����. -->
			<input type="hidden" name="mtrans" value="">
			<input type="checkbox" id="mtrans1" name="mtransCk" value="����"> ����
			<input type="checkbox" id="mtrans2" name="mtransCk" value="����ö"> ����ö
			<input type="checkbox" id="mtrans3" name="mtransCk" value="����"> ����
			<input type="checkbox" id="mtrans4" name="mtransCk" value="����"> ����
			<input type="checkbox" id="mtrans5" name="mtransCk" value="����" > ����
		</td>
	</tr>
	<tr>
		<td colspan=2  align="center"><b>���û���</b></td>
	</tr>
	<tr>
		<td class="t1">�������</td>
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
		<td class="t1">����</td>
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
			<input type="button" class="btn1" value="ȸ������" onclick="inputCheck()">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" class="btn1" value="�ٽþ���" onclick="signForm.mid.focus()">
		</td>
	</tr>
</table>
</form>
</body>
</html>