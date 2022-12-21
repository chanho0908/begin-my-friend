<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <script type="text/javascript">
        window.onload=function(){
          //from www.java2s.com
          var today = new Date().toISOString().split('T')[0];
          document.getElementsByName("setTodaysDate")[0].setAttribute('min', today);
      }
      </script> <input name="setTodaysDate" type="date">  
</body>
</html>