<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=divice-width", initial-scale = "1" >
<link rel="stylesheet" href="css/bootstrap.css"> 
<% request.setCharacterEncoding("utf-8"); %>   
<%@ page import="board.*" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/nav_style.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%
		int boardID = 0;
		if(request.getParameter("boardID") != null){
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		
		if(boardID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'boardIndex.jsp'");
			script.println("</script>");
		}
		
		BoardDTO dto = new BoardDAO().getBoard(boardID);
		if(!userID.equals(dto.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'boardIndex.jsp'");
			script.println("</script>");
		}
		ArrayList<String> paths = new ImageDAO().getImage(boardID);
		for(String p : paths){System.out.println(p);}
	%>	
	
	<div class="container">
		<div class="row">
		<form method="post" action="updateAction.jsp?boardID=<%= boardID %>" enctype="multipart/form-data">
			<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd"> <!-- 테이블 마다 생상 교차  -->
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
						<input type="text" class="form-control" palceholder="글 제목" name="boardTitle" maxlength="25" value="<%= dto.getBoardTitle() %>">
						</td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용"  name="boardContent" maxlength="2048" style="height:350px" >
						<%= dto.getBoardContent() %></textarea></td>
					</tr>
					<tr>
					
						<td><input type="file" name="fileName1" ></td>
					</tr>
					<tr>
						<td><input type="file" name="fileName2" ></td>
					</tr>
					<tr>
						<td><input type="file" name="fileName3" ></td>
					</tr>
					
				</tbody>
			</table>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기"/>
			</form>
		</div>
	</div>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>