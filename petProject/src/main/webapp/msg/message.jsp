<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = (String) session.getAttribute("userID");
		String friendID = request.getParameter("friendID");
		String petName = request.getParameter("petName");
	%>
	
	
</body>
</html>