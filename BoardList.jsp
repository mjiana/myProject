<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, board.*, util.PagingCount"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="boardQuery" class="board.BoardQuery"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ���</title>
<link rel="stylesheet" type="text/css" href="A_Board.css">
<script type="text/javascript" src="A_BoardScript.js"></script>
</head>
<body>
<%
//�� �Խñ� ��
int rcnt = boardQuery.boardCount();
//������ �� ���
PagingCount pc = new PagingCount(rcnt);

//����¡ �غ�
int limit = 10;
int offset = 0;
int pagelink = 1;

String offset_get = request.getParameter("offset");
if(offset_get == null) offset = 0;
else offset = Integer.parseInt(offset_get);

String pagelink_get = request.getParameter("pagelink");
if(pagelink_get == null) pagelink = 1;
else pagelink = Integer.parseInt(pagelink_get);

//�˻���
String find = request.getParameter("find");
String search = request.getParameter("search");
%>
<table>
	<tr>
		<td class="tc1"><font>�Խ��� ����Ʈ</font></td>
	</tr>
</table>
<br>
<table>
	<tr>
		<td class="right" colspan="5">[<a href="BoardWrite.jsp">�۾���</a>]</td>
	</tr>
	<tr>
		<td class="t1">��ȣ</td>
		<td class="t1">����</td>
		<td class="t2">����</td>
		<td class="t1">�̸�</td>
		<td class="t1">��ȸ</td>
	</tr>
	<% 
	if(search == null || search == ""){
		//�����, �Խ��� ��� �ҷ�����
		Vector list = boardQuery.getBoardList(limit);
		for(int i=0; i<list.size(); i++){
			BoardBean bb = (BoardBean)list.elementAt(i);
		%>
		<tr>
			<td><%=bb.getIdx() %></td>
			<td><%=bb.getWdate() %></td>
			<td><a href="BoardContent.jsp?idx=<%=bb.getIdx() %>"><%=bb.getTitle() %></a></td>
			<td><%=bb.getName() %></td>
			<td><%=bb.getHit() %></td>
		</tr>
		<%
		}//for end
		%>
		<tr>
			<td colspan="3"></td>
			<td class="right" colspan="5">�� �Խñ� �� : <%=rcnt %>��</td>
		</tr>
	</table>
	<%=pc.showPaging(pagelink, "BoardList.jsp") %>
	<%
	}else if (search != null || search != ""){
		rcnt = boardQuery.boardCount(find,search);
		pc = new PagingCount(rcnt);

		//�����, �Խ��� ��� �ҷ�����
		Vector list = boardQuery.getSearchList(offset, limit, find, search);
		for(int i=0; i<list.size(); i++){
			BoardBean bb = (BoardBean)list.elementAt(i);
		%>
		<tr>
			<td><%=bb.getIdx() %></td>
			<td><%=bb.getWdate() %></td>
			<td><a href="BoardContent.jsp?idx=<%=bb.getIdx() %>"><%=bb.getTitle() %></a></td>
			<td><%=bb.getName() %></td>
			<td><%=bb.getHit() %></td>
		</tr>
		<%
		}//for end
		%>
		<tr>
			<td colspan="3"></td>
			<td class="right" colspan="5">�� �˻���� : <%=rcnt %>��</td>
		</tr>
		</table>
		<%=pc.showPaging(pagelink, "BoardList.jsp", find, search) %>
		<table>
			<tr><td><a href="BoardList.jsp">�������</a></td></tr>
		</table>
	<%	
	}
	%>

<!-- �˻��� -->
<form method="post" name="sform" action="BoardList.jsp">
<table>
	<tr>
		<td>
			<select name="find">
				<option value="name" <%=(find != null) && find.equals("name") ? "selected" : "" %>>�̸�</option>
				<option value="title" <%=(find != null) && find.equals("title") ? "selected" : "" %>>����</option>
				<option value="content" <%=(find != null) && find.equals("content") ? "selected" : "" %>>����</option>
			</select>
			<input type="text" name="search" class="txt1" value=<%=search == null ? "" : search %>>
			<input type="button" value="�˻�" onclick="send(this.form)">
		</td>
	</tr>
</table>
</form>
</body>
</html>