<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 쓰기</title>
<link rel="stylesheet" type="text/css" href="A_Board.css">
<script type="text/javascript" src="A_BoardScript.js"></script>
</head>
<body onload="wform.name.focus()">
<table>
	<tr>
		<td><font>일반형 게시판</font></td>
	</tr>
</table>
<br>
<form method="post" action="BoardWriteCk.jsp" name="wform">
<table>
	<tr>
		<td colspan="2">new Write</td>
	</tr>
	<tr>
		<td class="t1">이름</td>
		<td><input type="text" class="txt2" name="name"></td>
	</tr>
	<tr>
		<td class="t1">이메일</td>
		<td><input type="text" class="txt2" name="email"></td>
	</tr>
	<tr>
		<td class="t1">제목</td>
		<td><input type="text" class="txt2" name="title"></td>
	</tr>
	<tr>
		<td class="t1">내용</td>
		<td><textarea name="content" wrap="hard"></textarea></td>
	</tr>
	<tr>
		<td class="t1">암호</td>
		<td><input type="password" class="txt2" name="pwd"></td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="button" class="btn1" value="저장" onclick="trans(this.form)">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" class="btn1" value="재작성">
		</td>
	</tr>
</table>
</form>
<br>
<table>
	<tr>
		<td>[<a href="./BoardList.jsp">리스트</a>]</td>
	</tr>
</table>
</body>
</html>