/**********************************************/
/* write.jsp */
function trans(theform){
	if(theform.name.value == ""){
		alert("�̸��� �����ϼ���");
		theform.name.focus();
		return;
	}
	if(theform.email.value == ""){
		alert("�̸����� �����ϼ���");
		theform.email.focus();
		return;
	}
	if(theform.title.value == ""){
		alert("������ �����ϼ���");
		theform.title.focus();
		return;
	}
	if(theform.pwd.value == ""){
		alert("��ȣ�� �����ϼ���");
		theform.pwd.focus();
		return;
	}
	if(theform.content.value == ""){
		alert("������ �����ϼ���");
		theform.content.focus();
		return;
	}
	theform.submit();
}
/**********************************************/
/* list.jsp */
function send(theform){
	if(theform.search.value==""){
		alert("�˻�� �Է��ϼ���.");
		theform.search.focus();
		return;
	}
	theform.submit();
}
/**********************************************/
/* content.jsp */
function editsend(idx){
	location.href="BoardPw.jsp?idx="+idx+"&choice=Edit";
}
function delsend(idx){
	location.href="BoardPw.jsp?idx="+idx+"&choice=Del";
}
/******************************************************** */
/* */
