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
//HitUp
BoardQuery bq = new BoardQuery();
bq.boardHitUp(idx);
BoardBean bb = bq.boardView(idx);
%>
<body>
<table>
	<tr>
		<td class="tc1"><font>�Խñ� ����</font></td>
	</tr>
</table>
<br>
<form method="post" name="cform">
<table class="tb1">
	<tr>
		<td class="t1">����</td>
		<td class="left2"><%=bb.getTitle() %></td>
	</tr>
	<tr>
		<td class="t1">��ȸ��</td>
		<td class="left2"><%=bb.getHit() %></td>
	</tr>
	<tr>
		<td class="t1">�̸�</td>
		<td class="left2"><%=bb.getName() %></td>
	</tr>
	<tr>
		<td class="t1">�̸���</td>
		<td class="left2"><%=bb.getEmail() %></td>
	</tr>
	<tr>
		<td class="t1">����</td>
		<td class="left2"><%=bb.getContent() %></td>
	</tr>
</table>	
<table>	
	<tr>
		<td>
			<input type="button" class="btn1" value="�����ϱ�" onclick="editsend(<%=bb.getIdx()%>)">
			<input type="button" class="btn1" value="�����ϱ�" onclick="delsend(<%=bb.getIdx()%>)">
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