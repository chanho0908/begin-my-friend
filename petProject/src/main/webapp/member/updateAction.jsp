<%@page import="user.NickNameDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	String userID = (String) session.getAttribute("userID");
		String userName = request.getParameter("userName");
		String userAge = request.getParameter("userAge");
		String userPhone = request.getParameter("userPhone");
		new UserDAO().UserUpdate(userName, userAge, userPhone, userID);	
		
		String nickName = request.getParameter("nickName");
   		new NickNameDAO().nickNameUpdate(userID, nickName);
	%>
	
	<script type="text/javascript">
		location.href='userInfo.jsp';
	</script>
</body>
</html>