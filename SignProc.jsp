<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- DAO �ҷ����� -->    
<jsp:useBean id="memMgr" class="mysite.MemberMgr"/>
<%
//Login.jsp���� �Ѿ�� �� �� ������ ����
String mid = request.getParameter("mid");
String mpw = request.getParameter("mpw");
//DAO ���� �� ��ȯ�� ���� ����
boolean loginCheck = memMgr.loginCheck(mid, mpw);

if(loginCheck){ //loginCheck�� true�� ���
	//id������ ���� ���� �� Login.jsp�� �̵�
	session.setAttribute("idKey", mid);
	response.sendRedirect("SignIn.jsp");
}else{ //false�ΰ��
	response.sendRedirect("SignError.jsp");
}
%>