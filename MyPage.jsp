<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,mysite.*"%>
<jsp:useBean id="memMgr" class="mysite.MemberMgr"/>
<% 
String idKey = (String)session.getAttribute("idKey");
if(idKey == null)response.sendRedirect("SignIn.jsp");
SignBean rb = memMgr.memberView(idKey);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>내 정보 보기</title>
<link rel="stylesheet" type="text/css" href="Sign_style.css">
<script type="text/javascript" src="Sign_script.js"></script>
</head>
<body>
	<table>
		<tr>
			<td class="t1">아이디</td>
			<td><%=rb.getMid() %>
			</td>
		</tr>
		<tr>
			<td class="t1">이름</td>
			<td><%=rb.getMname() %></td>
		</tr>
		<tr>
			<td class="t1">이메일</td>
			<td><%=rb.getMemail() == null ? "" : rb.getMemail() %>
			</td>
		</tr>
		<tr>
			<td class="t1">핸드폰번호</td>
			<td><%=rb.getMphone() %></td>
		</tr>
		<tr>
			<td class="t1">거주지</td>
			<td><%=rb.getMaddress() == null ? "" : rb.getMaddress() %>
			</td>
		</tr>
		<tr>
			<td class="t1">주요 교통수단</td>
			<td><%=rb.getMtrans() %>
			</td>
		</tr>
		<tr>
			<td colspan=2  align="center"><b>선택사항</b></td>
		</tr>
		<tr>
			<td class="t1">생년월일</td>
			<td><%=rb.getMbirth() == null ? "" : rb.getMbirth() %></td>
		</tr>
		<tr>
			<td class="t1">성별</td>
			<td><% if(rb.getMgender() == null || rb.getMgender().equals("0")) out.print(""); else out.print(rb.getMgender());  %></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" class="btn1" value="로그아웃" onclick="logCheck()"> 
			</td>
		</tr>
	</table>
</body>
</html>