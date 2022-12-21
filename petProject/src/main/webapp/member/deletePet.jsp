<%@page import="java.io.File"%>
<%@page import="pet.PetDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.DBconnection"%>
<%@page import="java.sql.Connection"%>
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
		String path = new PetDAO().getImage(userID);
		boolean isDel = false;
		
		String uploadedFileName = request.getRealPath("/upload/myPetImage/") + path;
        File realFile = new File(uploadedFileName);  //파일객체 생성

        isDel = realFile.delete(); //boolean type 리턴

        System.out.println(isDel == true ? "complete" :  "fail");		
		
		Connection conn = DBconnection.getConnection();
		PreparedStatement pstmt = null;
		String SQL = "DELETE FROM MYPET WHERE USERID=?";
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, userID);
		pstmt.executeUpdate();
		
	%>
	
	<script type="text/javascript">
		location.href="userInfo.jsp";
	</script>
</body>
</html>