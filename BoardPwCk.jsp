<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr");  %>    
<jsp:useBean id="bb" class="board.BoardBean"/>
<jsp:setProperty property="*" name="bb"/>
<jsp:useBean id="bq" class="board.BoardQuery"/>
<title>비밀번호 확인</title>
<%
String choice= request.getParameter("choice");
int idx =  Integer.parseInt(request.getParameter("idx"));
String pwd = request.getParameter("pwd");

boolean result = false;

result = bq.passwordCheck(idx, pwd);
if(result){
	if(choice.equals("Edit")){
%>
	<script type="text/javascript">
		location.href="BoardEdit.jsp?idx=<%=idx%>";
	</script>
<%
	}else if(choice.equals("Del")){
%>
		<form method="post" name="dform" action="BoardDelCk.jsp?idx=<%=idx %>">
			<input type="hidden" name="pwd" value="<%=pwd%>">
		</form>
		<script type="text/javascript">
			document.dform.submit();
		</script>
<%
	}else{
		out.print(result);
	}
}else{
	%>
	<script type="text/javascript">
		alert("암호가 일치하지 않습니다.");
		history.back();
	</script>
<%
}
%>
