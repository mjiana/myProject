<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- ���� �ۼ��� : 2021.05.19 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� Ȯ��</title>
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
<form name="signCkForm" method="post" > <!-- action="SignUpInsert.jsp" -->
<table border="1">
	<tr>
		<td colspan="2"><b>���� Ȯ��</b></td>
	</tr>
	<tr>
		<td width="10%">���̵�</td>
		<td width="30%"><%=mid %></td>
	</tr>
	<tr>
		<td>�̸�</td>
		<td><%=mname %></td>
	</tr>
	<tr>
		<td>�̸���</td>
		<td><%=memail %></td>
	</tr>
	<tr>
		<td>�ڵ�����ȣ</td>
		<td><%=mphone %></td>
	</tr>
	<tr>
		<td>������</td>
		<td><%=maddress %></td>
	</tr>
	<tr>
		<td>�ֿ� �������</td>
		<td><%
			int cnt = mtrans.length;
			for(int i=0; i<cnt; i++){
				out.print(mtrans[i]);
				if(i<cnt-1) out.print(", ");
			}
		 %></td>
	</tr>
	<tr>
		<td colspan=2  align="center"><b>���û���</b></td>
	</tr>
	<tr>
		<td>�������</td>
		<td><%=mbirth %></td>
	</tr>
	<tr>
		<td>����</td>
		<td><%=mgender%></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="ȸ������" onclick="">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="�ٽþ���" onclick="history.back(-1)">
		</td>
	</tr>
</table>
</form>
</body>
</html>