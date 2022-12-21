<%@page import="bookmark.BookmarkDAO"%>
<%@page import="bookmark.BookmarkDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.DBconnection"%>
<%@page import="java.sql.Connection"%>
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
		new BookmarkDAO().delete(userID, Integer.parseInt(shopNo));
	%>
	
	<script type="text/javascript">
		location.href="bookmark.jsp"
	</script>
</body>
</html>