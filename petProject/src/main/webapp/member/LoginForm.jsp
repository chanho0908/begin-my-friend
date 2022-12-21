<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/nav_style.css" rel="stylesheet"/>
<link href="../css/loginFormStyle.css" rel="stylesheet"/>
</head>
<script type="text/javascript">
	function checkLogin(){
		var form = document.longinInfo;
		if(form.userID.value == "" || form.userID.value.length == 0){
			alert("아이디를 입력 해주세요");
			return false;
		}
		
		if(form.userPassword.value == "" || form.userID.value.length == 0){
			alert("비밀번호를 입력 해주세요");
			return false;
		}
	}
</script>
<body>
 	
 	<div class="container">
      <form action="loginAction.jsp" onsubmit="return checkLogin()" name="longinInfo">
        <h2>SIGN IN</h2>
        <input type="text" placeholder="USERNAME" name="userID">
        <input type="password" placeholder="PASSWORD" name="userPassword">
        <input type="submit" value="로그인" class="submit"> 
      </form>
     </div>
      
</body>
</html>
</body>
</html>