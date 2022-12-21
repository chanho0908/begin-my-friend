<%@page import="reserve.ReserveDAO"%>
<%@page import="reserve.ReserveDTO"%>
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
		String userID = (String)session.getAttribute("userID");
		String shopNo = request.getParameter("shopNo");
		String resDate = request.getParameter("resDate");
		new ReserveDAO().delete(userID, Integer.parseInt(shopNo),resDate );
	%>
	
	<script type="text/javascript">
		location.href="bookmark.jsp"
	</script>
</body>
</html>