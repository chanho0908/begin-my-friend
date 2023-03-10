<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/nav_style.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%@ include file="header.jsp" %>
    
    <div class="container">
        <div class="row">
        <form method="post" action="boardInsert.jsp" enctype="multipart/form-data">
            <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
                <thead>
                    <tr>
                        <th colspan="2" style="background-color:#eeeeee; text-align:center;">게시판 글쓰기 양식</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                    	<td><input type="text" class="form-control" placeholder="글 제목"  name="boardTitle" maxlength="50" ></td>
                    </tr>
                    <tr>
                    	<td><textarea class="form-control" placeholder="글 내용"  name="boardContent" maxlength="2048" style="height:350px" ></textarea></td>
                    </tr>
                    <tr>
						<td><input type="file" name="fileName1"></td>
					</tr>
					<tr>
						<td><input type="file" name="fileName2"></td>
					</tr>
					<tr>
						<td><input type="file" name="fileName3"></td>
					</tr>
                </tbody>
            </table>
                <input type="submit"  class="btn btn-primary pull-right" value="글쓰기">
            </form>
        </div>
    </div>    
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   	<script src="js/bootstrap.js"></script>
</body>
</html>
