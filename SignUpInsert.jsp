<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- 
최초 작성일 : 2021.05.19
수정일 : 2021.05.24
 --%>
 <% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="memMgr" class="mysite.MemberMgr"/>
<jsp:useBean id="sBean" class="mysite.SignBean"/>
<jsp:setProperty property="*" name="sBean"/>
<% boolean flag = memMgr.memberInsert(sBean); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>insert</title>
<link rel="stylesheet" type="text/css" href="Sign_style.css">
</head>
<body>
<br>
<%
if(flag){
%>
	<p> <b>회원가입을 축하드립니다.</b> </p>
	<p> <input type="button" class="btn1" value="로그인" onclick="location.href='SignIn.jsp'"> </p> 
<%
} else{
%>
	<p> <b>다시 입력하여 주십시오.</b> </p>
	<p> <input type="button" class="btn1" value="다시 가입" onclick="location.href='SignUp.jsp'"> </p> 
<%
}
%>
</body>
</html>