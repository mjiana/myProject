<%@page import="mysite.AddressBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, mysite.*" %>
<%-- 최초 작성일 : 2021.05.19 --%>    
<jsp:useBean id="memMgr" class="mysite.MemberMgr" />
<script type="text/javascript">
function selectA(){
	var adr1 = document.getElementById("maddress1").value;
	//if(adr1 != "0"){
		//alert(adr1);
	//}
	//document.getElementById("ck").value;
	//alert(adr1);
	document.maddrForm.submit();
	
}
</script>
<%
request.setCharacterEncoding("euc-kr");
String adr1 = request.getParameter("maddress1");
String ck = request.getParameter("ck") == null ? "n" : request.getParameter("ck");
//String ck = request.getParameter("ck");
Vector cList = memMgr.selectCity();
int ccnt = cList.size();
String maddress1 = "";
Vector dList = null;
AddressBean dBean = null;
int dcnt = 0;
%>
			<form method="post" name="maddrForm" action="SignAddress.jsp">
			<select name="maddress1" id="maddress1" onchange="selectA()">
				<option value="0">도/시/군</option>
				<%
					ck = "y";
				for(int i=0; i<ccnt; i++){
					AddressBean cBean = (AddressBean)cList.elementAt(i);
					maddress1 = cBean.getCity();
				%>
				<option value="<%=maddress1%>" <%if(maddress1.equals(adr1)) { %>  selected="selected" <% } %> ><%=maddress1%></option>
				<%
				}
				%>
			</select>
			</form>
			<%=ck %><%=adr1 %>
			<select name="maddress2" id="maddress2">
				<option value="0" selected="selected">구</option>
				<%
				if(ck.equals("y") && maddress1 != "0" && adr1 != null){
					dList = memMgr.selectDistrict(adr1);
					dcnt = dList.size();
					for(int j=0; j<dcnt; j++){
						dBean = (AddressBean)dList.elementAt(j);
						String maddress2 = dBean.getDistrict();
				%>
				<option value="<%=maddress2%>"><%=maddress2%></option>
				<%
					}
				}
				%>
			</select>
			