<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO" %>
<%@page import="java.sql.*"%>
<%@page import="util.DBconnection" %>
<%@page import="java.io.PrintWriter"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>q
	<%	
		request.setCharacterEncoding("UTF-8");
				
		String userID = request.getParameter("userID");
		String userPassword = request.getParameter("userPassword");
		String userPassword_re = request.getParameter("userPassword_re");
		String userName = request.getParameter("userName");
		String userGender = request.getParameter("userGender");
		int userAge = Integer.parseInt(request.getParameter("userAge"));
		String userPhone = request.getParameter("userPhone");
		
		int result = 0;
		try{
	        String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?, ?, now())";
			Connection conn = null;
	        PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			conn = DBconnection.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPassword);
			pstmt.setString(3, userName);
			pstmt.setString(4, userGender);
			pstmt.setInt(5, userAge);
			pstmt.setString(6, userPhone);
  		
			result = pstmt.executeUpdate();
		}catch(Exception e){e.printStackTrace();}
		
		if (result > 0) {
			PrintWriter script = response.getWriter();
	        request.setAttribute("userID", userID);
	        %>
	        <jsp:forward page="futsal.jsp"/>
	        <%
		}	
	%>
</body>
</html>