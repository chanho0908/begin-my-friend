<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBconnection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bookmark.BookmarkDAO"%>
<%@page import="bookmark.BookmarkDTO"%>
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
		String userID = (String)session.getAttribute("userID");
		String shopNo = request.getParameter("shopNo");
		int no = Integer.parseInt(shopNo);	
		
		BookmarkDAO dao = new BookmarkDAO();
		ArrayList<Integer> target = new ArrayList<>();
		target = dao.getList(userID);
		
		dao.insert(userID, no);
		
		if(target.contains(no)){ dao.delete(userID, no); }
	%>
	<script type="text/javascript">
		location.href='hospitals/hospital.jsp?shopNo=<%= shopNo %>'
	</script>
</body>
</html>