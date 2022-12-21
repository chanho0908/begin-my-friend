<%@page import="java.nio.file.Path"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<link rel="stylesheet" href="../css/nav_style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<style>
	a:link{
	color: white;
	text-decoration: none;
}

a:visited{
	color: white;
	text-decoration: none;
}

a:hover{
	color: white;
	text-decoration: none;
}

a:active{
	color: white;
}
</style>
<body> 
	<%@ include file="header.jsp" %>
	<%	

		int boardID = 0;
		if(request.getParameter("boardID") != null)
		{
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		if(boardID ==0)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'boardIndex.jsp'");
			script.println("</script>");
		}
		BoardDTO dto = new BoardDAO().getBoard(boardID);
		
		ArrayList<String> paths = new ImageDAO().getImage(boardID);  
		
	%>
	
	<div class="container">
		<div class="row">
				<table class="table table-striped" style="text-align:enter; border:1px solid #dddddd;">
					<tbody>
						<tr>
							<td class="" style="width: 30%; text-align: center; font-size: 18px; font-weight: bold">글제목</td>
							<td colspan= "6"><%= dto.getBoardTitle()%></td>
						</tr>
						<tr>
							<td style="text-align: center; font-size: 18px; font-weight: bold"">작성자</td>
							<td colspan= "6"><%= dto.getUserID()  %></td>
						</tr>
						<tr>
							<td style="text-align: center; font-size: 18px; font-weight: bold"">작성일자</td>
							<td colspan= "6"><%= dto.getBoardDate().substring(0, 11) + dto.getBoardDate().substring(11, 13) + " 시 " + dto.getBoardDate().substring(14, 16) +" 분" %></td>
						</tr>
						<tr>
							<td style="text-align: center; font-size: 18px; font-weight: bold">사진</td>
							
							<%	
								if(paths != null){
								for(String p : paths){
							%>		
									<td colspan= "2" style="min-height: 200px; text-align: left;">
									<img src="../upload/boardImages/<%= p %>" style="width:300px; height:300px; object-fit: contain;">
									</td>
							<%		
								}}
							%>
						</tr>
						<tr>
							<td style="text-align: center; font-size: 18px; font-weight: bold">내용</td>
							<td colspan= "6" style="text-align: left;"><%= dto.getBoardContent() %></td>
						</tr>
					</tbody>
				</table>
				<a href="boardIndex.jsp" class="btn btn-primary">목록</a>
				<%
					if(userID != null && userID.equals(dto.getUserID())){
				%>
				<a href="update.jsp?boardID=<%= boardID %>" class="btn btn-primary">수정</a>
				<a onclick="return confirm('정말로 삭제하시겠습니까?');" href="deleteAction.jsp?boardID=<%= boardID %>" class="btn btn-primary">삭제</a>
				<%
					}
				%>
		</div>
	</div>
</body>
</html>