	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>    
<%@ page import="user.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%  
	String userID = request.getParameter("userID"); 
	UserDTO user = new UserDAO().getMember(userID);
%>
</head>
<!-- 
	아이디를 전달받아 중복 유무 확인
	중복일 경우 : 아이디 재입력 후 다시 검사
	중복 아닐 경우 : 아이디와 결과를 부모창으로 전달하여 저장
-->
<script type="text/javascript">	
	function idCheck(){
		const userInfo = document.idCheckForm;;
		const userID = userInfo.userID;
		
		if(userID.value.length == 0 || userID.value ==""){
			alert('아이디 입력 후 중복확인 버튼을 눌러주세요');
			userID.focus();
			return;
		}
		
		userInfo.action = 'idCheck.jsp';
		userInfo.method = 'post';
		userInfo.submit();
	}
	
	//부모 창에 존재하는 폼변수 값을 전달하고 현재 창을 종료하는 함수
	function onClose(){
		var parent = window.opener;
		
		opener.userInfo.userID.value = '<%=userID%>';
		window.open('','_self').close();
	}
</script>
<body>
	<form name="idCheckForm">
		<table width="100%" height="90%">
			<tr><td>&nbsp;</td></tr>
			<%
				if(user != null){%>
					<tr>
						<td align="center" class="t1">
							입력한 <font color="red"> [<%= userID %>]</font>는 이미 사용중인 아이디입니다.<br><br>
						</td>
					</tr>
					<tr>
						<td align="center" class="bottom">
							<input type="text" name="userID" size="15">
							<button type="button" onclick="idCheck();">확인</button> 
						</td>
					</tr>
			<% }else { //아이디가 중복되지 않은 경우 %>
				<tr>
					<td align="center" class="t1">입력한 <font color="red"> [<%= userID %>]</font>는 사용가능한 아이디입니다.<br><br>
					</td>
				</tr>
				<tr>
					<td align="center" valign="bottom">
						<button type="button" onclick="onClose()">사용하기</button>
					</td>
				</tr>
				<%
				}%>
		</table>

</form>
</body>
</html>