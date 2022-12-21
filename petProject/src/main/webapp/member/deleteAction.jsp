<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.*" %>    
<%@page import="java.io.PrintWriter"%>
<%@page import="util.DBconnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%

		String userID = (String)session.getAttribute("userID");
		String pw = request.getParameter("userPassword");
		
		UserDAO user = new UserDAO();
		int result = user.login(userID, pw);
	   	
	   	if(result == 1){	
	   		user.deleteUser(userID);
	   		session.invalidate();
	   		PrintWriter script = response.getWriter();
   			script.println("<script>");
   			script.println("alert('탈퇴가 완료 되었습니다.')"); 
   			script.println("location.href='../MainForm.jsp'"); 
            script.println("</script>");
	   	}else if(result == 2){
	   		PrintWriter script = response.getWriter();
   			script.println("<script>");
            script.println("alert('비밀번호가 틀립니다.')");
            script.println("location.href='deleteForm.jsp'");    // 이전 페이지로 사용자를 보냄
            script.println("</script>");
	   	}
	   
    %>
</body>
</html>