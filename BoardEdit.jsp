<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="board.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ� ����</title>
<link rel="stylesheet" type="text/css" href="A_Board.css">
<script type="text/javascript" src="A_BoardScript.js"></script>
</head>
<%
int idx = Integer.parseInt(request.getParameter("idx"));
BoardQuery bq = new BoardQuery();
BoardBean bb = bq.boardView(idx);
%>
<body>
<table>
	<tr>
		<td><font>�Ϲ��� �Խ���</font></td>
	</tr>
</table>
<br>
<form method="post" name="myform" action="BoardEditCk.jsp">
<table>
	<tr>
		<td colspan="2">�Խñ� ����</td>
	</tr>
	<tr>
		<td class="t1">�̸�</td>
		<td><input type="text" name="name" value="<%=bb.getName() %>"></td>
	</tr>
	<tr>
		<td class="t1">�̸���</td>
		<td><input type="text" name="email" value="<%=bb.getEmail() %>"></td>
	</tr>
	<tr>
		<td class="t1">����</td>
		<td><input type="text" name="title" value="<%=bb.getTitle() %>"></td>
	</tr>
	<tr>
		<td class="t1">����</td>
		<td><textarea name="content" wrap="hard"><%=bb.getContent().replaceAll("<br>", "\n") %></textarea></td>
	</tr>
	<tr>
		<td class="t1">��ȣ</td>
		<td><input type="password" name="pwd"></td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="hidden" name="idx" value="<%=bb.getIdx()%>">
		<input type="button" class="btn1" value="�����ϱ�" onclick="trans(this.form)">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" class="btn1" value="�ٽþ���">
		</td>
	</tr>
</table>
</form>
<br>
<table>
	<tr>
		<td>[<a href="./BoardContent.jsp?idx=<%=bb.getIdx()%>">���ư���</a>]</td>
	</tr>
</table>
</body>
</html>