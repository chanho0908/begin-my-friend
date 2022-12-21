<%@page import="cafe.*"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="util.DBconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<link href="../css/nav_style.css" rel="stylesheet"/>
<link href="../css/cardview_style.css" rel="stylesheet"/>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>Insert title here</title>
<style type="text/css">
	

</style>
</head>
<body>
	<%
		String userID = null;
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

		CafeDAO dao = new CafeDAO();
		ArrayList<CafeDTO> dto = dao.getSelect();
		
	%>
	<div class="left-container">
		<div class="back_btn" onclick="location.href='../MainForm.jsp'"></div>
		<div class="left_title">
		<img src="../images/icons/icon-bigmap.png" width="32px" height="32px" style="margin-bottom: 20px">
				<span class="inner-title" >Location</span></div>
		<div class="map_container">
			<%@ include file="cafeKakao.jsp" %>
		</div>		
	</div>
	
	<div class="card_container" >
		<a href="cafe.jsp?shopNo=6" style="text-decoration: none">
		<div class="card mb-5" style="width: 960px; height:220px;">
		  <div class="row no-gutters">
		    <div class="col-md-4">
		      <img src="../upload/<%= dto.get(0).getImg() %>" class="card-img" style="width: 310px; height:210px; object-fit: contain;">
		    </div>
		    <div class="col-md-8">
		      <div class="card-body">
		        <h5 class="card_title"><b><%= dto.get(0).getShopName()%></b></h5>
		        <p class="card-text"><small class="text-muted"><%= dto.get(0).getAddr() %></small></p>
		      </div>
		    </div>
		  </div>
		</div>
		</a>
		
		<a href="cafe.jsp?shopNo=7" style="text-decoration: none">
		<div class="card mb-5" style="width: 960px; height:220px;">
		  <div class="row no-gutters">
		    <div class="col-md-4">
		      <img src="../upload/<%= dto.get(1).getImg() %>" class="card-img" style="width: 310px; height:210px; object-fit: contain;">
		    </div>
		    <div class="col-md-8">
		      <div class="card-body">
		        <h5 class="card_title"><b><%= dto.get(1).getShopName()%></b></h5>
		        <p class="card-text"><small class="text-muted"><%= dto.get(1).getAddr() %></small></p>
		      </div>
		    </div>
		  </div>
		</div>
		</a>
		
		<a href="cafe.jsp?shopNo=8" style="text-decoration: none">
		<div class="card mb-5" style="width: 960px; height:220px;">
		  <div class="row no-gutters">
		    <div class="col-md-4">
		      <img src="../upload/<%= dto.get(2).getImg() %>" class="card-img" style="width: 310px; height:210px; object-fit: contain;">
		    </div>
		    <div class="col-md-8">
		      <div class="card-body">
		        <h5 class="card_title"><b><%= dto.get(2).getShopName()%></b></h5>
		        <p class="card-text"><small class="text-muted"><%= dto.get(2).getAddr() %></small></p>
		      </div>
		    </div>
		  </div>
		</div>
		</a>
		
		<a href="cafe.jsp?shopNo=9" style="text-decoration: none">
		<div class="card mb-5" style="width: 960px; height:210px;">
		  <div class="row no-gutters">
		    <div class="col-md-4">
		      <img src="../upload/<%= dto.get(3).getImg() %>" class="card-img" style="width: 310px; height:210px;">
		    </div>
		    <div class="col-md-8">
		      <div class="card-body">
		        <h5 class="card_title"><b><%= dto.get(3).getShopName()%></b></h5>
		        <p class="card-text"><small class="text-muted"><%= dto.get(3).getAddr() %></small></p>
		      </div>
		    </div>
		  </div>
		</div>
		</a>
		
		<a href="cafe.jsp?shopNo=10" style="text-decoration: none">
		<div class="card mb-5" style="width: 960px; height:220px;">
		  <div class="row no-gutters">
		    <div class="col-md-4">
		      <img src="../upload/<%= dto.get(4).getImg() %>" class="card-img" style="width: 310px; height:210px; object-fit: contain; ">
		    </div>
		    <div class="col-md-8">
		      <div class="card-body">
		        <h5 class="card_title"><b><%= dto.get(4).getShopName()%></b></h5>
		        <p class="card-text"><small class="text-muted"><%= dto.get(4).getAddr() %></small></p>
		      </div>
		    </div>
		  </div>
		</div>
		</a>
	</div>
 </body>
</html>
</body>
</html>