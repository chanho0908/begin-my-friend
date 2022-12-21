<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../css/joinForm_style.css"/>
<script type="text/javascript" src="../js/validation.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="title">Begin My Friend</div>
		<div class="form-container">
		<form method="post" name="userInfo" action="JoinAction.jsp" onsubmit="return checkValue()">
            <table>
                <tbody>
                	<tr>
                    <td style="width:110px;"><h3>아이디</h3></td>
                    <td colspan="3">
                    	<input type="text" class="form-control" name="userID" maxlength="12" style="width:200px; height:35px; font-size:18px;">
                    </td>
                    <td style="width: 110px">
                    <button class="btn btn-warning" type="button" onclick="idCheck()" name="CheckID" class="checkID" style="width:90px;height:35px;font-size:16px;">중복체크</button>
                    </td>
                    </tr>
                    <tr>
                    	<td style="width:130px;"><h3>비밀번호</h3></td>
                    	<td colspan="3"><input type="password" class="form-control" name="userPassword" maxlength="20" style="width:200px;height:35px;font-size:18px;"></td>
                    </tr>
                    <tr>
                    	<td style="width:220px;"><h3>비밀번호 확인</h3></td>
                    	<td colspan="3"><input type="password" class="form-control" name="userPassword_re" maxlength="20" style="width:200px;height:35px;font-size:18px;"></td>
                    </tr>
                    <tr>
                    	<td style="width:110px;"><h3>이름</h3></td>
                    	<td colspan="3"><input type="text" class="form-control" name="userName" maxlength="20" style="width:200px;height:35px;font-size:18px;"></td>
                    </tr>
                    <tr>
                    	<td style="width:110px;"><h3>나이</h3></td>
                    	<td colspan="3"><input type="text" class="form-control" name="userAge" maxlength="2" style="width:200px;height:35px;font-size:18px;"></td>
                    </tr>
                    <tr>
                    	<td style="width:110px;"><h3>성별</h3></td>
                    	<td colspan="3">
                    		<div style="text-align: center; margin: 0 auto;">
                            <label active">
                                <input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
                            </label>
                            <label style="margin-left: 50px">
                                <input type="radio" name="userGender" autocomplete="off" value="여자">여자
                            </label>
                            </div>
                    	</td>
                    </tr>
                    <tr>
                    	<td style="width:110px;"><h3>핸드폰</h3></td>
                    	<td colspan="3"><input type="text" class="form-control" name="userPhone" maxlength="20" style="width:200px;height:35px;font-size:18px;"></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align: right;" colspan="5" >
                        <input class="" type="submit" value="회원가입" style="width:110px; height:35px;font-size:18px;"></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
		</div>
	</div>
</body>
</html>