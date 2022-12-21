<%@page import="util.DBconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="ground.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>Insert title here</title>
<style type="text/css">
	a:hover {
		text-decoration: none;
		color: black;
	}
	
	a:link {
		text-decoration: none;
		color: black;
	}
	
	a:visited {
		text-decoration: none;
		color: black;
	}
	
	a:active {
		text-decoration: none;
		color: black;
	}
	

</style>
</head>
<body>
	<%
		GroundDAO dao = new GroundDAO();
		ArrayList<GroundDTO> dto = dao.getSelectf();
		ArrayList<String> info = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "select info from ground a, info b where a.gno = b.gno and category=1";
		
		conn = DBconnection.getConnection();
		pstmt = conn.prepareStatement(SQL);
		rs = pstmt.executeQuery();
		int cnt = 1;
		while(rs.next()){
			info.add(rs.getString(1));
		}
		
	%>
<a href="../content/ground.jsp?no=1">
<div class="card mb-3" style="width: 980px;">
  <div class="row no-gutters">
    <div class="col-md-4">
      <img src="../images/sBuild/<%= dto.get(0).getImg() %>" class="card-img" style="width: 310px; height:250px;">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title"><b><%= dto.get(0).getgName()%></b></h5>
        <p class="card-text"><%=info.get(0) %></p> 
        <p class="card-text"><%=info.get(1) %></p>
        <p class="card-text"><%=info.get(2) %></p>
        <p class="card-text"><small class="text-muted"><%= dto.get(0).getAddr() %></small></p>
      </div>
    </div>
  </div>
</div>
</a>
<a href="../content/ground.jsp?no=2">
<div class="card mb-3" style="width: 980px;">
  <div class="row no-gutters">
    <div class="col-md-4" style="width:250px;">
      <img src="../images/HK/<%= dto.get(1).getImg() %>" class="card-img" style="width: 310px; height:250px;">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title"><b><%= dto.get(1).getgName()%></b></h5>
        <p class="card-text"><%=info.get(3) %></p>
        <p class="card-text"><%=info.get(4) %></p>
        <p class="card-text"><small class="text-muted"><%= dto.get(1).getAddr() %></small></p>
      </div>
    </div>
  </div>
</div>
</a>
<a href="../content/ground.jsp?no=3">
<div class="card mb-3" style="width: 980px;">
  <div class="row no-gutters">
    <div class="col-md-4">
      <img src="../images/plab/<%= dto.get(2).getImg() %>" class="card-img" style="width: 310px; height:250px;">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title"><b><%= dto.get(2).getgName()%></b></h5>
        <p class="card-text"><%=info.get(5) %></p>
        <p class="card-text"><%=info.get(6) %></p>
        <p class="card-text"><small class="text-muted"><%= dto.get(2).getAddr() %></small></p>
      </div>
    </div>
  </div>
</div>
</a>

<a href="../content/ground.jsp?no=4">
<div class="card mb-3" style="width: 980px;">
  <div class="row no-gutters">
    <div class="col-md-4" style="width:250px">
      <img src="../images/sky/<%= dto.get(3).getImg() %>" class="card-img" style="width: 310px; height:250px;">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h4 class="card-title"><b><%= dto.get(3).getgName()%></b></h4>
        <p class="card-text"><%=info.get(7) %></p>
        <p class="card-text"><%=info.get(8) %></p>
        <p class="card-text"><%=info.get(9) %></p>
        <p class="card-text"></p>
        <p class="card-text"><small class="text-muted"><%= dto.get(3).getAddr() %></small></p>
      </div>
    </div>
  </div>
</div>
</a>
<a href="../content/ground.jsp?no=5">
<div class="card mb-3" style="width: 980px;">
  <div class="row no-gutters">
    <div class="col-md-4">
      <img src="../images/notso/<%= dto.get(4).getImg() %>" class="card-img" style="width: 310px; height:250px;">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h4 class="card-title"><b><%= dto.get(4).getgName()%></b></h4>
        <p class="card-text"><%=info.get(10) %></p>
        <p class="card-text"><%=info.get(11) %></p>
        <p class="card-text"><small class="text-muted"><%= dto.get(4).getAddr() %></small></p>
      </div>
    </div>
  </div>
</div>
</a>
 </body>
</html>
</body>
</html>