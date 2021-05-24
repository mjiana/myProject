<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, mysite.*" %>
<%-- 
최초 작성일 : 2021.05.19 
수정1 : 2021.05.20
수정2 : 2021.05.24
--%>    
<jsp:useBean id="memMgr" class="mysite.MemberMgr" />
<%
request.setCharacterEncoding("euc-kr");
String maddress1 = request.getParameter("maddress1");
if(maddress1 != null) 
	maddress1 = URLDecoder.decode(maddress1, "utf-8"); 
else maddress1 = "0";
String maddress2 = "";
List dList = memMgr.selectDistrict(maddress1);
AddressBean dBean = null;
int dcnt = dList.size();
%>
			<select name="maddress2" id="maddress2">
				<option value="0">구</option>
				<%
				for(int j=0; j<dcnt; j++){
					dBean = (AddressBean)dList.get(j);
					maddress2 = dBean.getDistrict();
				%>
				<option value="<%=maddress2%>"><%=maddress2%></option>
				<%
					}
				%>
			</select>

			