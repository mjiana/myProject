<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
int idx = Integer.parseInt(request.getParameter("idx"));
String choice= request.getParameter("choice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ Ȯ��</title>
<link rel="stylesheet" type="text/css" href="A_Board.css">
</head>
<body onload="pwform.pwd.focus()">
<form method="post" name="pwform" action="BoardPwCk.jsp?idx=<%=idx %>&choice=<%=choice%>">
<table>
	<tr>
		<td class="t1">�Խñ��� ��ȣ�� �Է��ϼ���</td>
	</tr>
	<tr>
		<td><input type="password" class="txt2" name="pwd"></td>
	</tr>
	<tr>
		<td>
			<input type="submit" class="btn1" value="�Է�">
			<input type="button" class="btn1" value="���ư���" onclick="history.back()">
		</td>
	</tr>
</table>
</form>
</body>
</html>