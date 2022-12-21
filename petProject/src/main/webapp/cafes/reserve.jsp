<%@page import="cafe.CafeDAO"%>
<%@page import="cafe.CafeDTO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="pet.PetDAO"%>
<%@page import="pet.PetDTO"%>
<%@page import="ground.GroundDTO"%>
<%@page import="ground.GroundDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>    
<link href="../css/nav_style.css" rel="stylesheet"/>
<link href="../css/resForm_style.css" rel="stylesheet"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script>
	function getParentText() {
		
		const TIME_ZONE = 3240 * 10000;
		const getTime = window.opener.document.getElementById('resDate').value;
		const d = new Date(getTime);

		const date = new Date(+d + TIME_ZONE).toISOString().split('T')[0];
		const time = d.toTimeString().split(' ')[0];

		const result =  date + '일 ' + time.substring(0, 5);
		
		document.getElementById("resDate").value = result;
		const frame = document.getElementById('alterForm');
		const btn = document.getElementById('alterBtn');
		frame.style.display='flex';
		btn.style.display='none';
	}
</script>
<body>
	<% 
		String userID = (String) session.getAttribute("userID");
	    String shopNo = request.getParameter("shopNo"); 
	    CafeDTO dto = new CafeDAO().getCafe(Integer.parseInt(shopNo));
	    PetDTO pet = new PetDAO().getMyPet(userID);
	    if(pet.getPetName() == null){
	    	PrintWriter script = response.getWriter();
   			script.println("<script>");
   			script.println("alert('반려동물 등록을 먼저 진행 해주세요!')"); 
   			script.println("window.close()"); 
            script.println("</script>");
	    }
	%>

<br>
    <div class="title"> 선택하신 일정을 확인해 주세요!</div>
    <br><br>
    <div class="showBtn"><input type="button" id="alterBtn" value="확인하기" onclick='getParentText()'></div>
    <div id="alterForm" style="display: none;">
 	<form action="reserveAction.jsp">
 		<div class="nameContainer">매장명 : <input type="text" name="shopName" readonly="readonly" value="<%= dto.getShopName()%>"></div><br>
	    <div class="nameContainer">등록 일자 : <input type="text" id="resDate" name="resDate" readonly="readonly"></div><br>
	    <div class="btnContainer">
	    <input type="hidden" value="<%= shopNo%>" name="shopNo">
	    <input type="button" value="취소" onclick="window.close()">
	    <input type="submit" value="확인" style="margin-left: 20px;">
	    </div>	
	    </form>
    </div>

</body>
</html>