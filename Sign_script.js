/* 최초 작성일 : 2021.05.19
 */
//숫자만 입력받기
function isNum(e) {
	var num = e.keyCode;
	if(num >= 48 && num <= 57) {
		return true;
	} else {
		alert("숫자만 입력하세요");
		return false;
	}
}
//아이디 중복확인용 링크
function idCheck(id){
	var df = document.signForm;
	if(id == ""){
		alert("아이디 중복확인을 해주세요");
		df.mid.focus();
	}else{
		df.idCk.value="yes";
		//document.getElementById('mem_id').readOnly = true;
		url = "SignIdCheck.jsp?mid="+id;
		window.open(url,"IDcheck","width=350,height=200");
	}
}
//입력값 체크

function inputCheck(){
	//if문 길이 줄이기용 폼변수
	var df = document.signForm;
	
	//아이디 입력 여부
	if(df.mid.value==""){
		alert("아이디를 입력해주세요");
		df.mid.focus();
		return;
	} 
	//아이디 중복확인 여부
	if(df.idCk.value == "no"){
		alert("아이디 중복확인을 진행해주세요");
		df.mid.focus();
		return;
	}
	//비밀번호 입력 여부
	if(df.mpw.value==""){
		alert("비밀번호를 입력해주세요");
		df.mpw.focus();
		return;
	}
	//비밀번호확인 입력 여부
	if(df.repw.value==""){
		alert("비밀번호 확인을 입력해주세요");
		df.repw.focus();
		return;
	}
	//비밀번호와 비밀번호확인 일치 여부
	if(df.mpw.value != df.repw.value){
		alert("비밀번호가 일치하지 않습니다");
		df.repw.focus();
		return;
	}
	//이름 입력 여부
	if(df.mname.value==""){
		alert("이름을 입력해주세요");
		df.mname.focus();
		return;
	}
	//이메일 사용 시 입력 여부 및 형식 체크
	if(document.getElementById("email_yes").checked == true){
		if(df.memail.value == null || df.memail.value == ""){
			alert("이메일을 입력해주세요");
			df.memail.focus();
			return;
		}
		var str = df.memail.value;
		var atPos = str.indexOf('@');
		var atLastPos = str.lastIndexOf('@');
		var dotPos = str.indexOf('.'); // .
		var spacePos = str.indexOf(' '); // 공백
		var commaPos = str.indexOf(','); // ,
		var eMailSize = str.length;
		
		//참일때 통과({}블럭이 없다) 거짓일때 return
		if(atPos>1 && atPos==atLastPos && dotPos>3 && spacePos==-1 &&
			commaPos==-1 && atPos+1<dotPos && dotPos+1<eMailSize);
		else{
			alert("이메일 주소형식이 잘못되었습니다.\n다시 입력해주세요");
			df.memail.focus();
			return;
		}
	}
	//핸드폰번호 입력 여부
	if(df.mphone1.value=="000"){
		alert("핸드폰번호를 입력해주세요");
		df.mphone1.focus();
		return;
	}
	if(df.mphone2.value==""){
		alert("핸드폰번호를 입력해주세요");
		df.mphone2.focus();
		return;
	}
	if(df.mphone3.value==""){
		alert("핸드폰번호를 입력해주세요");
		df.mphone3.focus();
		return;
	}
	//핸드폰번호를 다 입력했다면 합쳐서 저장하기
	if(df.mphone1.value!="000" && df.mphone2.value!="" && df.mphone3.value!=""){
		df.mphone.value = df.mphone1.value+"-"+df.mphone2.value+"-"+df.mphone3.value;
		//alert(df.mphone.value);
	}
	//거주지 입력 여부
	if(df.maddress1.value == "0"){
		alert("거주지의 도/시/군을 선택하세요");
		df.maddress1.focus();
		return;
	}
	//iframe안에 select박스가 있기 때문에 adr2Frame.document.getElementById("maddress2").value로 작성해야한다.
	if(adr2Frame.document.getElementById("maddress2").value == "0"){
		alert("거주지의 구를 선택하세요");
		adr2Frame.document.getElementById("maddress2").focus();
		return;
	}
	//거주지를 다 입력했다면 합쳐서 저장하기
	if(df.maddress1.value !="0" && adr2Frame.document.getElementById("maddress2").value!="0"){
		df.maddress.value = df.maddress1.value+" "+adr2Frame.document.getElementById("maddress2").value;
		//alert(df.maddress.value);
	}
	//교통수단  체크 여부
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
		alert("주요 교통수단을 한개 이상 선택하세요");	
		return;
	}
	//선택사항인 생년월일을 입력했을 경우 합쳐서 저장하기
	if(df.myear.value == "0000"){
		df.myear.value = "";
	}else if(df.myear.value !="0000" && df.mmonth.value!="0" && df.mday.value!="0"){
		df.mbirth.value = df.myear.value+"년 "+df.mmonth.value+"월 "+df.mday.value+"일";
	}
	
	df.submit();
}
//거주지 
function selectAdr1(maddress1){
	//새창에 표시하기
		//url = "SignAddress.jsp?maddress1="+encodeURIComponent(encodeURIComponent(maddress1));
		//window.open(url,"Address","width=150,height=100");
	//iframe에 링크 넣기
	adr2Frame.location.href="SignAddress.jsp?maddress1="+encodeURIComponent(encodeURIComponent(maddress1));
	
	/* 05.24 오류
	url = "SignAddress.jsp?maddress1="+adr1;
	window.open(url,"Address","width=150,height=100");
	=> java.lang.IllegalArgumentException: 요청 타겟에서 유효하지 않은 문자가 발견되었습니다. 유효한 문자들은 RFC 7230과 RFC 3986에 정의되어 있습니다.
	한글 인코딩 지원을 안해서 그렇다고한다.
	server.xml에 추가하거나 파라미터에 encodeURI써서 사용하면 된다고 하는데 나는 server.xml을 수정할거다.
	Connector에 relaxedQueryChars="[,]"를 추가하기
	//수정 전 : <Connector URIEncoding="EUC-KR" connectionTimeout="20000" port="8888" protocol="HTTP/1.1" redirectPort="8443" />
	//수정 후 : <Connector URIEncoding="EUC-KR" connectionTimeout="20000" port="8888" protocol="HTTP/1.1" redirectPort="8443" relaxedQueryChars="[,]"/>
	Microsoft Edge에서는 잘되는데 crome이나 이클립스에서는 안된다.
	 */
}
// login Page js //
function logCheck(){
	document.location = "SignOut.jsp";
}
function loginCheck(){
	var df = document.login;
	if(df.mid.value==""){
		alert("아이디를 입력해주세요");
		df.mid.focus();
		return;
	}
	if(df.mpw.value==""){
		alert("비밀번호를 입력해주세요");
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