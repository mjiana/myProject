<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
//���ǰ��� �޾ƿ´�
String mid = (String)session.getAttribute("idKey"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="Sign_style.css">
<script type="text/javascript" src="Sign_script.js"></script>
</head>
<body onload="login.mid.focus()">
<br>
<%
if(mid != null){ //���ǰ��� null�� �ƴҶ� ȸ������ �� ǥ��
%>
	<table>
		<tr>
			<td><b><%=mid %></b>�� ȯ���մϴ�. </td>
		</tr>
		<tr>
			<td>
				<input type="button" class="btn1" value="�� ��������" onclick="viewPage()">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn1" value="�α׾ƿ�" onclick="logCheck()">
			</td>
		</tr>
	</table>
<%
} else{ //���ǰ��� null�϶� �α��� �� ǥ��
%>
<form name="login" method="post" action="SignProc.jsp">
<table>
	<tr>
		<td colspan="2"><h4>Login</h4></td>
	</tr>
	<tr>
		<td class="t1">���̵�</td>
		<td><input type="text" name="mid" class="txt1"></td>
	</tr>
	<tr>
		<td class="t1">��й�ȣ</td>
		<td><input type="password" name="mpw" class="txt1"></td>
	</tr>
	<tr>
		<td colspan="2">
			<br>
			<input type="button" value="�α���" class="btn1" onclick="loginCheck()">
			<div align="right"><a href="javascript:signUp()">ȸ������</a></div>
		</td>
	</tr>
</table>
</form>
<%
}
%>
</body>
</html>