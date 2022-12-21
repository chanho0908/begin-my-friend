<!-- 실제로 글쓰기를 눌러서 만들어주는 Action페이지 -->
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트 문장사용 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 파일을 UTF-8로 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP게시판 웹사이트</title>
</head>
<body>
    <%
        String userID = null;
        // 로그인 된 사람은 회원 가입페이지에 들어갈수 없다
        if(session.getAttribute("userID") != null )
        {
            userID = (String) session.getAttribute("userID");
        }
        
        if(userID == null)
        {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인을 하세요')");
            script.println("location.href = '../member/LoginForm.jsp'");
            script.println("</script>");
        } 
        int boardID = 0;
        if (request.getParameter("boardID") != null)
        {
        	boardID = Integer.parseInt(request.getParameter("boardID"));
        }

        BoardDTO dto = new BoardDAO().getBoard(boardID);
        if (!userID.equals(dto.getUserID()))
        {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('권한이 없습니다')");
            script.println("location.href = 'boardIndex.jsp'");
            script.println("</script>");
        }else {
        if(request.getParameter("boardTitle") == null || request.getParameter("boardContent") == null
            || request.getParameter("boardTitle").equals("") || request.getParameter("boardContent").equals("")) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안된 사항이 있습니다.')");
            script.println("history.back()");
            script.println("</script>");
        } else {
            BoardDAO dao = new BoardDAO();
            int result = dao.update(boardID, request.getParameter("boardTitle"), request.getParameter("boardContent"));
               if(result == -1){ // 글수정에 실패했을 경우
                   PrintWriter script = response.getWriter(); //하나의 스크립트 문장을 넣을 수 있도록.
                   script.println("<script>");
                   script.println("alert('글 수정에 실패했습니다.')");
                   script.println("history.back()");
                   script.println("</script>");
               }
               else { // 글수정에 성공했을 경우
                   PrintWriter script = response.getWriter();
                   script.println("<script>");
                   script.println("location.href= 'boardIndex.jsp'");
                   script.println("</script>");
                   }
            }
        }
    %>
</body>
</html> 
