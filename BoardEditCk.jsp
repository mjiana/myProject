<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr");  %>    
<jsp:useBean id="bb" class="board.BoardBean"/>
<jsp:setProperty property="*" name="bb"/>
<jsp:useBean id="bq" class="board.BoardQuery"/>
<title>게시글 수정</title>
<%
int idx = bb.getIdx();
boolean result = false;
result = bq.boardUpdate(bb);
//out.print(result);
if(result){
%>
	<script type="text/javascript">
		alert('글이 수정되었습니다.');
		location.href='BoardContent.jsp?idx='+<%=idx%>;
	</script>
<%
}else{
%>
	<script type="text/javascript">
		alert('암호가 일치하지 않습니다.');
		history.back();
	</script>
<%
}
%>
