<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="bq" class="board.BoardQuery"/>
<title>�Խñ� ����</title>
<%
int idx = Integer.parseInt(request.getParameter("idx"));
String pwd = request.getParameter("pwd");
boolean result = false;
result = bq.boardDelete(idx, pwd);
if(result){
%>
	<script type="text/javascript">
		alert("���� �����Ǿ����ϴ�.");
		location.href="BoardList.jsp";
	</script>
<%
}else{
%>
	<script type="text/javascript">
		alert("��ȣ�� ��ġ���� �ʽ��ϴ�.");
		history.back();
	</script>
<%
}
%>
