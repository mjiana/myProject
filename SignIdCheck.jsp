<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- ���� �ۼ��� : 2021.05.19 --%>    
<jsp:useBean id="memMgr" class="mysite.MemberMgr" />
<% 
String mem_id = request.getParameter("mid");
boolean check = memMgr.checkId(mem_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ID�ߺ�Ȯ��</title>
<link rel="stylesheet" type="text/css" href="Sign_style.css">
<script type="text/javascript">
function yesId(){
	//alert("���̵� ����մϴ�.");
	opener.document.signForm.mid.readOnly = true;
	opener.document.signForm.mpw.focus();
	//��Ŀ���� �������� �����ٵ�
	self.close();
}
function noId(){
	//alert("�ۼ��� ���̵� �ʱ�ȭ �˴ϴ�.");
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
<b><%=mem_id %></b>��
</p>
<%
if(check) {
%>
	<p align="center">�̹� �����ϴ� ID�Դϴ�.</p>
	<p align="center">
		<input type="button" value="�ݱ�" onclick="self.close()">
	</p>
<%
}
else {
%>
	<p align="center">
	��밡���� ID�Դϴ�.<br>
	����Ͻðڽ��ϱ�?
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