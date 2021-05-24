<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
//세션값을 받아온다
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
if(mid != null){ //세션값이 null이 아닐때 회원전용 뷰 표시
%>
	<table>
		<tr>
			<td><b><%=mid %></b>님 환영합니다. </td>
		</tr>
		<tr>
			<td>
				<input type="button" class="btn1" value="내 정보보기" onclick="viewPage()">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn1" value="로그아웃" onclick="logCheck()">
			</td>
		</tr>
	</table>
<%
} else{ //세션값이 null일때 로그인 폼 표시
%>
<form name="login" method="post" action="SignProc.jsp">
<table>
	<tr>
		<td colspan="2"><h4>Login</h4></td>
	</tr>
	<tr>
		<td class="t1">아이디</td>
		<td><input type="text" name="mid" class="txt1"></td>
	</tr>
	<tr>
		<td class="t1">비밀번호</td>
		<td><input type="password" name="mpw" class="txt1"></td>
	</tr>
	<tr>
		<td colspan="2">
			<br>
			<input type="button" value="로그인" class="btn1" onclick="loginCheck()">
			<div align="right"><a href="javascript:signUp()">회원가입</a></div>
		</td>
	</tr>
</table>
</form>
<%
}
%>
</body>
</html>