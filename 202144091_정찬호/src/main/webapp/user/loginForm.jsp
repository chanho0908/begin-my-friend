<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/longin_js.js"></script>
<link rel="stylesheet" href="../css/login_style.css"> 
</head>
<body>
	<div class="background-wrap">
  <div class="background"></div>
</div>

<form id="accesspanel" action="loginAction.jsp" method="post">
  <h1 id="litheader">FOOTBALL GROUND</h1>
  <div class="inset">
    <p>
      <input type="text" name="username" id="email" placeholder="ID" required="required">
    </p>
    <p>
      <input type="password" name="password" id="password" placeholder="Password" required="required">
    </p>
    <input class="loginLoginValue" type="hidden" name="service" value="login" />
  </div>
  <p class="p-container">
    <input type="submit" name="Login" id="go" value="LOGIN">
  </p>
</form>
</body>
</html>