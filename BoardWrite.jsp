<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ� ����</title>
<link rel="stylesheet" type="text/css" href="A_Board.css">
<script type="text/javascript" src="A_BoardScript.js"></script>
</head>
<body onload="wform.name.focus()">
<table>
	<tr>
		<td><font>�Ϲ��� �Խ���</font></td>
	</tr>
</table>
<br>
<form method="post" action="BoardWriteCk.jsp" name="wform">
<table>
	<tr>
		<td colspan="2">new Write</td>
	</tr>
	<tr>
		<td class="t1">�̸�</td>
		<td><input type="text" class="txt2" name="name"></td>
	</tr>
	<tr>
		<td class="t1">�̸���</td>
		<td><input type="text" class="txt2" name="email"></td>
	</tr>
	<tr>
		<td class="t1">����</td>
		<td><input type="text" class="txt2" name="title"></td>
	</tr>
	<tr>
		<td class="t1">����</td>
		<td><textarea name="content" wrap="hard"></textarea></td>
	</tr>
	<tr>
		<td class="t1">��ȣ</td>
		<td><input type="password" class="txt2" name="pwd"></td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="button" class="btn1" value="����" onclick="trans(this.form)">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" class="btn1" value="���ۼ�">
		</td>
	</tr>
</table>
</form>
<br>
<table>
	<tr>
		<td>[<a href="./BoardList.jsp">����Ʈ</a>]</td>
	</tr>
</table>
</body>
</html>