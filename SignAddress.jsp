<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, mysite.*" %>
<%-- 
최초 작성일 : 2021.05.19 
수정1 : 2021.05.20
수정2 : 2021.05.24
--%>    
<jsp:useBean id="memMgr" class="mysite.MemberMgr" />
<%
List cList = memMgr.selectCity();
int ccnt = cList.size();
String maddress1 = "";
String maddress2 = "";
//List<String> adrList = new ArrayList<String>();
//String adr1 = "";
List dList = null;
AddressBean dBean = null;
int dcnt = 0;
%>
			<select name="maddress1" id="maddress1"><!--  onchange="selectAddr()" -->
				<option value="0">도/시/군</option>
				<%
				for(int i=0; i<ccnt; i++){
					AddressBean cBean = (AddressBean)cList.get(i);
					maddress1 = cBean.getCity();
					//adrList.add(i, maddress1);
					dList = memMgr.selectDistrict(maddress1);
					%>
					<option value="<%=maddress1%>"><%=maddress1%></option>
				<%
				}
				dcnt = dList.size();
				%>
				</select>
			<select name="maddress2" id="maddress2">
				<option value="0">구</option>
				<%
				
					for(int j=0; j<dcnt; j++){
						//if(dList.get(j).equals(maddress1)){
							dBean = (AddressBean)dList.get(j);
							maddress2 = dBean.getDistrict();
				%>
				<option value="<%=maddress2%>"><%=maddress2%></option>
				<%
					}
				%>
			</select>

			