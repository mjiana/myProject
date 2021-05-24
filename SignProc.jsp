<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- DAO 불러오기 -->    
<jsp:useBean id="memMgr" class="mysite.MemberMgr"/>
<%
//Login.jsp에서 넘어온 폼 값 변수에 저장
String mid = request.getParameter("mid");
String mpw = request.getParameter("mpw");
//DAO 실행 및 반환값 변수 저장
boolean loginCheck = memMgr.loginCheck(mid, mpw);

if(loginCheck){ //loginCheck가 true인 경우
	//id값으로 세션 설정 후 Login.jsp로 이동
	session.setAttribute("idKey", mid);
	response.sendRedirect("SignIn.jsp");
}else{ //false인경우
	response.sendRedirect("SignError.jsp");
}
%>