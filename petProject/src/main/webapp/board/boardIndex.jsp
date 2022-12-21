<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=divice-width", initial-scale="1">
<link rel="stylesheet" href="../css/nav_style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="board.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
	<%@ include file="header.jsp" %>
	<%
		int pageNumber = 1; //기본 페이지 
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd"> <!-- 테이블 마다 생상 교차  -->
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						BoardDAO dao = new BoardDAO();
						ArrayList<BoardDTO> list = dao.getList(pageNumber);
						
						for(BoardDTO b : list){
					%>
						<tr>
							<td><a href="view.jsp?boardID=<%= b.getBoardID() %>" style="color:black;"><%= b.getBoardTitle() %></a></td>
							<td><a href="view.jsp?boardID=<%= b.getBoardID()%>" style="color:black;"><%= b.getUserID() %></a></td>
							<td><a href="view.jsp?boardID=<%= b.getBoardID()%>" style="color:black;"><%= b.getBoardDate()%></a></td>
						</tr>				
					<%		
						}
					%>
				</tbody>  
			</table>
			<%
				if(pageNumber != 1){
			%>					
				<a href="boardIndex.jsp?pageNumber=<%= pageNumber-1 %>" class="btn btn-success btn-array-left" >이전</a>
			<%					
				}if(dao.nextPage(pageNumber + 1)){
			%>
				<a href="boardIndex.jsp?pageNumber=<%= pageNumber+1 %>" class="btn btn-success btn-array-left">다음</a>				
			<% 
				}
			%>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>		
	</div>	
    
</body>
</html>