<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Index</title>
<link rel="stylesheet" type="text/css" href="Index_style.css">
<script type="text/javascript">
function goSign(){
	location.href="./SignIn.jsp";
}
function goBoard(){
	location.href="./BoardList.jsp";
}
</script>
</head>
<body>
<div class="div1"> <input type="button" class="btn1" value="Sign in" onclick="goSign()"></div>
<div class="div2"> <input type="button" class="btn1" value="Board" onclick="goBoard()"></div>

</body>
</html>