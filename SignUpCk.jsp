<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- 
���� �ۼ��� : 2021.05.19
������ : 2021.05.24 - �̻��
 --%>
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
<form name="signCkForm" method="post" action="SignUpInsert.jsp"> <!--  -->
<table>
	<tr>
		<td colspan="2"><b>���� Ȯ��</b></td>
	</tr>
	<tr>
		<td class="t1">���̵�</td>
		<td><%=mid %></td>
	</tr>
	<tr>
		<td class="t1">�̸�</td>
		<td><%=mname %></td>
	</tr>
	<tr>
		<td class="t1">�̸���</td>
		<td><%=memail %></td>
	</tr>
	<tr>
		<td class="t1">�ڵ�����ȣ</td>
		<td><%=mphone %></td>
	</tr>
	<tr>
		<td class="t1">������</td>
		<td><%=maddress %></td>
	</tr>
	<tr>
		<td class="t1">�ֿ� �������</td>
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
		<td class="t1">�������</td>
		<td><%=mbirth %></td>
	</tr>
	<tr>
		<td class="t1">����</td>
		<td><%=mgender%></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="ȸ������" class="btn1">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="�ٽþ���" class="btn1" onclick="history.back(-1)">
		</td>
	</tr>
</table>
</form>
</body>
</html>