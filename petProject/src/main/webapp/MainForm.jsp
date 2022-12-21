<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="css/nav_style.css?after"/>
<link rel="stylesheet" href="css/content_icon.css?after"/>
<link rel="stylesheet" href="css/recommand_box.css?after"/>
<link rel="stylesheet" href="css/nav_style.css"/>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title></title>
</head>
<body>

	<%@ include file="header.jsp" %>
    
	<section>
		<div align="center"> 
		<img src="images/yoga_baby.jpg" width="80%" height="700px" />
		</div>
	</section>	
    <div class="content">
           <div class="content_value_column_first">
               <a href="hospitals/cardview.jsp"><img src="images/icons/icon-hospital.png"></a>
               <h4>동물 병원</h4>
           </div>
           <div class="content_value_column_first">
               <a href="cafes/cardview.jsp""><img src="images/icons/icon-petShop.png"></a>
               <h4>애견 카페</h4>
           </div>
           <div class="content_value_column_second">
               <a href="grounds/cardview.jsp"><img src="images/icons/icon-gym.png"></a>
               <h4>운동장</h4>
           </div>
           <div>
               <a href="http://pawinhand.kr/"><img src="images/icons/icon-pawnihand.png" width="65px" height="65px"></a>
               <h4>포인 핸드</h4>
           </div>
      	 </div>
   	</div>
</div>
</body>
</html>