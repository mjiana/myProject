<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- 최초 작성일 : 2021.05.19 --%>    
<jsp:useBean id="memMgr" class="mysite.MemberMgr" />
<% 
String mem_id = request.getParameter("mid");
boolean check = memMgr.checkId(mem_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ID중복확인</title>
<link rel="stylesheet" type="text/css" href="Sign_style.css">
<script type="text/javascript">
function yesId(){
	//alert("아이디를 사용합니다.");
	opener.document.signForm.mid.readOnly = true;
	opener.document.signForm.mpw.focus();
	//포커스도 안잡히면 좋을텐데
	self.close();
}
function noId(){
	//alert("작성한 아이디가 초기화 됩니다.");
	opener.document.signForm.mid.readOnly = false;
	opener.document.signForm.mid.value="";
	opener.document.signForm.mid.focus();
	self.close();
}
</script>
</head>
<body>
<br>
<p align="center">
<b><%=mem_id %></b>는
</p>
<%
if(check) {
%>
	<p align="center">이미 존재하는 ID입니다.</p>
	<p align="center">
		<input type="button" value="닫기" onclick="self.close()">
	</p>
<%
}
else {
%>
	<p align="center">
	사용가능한 ID입니다.<br>
	사용하시겠습니까?
	</p>
	<p align="center">
	<input type="button" value="yes" onclick="yesId()">
	<input type="button" value="no" onclick="noId()">
	</p>
<%
}
%>

</body>
</html>