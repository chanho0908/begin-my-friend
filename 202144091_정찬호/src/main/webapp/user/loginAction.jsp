<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="user.UserDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%

		String userID = request.getParameter("username");
		String pw = request.getParameter("password");
		
		UserDAO user = new UserDAO();
		int result = user.login(userID, pw);
	   	
	   	if(result == 1){
	   		PrintWriter script = response.getWriter();
	   		session.setAttribute("userID", userID);
   			script.println("<script>");
            script.println("location.href='futsal.jsp'");
            script.println("</script>");
	   	}else if(result == 2){
	   		PrintWriter script = response.getWriter();
   			script.println("<script>");
            script.println("alert('비밀번호가 틀립니다.')");
            script.println("location.href='loginForm.jsp'");    // 이전 페이지로 사용자를 보냄
            script.println("</script>");
	   	}else if(result == 0){
	   		PrintWriter script = response.getWriter();
	   		script.println("<script>");
	        script.println("alert('존재하지 않는 아이디입니다.')");
	        script.println("location.href='loginForm.jsp'");    // 이전 페이지로 사용자를 보냄
	        script.println("</script>");
	   	}
	   
    %>
</body>
</html>