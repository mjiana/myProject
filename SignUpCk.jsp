<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- 
최초 작성일 : 2021.05.19
수정일 : 2021.05.24 - 미사용
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>계정 확인</title>
<link rel="stylesheet" type="text/css" href="Sign_style.css">
</head>
<%
request.setCharacterEncoding("euc-kr");
String mid = request.getParameter("mid");
String mname = request.getParameter("mname");
String memail = request.getParameter("memail");
String mphone = request.getParameter("mphone");
String maddress = request.getParameter("maddress");
String mtrans[] = request.getParameterValues("mtrans");
String mbirth = request.getParameter("mbirth");
String mgender = request.getParameter("mgender").equals("0") ? "" : request.getParameter("mgender");
%>
<body>
<form name="signCkForm" method="post" action="SignUpInsert.jsp"> <!--  -->
<table>
	<tr>
		<td colspan="2"><b>계정 확인</b></td>
	</tr>
	<tr>
		<td class="t1">아이디</td>
		<td><%=mid %></td>
	</tr>
	<tr>
		<td class="t1">이름</td>
		<td><%=mname %></td>
	</tr>
	<tr>
		<td class="t1">이메일</td>
		<td><%=memail %></td>
	</tr>
	<tr>
		<td class="t1">핸드폰번호</td>
		<td><%=mphone %></td>
	</tr>
	<tr>
		<td class="t1">거주지</td>
		<td><%=maddress %></td>
	</tr>
	<tr>
		<td class="t1">주요 교통수단</td>
		<td><%
			int cnt = mtrans.length;
			for(int i=0; i<cnt; i++){
				out.print(mtrans[i]);
				if(i<cnt-1) out.print(", ");
			}
		 %></td>
	</tr>
	<tr>
		<td colspan=2  align="center"><b>선택사항</b></td>
	</tr>
	<tr>
		<td class="t1">생년월일</td>
		<td><%=mbirth %></td>
	</tr>
	<tr>
		<td class="t1">성별</td>
		<td><%=mgender%></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="회원가입" class="btn1">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="다시쓰기" class="btn1" onclick="history.back(-1)">
		</td>
	</tr>
</table>
</form>
</body>
</html>