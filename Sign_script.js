/* ���� �ۼ��� : 2021.05.19
 */
//���ڸ� �Է¹ޱ�
function isNum(e) {
	var num = e.keyCode;
	if(num >= 48 && num <= 57) {
		return true;
	} else {
		alert("���ڸ� �Է��ϼ���");
		return false;
	}
}
//���̵� �ߺ�Ȯ�ο� ��ũ
function idCheck(id){
	var df = document.signForm;
	if(id == ""){
		alert("���̵� �ߺ�Ȯ���� ���ּ���");
		df.mid.focus();
	}else{
		df.idCk.value="yes";
		//document.getElementById('mem_id').readOnly = true;
		url = "SignIdCheck.jsp?mid="+id;
		window.open(url,"IDcheck","width=350,height=200");
	}
}
//�Է°� üũ

function inputCheck(){
	//if�� ���� ���̱�� ������
	var df = document.signForm;
	
	//���̵� �Է� ����
	if(df.mid.value==""){
		alert("���̵� �Է����ּ���");
		df.mid.focus();
		return;
	} 
	//���̵� �ߺ�Ȯ�� ����
	if(df.idCk.value == "no"){
		alert("���̵� �ߺ�Ȯ���� �������ּ���");
		df.mid.focus();
		return;
	}
	//��й�ȣ �Է� ����
	if(df.mpw.value==""){
		alert("��й�ȣ�� �Է����ּ���");
		df.mpw.focus();
		return;
	}
	//��й�ȣȮ�� �Է� ����
	if(df.repw.value==""){
		alert("��й�ȣ Ȯ���� �Է����ּ���");
		df.repw.focus();
		return;
	}
	//��й�ȣ�� ��й�ȣȮ�� ��ġ ����
	if(df.mpw.value != df.repw.value){
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�");
		df.repw.focus();
		return;
	}
	//�̸� �Է� ����
	if(df.mname.value==""){
		alert("�̸��� �Է����ּ���");
		df.mname.focus();
		return;
	}
	//�̸��� ��� �� �Է� ���� �� ���� üũ
	if(document.getElementById("email_yes").checked == true){
		if(df.memail.value == null || df.memail.value == ""){
			alert("�̸����� �Է����ּ���");
			df.memail.focus();
			return;
		}
		var str = df.memail.value;
		var atPos = str.indexOf('@');
		var atLastPos = str.lastIndexOf('@');
		var dotPos = str.indexOf('.'); // .
		var spacePos = str.indexOf(' '); // ����
		var commaPos = str.indexOf(','); // ,
		var eMailSize = str.length;
		
		//���϶� ���({}���� ����) �����϶� return
		if(atPos>1 && atPos==atLastPos && dotPos>3 && spacePos==-1 &&
			commaPos==-1 && atPos+1<dotPos && dotPos+1<eMailSize);
		else{
			alert("�̸��� �ּ������� �߸��Ǿ����ϴ�.\n�ٽ� �Է����ּ���");
			df.memail.focus();
			return;
		}
	}
	//�ڵ�����ȣ �Է� ����
	if(df.mphone1.value=="000"){
		alert("�ڵ�����ȣ�� �Է����ּ���");
		df.mphone1.focus();
		return;
	}
	if(df.mphone2.value==""){
		alert("�ڵ�����ȣ�� �Է����ּ���");
		df.mphone2.focus();
		return;
	}
	if(df.mphone3.value==""){
		alert("�ڵ�����ȣ�� �Է����ּ���");
		df.mphone3.focus();
		return;
	}
	//�ڵ�����ȣ�� �� �Է��ߴٸ� ���ļ� �����ϱ�
	if(df.mphone1.value!="000" && df.mphone2.value!="" && df.mphone3.value!=""){
		df.mphone.value = df.mphone1.value+"-"+df.mphone2.value+"-"+df.mphone3.value;
		//alert(df.mphone.value);
	}
	//������ �Է� ����
	if(df.maddress1.value == "0"){
		alert("�������� ��/��/���� �����ϼ���");
		df.maddress1.focus();
		return;
	}
	//iframe�ȿ� select�ڽ��� �ֱ� ������ adr2Frame.document.getElementById("maddress2").value�� �ۼ��ؾ��Ѵ�.
	if(adr2Frame.document.getElementById("maddress2").value == "0"){
		alert("�������� ���� �����ϼ���");
		adr2Frame.document.getElementById("maddress2").focus();
		return;
	}
	//�������� �� �Է��ߴٸ� ���ļ� �����ϱ�
	if(df.maddress1.value !="0" && adr2Frame.document.getElementById("maddress2").value!="0"){
		df.maddress.value = df.maddress1.value+" "+adr2Frame.document.getElementById("maddress2").value;
		//alert(df.maddress.value);
	}
	//�������  üũ ����
	var cnt = 0 ; 
	var ck = document.getElementsByName("mtransCk");
	
	for (i=0; i<ck.length; i++){
		if(ck[i].checked == true) {
			cnt++;
			df.mtrans.value += ck[i].value+" ";
			//alert(ck[i].value);
		}
	}
	//alert(df.mtrans.value);
	if(cnt < 1){
		alert("�ֿ� ��������� �Ѱ� �̻� �����ϼ���");	
		return;
	}
	//���û����� ��������� �Է����� ��� ���ļ� �����ϱ�
	if(df.myear.value == "0000"){
		df.myear.value = "";
	}else if(df.myear.value !="0000" && df.mmonth.value!="0" && df.mday.value!="0"){
		df.mbirth.value = df.myear.value+"�� "+df.mmonth.value+"�� "+df.mday.value+"��";
	}
	
	df.submit();
}
//������ 
function selectAdr1(maddress1){
	//��â�� ǥ���ϱ�
		//url = "SignAddress.jsp?maddress1="+encodeURIComponent(encodeURIComponent(maddress1));
		//window.open(url,"Address","width=150,height=100");
	//iframe�� ��ũ �ֱ�
	adr2Frame.location.href="SignAddress.jsp?maddress1="+encodeURIComponent(encodeURIComponent(maddress1));
	
	/* 05.24 ����
	url = "SignAddress.jsp?maddress1="+adr1;
	window.open(url,"Address","width=150,height=100");
	=> java.lang.IllegalArgumentException: ��û Ÿ�ٿ��� ��ȿ���� ���� ���ڰ� �߰ߵǾ����ϴ�. ��ȿ�� ���ڵ��� RFC 7230�� RFC 3986�� ���ǵǾ� �ֽ��ϴ�.
	�ѱ� ���ڵ� ������ ���ؼ� �׷��ٰ��Ѵ�.
	server.xml�� �߰��ϰų� �Ķ���Ϳ� encodeURI�Ἥ ����ϸ� �ȴٰ� �ϴµ� ���� server.xml�� �����ҰŴ�.
	Connector�� relaxedQueryChars="[,]"�� �߰��ϱ�
	//���� �� : <Connector URIEncoding="EUC-KR" connectionTimeout="20000" port="8888" protocol="HTTP/1.1" redirectPort="8443" />
	//���� �� : <Connector URIEncoding="EUC-KR" connectionTimeout="20000" port="8888" protocol="HTTP/1.1" redirectPort="8443" relaxedQueryChars="[,]"/>
	Microsoft Edge������ �ߵǴµ� crome�̳� ��Ŭ���������� �ȵȴ�.
	 */
}
// login Page js //
function logCheck(){
	document.location = "SignOut.jsp";
}
function loginCheck(){
	var df = document.login;
	if(df.mid.value==""){
		alert("���̵� �Է����ּ���");
		df.mid.focus();
		return;
	}
	if(df.mpw.value==""){
		alert("��й�ȣ�� �Է����ּ���");
		df.mpw.focus();
		return;
	}
	df.submit();
}
function signUp(){
	document.location = "SignUp.jsp";
}
////////////////////
// My Page js //
function viewPage(){
	document.location = "MyPage.jsp";
}