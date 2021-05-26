<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="bq" class="board.BoardQuery"/>
<title>게시글 삭제</title>
<%
int idx = Integer.parseInt(request.getParameter("idx"));
String pwd = request.getParameter("pwd");
boolean result = false;
result = bq.boardDelete(idx, pwd);
if(result){
%>
	<script type="text/javascript">
		alert("글이 삭제되었습니다.");
		location.href="BoardList.jsp";
	</script>
<%
}else{
%>
	<script type="text/javascript">
		alert("암호가 일치하지 않습니다.");
		history.back();
	</script>
<%
}
%>
