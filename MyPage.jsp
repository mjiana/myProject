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
<title>�� ���� ����</title>
<link rel="stylesheet" type="text/css" href="Sign_style.css">
<script type="text/javascript" src="Sign_script.js"></script>
</head>
<body>
	<table>
		<tr>
			<td class="t1">���̵�</td>
			<td><%=rb.getMid() %>
			</td>
		</tr>
		<tr>
			<td class="t1">�̸�</td>
			<td><%=rb.getMname() %></td>
		</tr>
		<tr>
			<td class="t1">�̸���</td>
			<td><%=rb.getMemail() == null ? "" : rb.getMemail() %>
			</td>
		</tr>
		<tr>
			<td class="t1">�ڵ�����ȣ</td>
			<td><%=rb.getMphone() %></td>
		</tr>
		<tr>
			<td class="t1">������</td>
			<td><%=rb.getMaddress() == null ? "" : rb.getMaddress() %>
			</td>
		</tr>
		<tr>
			<td class="t1">�ֿ� �������</td>
			<td><%=rb.getMtrans() %>
			</td>
		</tr>
		<tr>
			<td colspan=2  align="center"><b>���û���</b></td>
		</tr>
		<tr>
			<td class="t1">�������</td>
			<td><%=rb.getMbirth() == null ? "" : rb.getMbirth() %></td>
		</tr>
		<tr>
			<td class="t1">����</td>
			<td><% if(rb.getMgender() == null || rb.getMgender().equals("0")) out.print(""); else out.print(rb.getMgender());  %></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" class="btn1" value="�α׾ƿ�" onclick="logCheck()"> 
			</td>
		</tr>
	</table>
</body>
</html>