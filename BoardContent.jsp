<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="board.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 보기</title>
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
		<td class="tc1"><font>게시글 보기</font></td>
	</tr>
</table>
<br>
<form method="post" name="cform">
<table class="tb1">
	<tr>
		<td class="t1">제목</td>
		<td class="left2"><%=bb.getTitle() %></td>
	</tr>
	<tr>
		<td class="t1">조회수</td>
		<td class="left2"><%=bb.getHit() %></td>
	</tr>
	<tr>
		<td class="t1">이름</td>
		<td class="left2"><%=bb.getName() %></td>
	</tr>
	<tr>
		<td class="t1">이메일</td>
		<td class="left2"><%=bb.getEmail() %></td>
	</tr>
	<tr>
		<td class="t1">내용</td>
		<td class="left2"><%=bb.getContent() %></td>
	</tr>
</table>	
<table>	
	<tr>
		<td>
			<input type="button" class="btn1" value="수정하기" onclick="editsend(<%=bb.getIdx()%>)">
			<input type="button" class="btn1" value="삭제하기" onclick="delsend(<%=bb.getIdx()%>)">
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