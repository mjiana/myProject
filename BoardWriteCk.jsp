<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="board.*"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="boardBean" class="board.BoardBean"/>
<jsp:setProperty property="*" name="boardBean"/>
<jsp:useBean id="boardQuery" class="board.BoardQuery"/>
<title>�Խñ� ����</title>
<% 
boolean result = false;
result = boardQuery.boardInsert(boardBean); 
if(result){
%>
	<script type="text/javascript">
		alert("�ԷµǾ����ϴ�.");
		location.href="BoardList.jsp";
	</script>
<%
}else{
%>
	<script type="text/javascript">
		alert("�Է¿� �����߽��ϴ�.");
		history.back();
	</script>
<%
}
%>