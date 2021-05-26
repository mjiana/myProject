<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, board.*, util.PagingCount"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="boardQuery" class="board.BoardQuery"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="A_Board.css">
<script type="text/javascript" src="A_BoardScript.js"></script>
</head>
<body>
<%
//총 게시글 수
int rcnt = boardQuery.boardCount();
//페이지 수 계산
PagingCount pc = new PagingCount(rcnt);

//페이징 준비
int limit = 10;
int offset = 0;
int pagelink = 1;

String offset_get = request.getParameter("offset");
if(offset_get == null) offset = 0;
else offset = Integer.parseInt(offset_get);

String pagelink_get = request.getParameter("pagelink");
if(pagelink_get == null) pagelink = 1;
else pagelink = Integer.parseInt(pagelink_get);

//검색어
String find = request.getParameter("find");
String search = request.getParameter("search");
%>
<table>
	<tr>
		<td class="tc1"><font>게시판 리스트</font></td>
	</tr>
</table>
<br>
<table>
	<tr>
		<td class="right" colspan="5">[<a href="BoardWrite.jsp">글쓰기</a>]</td>
	</tr>
	<tr>
		<td class="t1">번호</td>
		<td class="t1">일자</td>
		<td class="t2">제목</td>
		<td class="t1">이름</td>
		<td class="t1">조회</td>
	</tr>
	<% 
	if(search == null || search == ""){
		//뷰로직, 게시판 목록 불러오기
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
			<td class="right" colspan="5">총 게시글 수 : <%=rcnt %>개</td>
		</tr>
	</table>
	<%=pc.showPaging(pagelink, "BoardList.jsp") %>
	<%
	}else if (search != null || search != ""){
		rcnt = boardQuery.boardCount(find,search);
		pc = new PagingCount(rcnt);

		//뷰로직, 게시판 목록 불러오기
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
			<td class="right" colspan="5">총 검색결과 : <%=rcnt %>건</td>
		</tr>
		</table>
		<%=pc.showPaging(pagelink, "BoardList.jsp", find, search) %>
		<table>
			<tr><td><a href="BoardList.jsp">목록으로</a></td></tr>
		</table>
	<%	
	}
	%>

<!-- 검색폼 -->
<form method="post" name="sform" action="BoardList.jsp">
<table>
	<tr>
		<td>
			<select name="find">
				<option value="name" <%=(find != null) && find.equals("name") ? "selected" : "" %>>이름</option>
				<option value="title" <%=(find != null) && find.equals("title") ? "selected" : "" %>>제목</option>
				<option value="content" <%=(find != null) && find.equals("content") ? "selected" : "" %>>내용</option>
			</select>
			<input type="text" name="search" class="txt1" value=<%=search == null ? "" : search %>>
			<input type="button" value="검색" onclick="send(this.form)">
		</td>
	</tr>
</table>
</form>
</body>
</html>