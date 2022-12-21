<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>	
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="util.DBconnection" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%	
		String userID = null;
	    // 로그인 된 사람은 회원가입페이지에 들어갈수 없다
	    if(session.getAttribute("userID") != null )
	    {
	        userID = (String) session.getAttribute("userID");
	    }
	    
	    if(userID == null)
	    {
	        PrintWriter script = response.getWriter();
	        script.println("<script>");
	        script.println("alert('로그인을 하세요')");
	        script.println("location.href = 'member/LoginForm.jsp'");
	        script.println("</script>");
	    }
	    
	    int next = new BoardDAO().getNext();
	    
	    String uploadpath = request.getRealPath("/upload/boardImages");
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		
		MultipartRequest mr = new MultipartRequest(request, uploadpath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		Enumeration fileNames = mr.getFileNames(); //폼의 이름 반환
		String boardTitle = mr.getParameter("boardTitle");
		String boardContent = mr.getParameter("boardContent");
		
		if(boardTitle == null || boardContent == null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안된 사항이 있습니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
		
		int result = new BoardDAO().write(boardTitle, userID, boardContent);
		
	    String fileName = "";
	    String realFileName = "";
	    while(fileNames.hasMoreElements()){
    		int rst = 1;

    		String param = (String) fileNames.nextElement();
			fileName = mr.getFilesystemName(param);
			realFileName = mr.getFilesystemName(param);
			
			if(fileName == null) continue;
			if(fileName.endsWith(".doc") && fileName.endsWith(".hwp") && fileName.endsWith(".pdf") && fileName.endsWith(".xls")){
			%>
				<script type="text/javascript">
					alert("업로드 할 수 업는 확장자입니다.");
				</script>
			<%
			}else{
				
				String FSQL = "INSERT INTO FILE VALUES (?, ?, ?)";
				Connection conn = null;
				PreparedStatement pstmt = null;
				
				conn = DBconnection.getConnection();					
				pstmt = conn.prepareStatement(FSQL);
				pstmt.setInt(1, next);
				pstmt.setString(2, fileName);
				pstmt.setString(3, realFileName);
				
				rst = pstmt.executeUpdate();
				if(rst < 0) out.println("Insert Fail");
			    if(pstmt != null) pstmt.close();			       
			}
		} 
	   response.sendRedirect("boardIndex.jsp"); 
	%>
	
	
</body>
</html>