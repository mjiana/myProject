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
	if(df.maddress2.value == "0"){
		alert("거주지의 구를 선택하세요");
		df.maddress2.focus();
		return;
	}
	//거주지를 다 입력했다면 합쳐서 저장하기
	if(df.maddress1.value !="0" && df.maddress2.value!="0"){
		df.maddress.value = df.maddress1.value+" "+df.maddress2.value;
		//alert(df.maddress.value);
	}
	//교통수단  체크 여부
	var cnt = 0 ; 
	var ck = document.getElementsByName("mtrans");
	for (i=0; i<ck.length; i++){
		if(ck[i].checked == true) {
			cnt++;
			//alert(ck[i].value);
		}
	}
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
	
	//alert(df.mbirth.value);
	df.submit();
}