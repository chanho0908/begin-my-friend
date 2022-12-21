<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="reserve.ReserveDAO"%>
<%@page import="java.util.ArrayList"%>
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
		ArrayList<LocalDateTime> times = new ReserveDAO().getLDTimes();
		LocalDateTime ldate = LocalDateTime.now();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-일 HH:mm");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd일 HH:mm");
		for(LocalDateTime t : times){ 
			if(t.isBefore(ldate)){
				new ReserveDAO().delBeforReserve(formatter.format(t));
			}
			
		}
	%>
</body>
</html>