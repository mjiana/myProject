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
<title>비밀번호 확인</title>
<link rel="stylesheet" type="text/css" href="A_Board.css">
</head>
<body onload="pwform.pwd.focus()">
<form method="post" name="pwform" action="BoardPwCk.jsp?idx=<%=idx %>&choice=<%=choice%>">
<table>
	<tr>
		<td class="t1">게시글의 암호를 입력하세요</td>
	</tr>
	<tr>
		<td><input type="password" class="txt2" name="pwd"></td>
	</tr>
	<tr>
		<td>
			<input type="submit" class="btn1" value="입력">
			<input type="button" class="btn1" value="돌아가기" onclick="history.back()">
		</td>
	</tr>
</table>
</form>
</body>
</html>