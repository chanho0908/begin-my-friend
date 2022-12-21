<%@page import="reserve.ReserveDTO"%>
<%@page import="reserve.ReserveDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="../css/reserveAction_style.css" rel="stylesheet"/>
<title>Insert title here</title>
</head>
<script>
		function func_reload(){
		 	opener.location.reload();
		}
	</script>
<body onload="func_reload()">

	<%	
		String userID = (String)session.getAttribute("userID");
		int shopNo = Integer.parseInt(request.getParameter("shopNo"));
		System.out.println(request.getParameter("shopNo"));
		String resDate = request.getParameter("resDate");
		
		ReserveDTO dto =  new ReserveDTO(shopNo, userID, resDate);
		new ReserveDAO().setReserve(dto);
	%>
	
	<div class="t1"> 등록이 완료 되었어요</div> <br>
	<div class="t2">소중한 내 아이와 행복한 시간 보내세요</div>
</body>
</html>