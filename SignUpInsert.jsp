<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- 
���� �ۼ��� : 2021.05.19
������ : 2021.05.24
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
	<p> <b>ȸ�������� ���ϵ帳�ϴ�.</b> </p>
	<p> <input type="button" class="btn1" value="�α���" onclick="location.href='SignIn.jsp'"> </p> 
<%
} else{
%>
	<p> <b>�ٽ� �Է��Ͽ� �ֽʽÿ�.</b> </p>
	<p> <input type="button" class="btn1" value="�ٽ� ����" onclick="location.href='SignUp.jsp'"> </p> 
<%
}
%>
</body>
</html>