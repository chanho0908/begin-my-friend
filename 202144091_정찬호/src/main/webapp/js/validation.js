
// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수        
function checkValue() {          
		const userInfo = document.userInfo;
		
		const userID = userInfo.userID;
		
		if(userID.value.length < 5 || userID.value.length > 12){
			alert("아이디는 5자 이상 12자 이하로 작성해주세요!");
			userID.focus();
			return false;
		} 
		const userpw = userInfo.userPassword;
		const userpwchk = userInfo.userPassword_re;
		
		//비밀번호 안에 아이디가 있을 때
		if(userpw.value.search(userID.value) != -1){
			alert("비밀번호에 아이디를 포함할 수 없습니다.");
			userpw.focus();
			return false;
		}
		
		// 비밀번호 안에 한글이 있을 떄
		let KoreanCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/
		if(KoreanCheck.test(userpw.value)){
			alert("비밀번호에 한글을 사용할 수 없습니다.");
			userpw.focus();
			return false;
		}
		
		// (?=.*?[A-Z]) : A부터 Z까지 있는지 보는 정규식
		// .{8,10} : 8자 이상 10자 이하
		// ^ : 이걸로 시작해서  $ : 로 끝나..

		// A-Z, a-z, 0-9 특수문자가 포함되어 있는지, 8자 이상
		let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$/
		if(!reg.test(userpw.value)){
			alert("비밀번호는 8자 이상, 숫자, 대문자, 소문자, 특수문자를 모두 포함해야 합니다.");
			userpw.focus();
			return false;
		}
		
		// 같은 문자 연속 4번 있는지
		let reg2 = /(\w)\1\1\1/
		if(reg2.test(userpw.value)){
			alert("같은 문자를 4번 이상 연속해서 사용하실 수 없습니다.")
			userpw.focus();
			return false;
		}
		
		// 비밀번호는 공백을 포함할 수 없다.
		// n의 인덱스 반환, -1이면 없음
		if(userpw.value.search(" ") != -1){
			alert("비밀번호는 공백을 포함할 수 없습니다!")
			userpw.focus();
			return false;
		}
		
		// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인  
	    if(userpw.value != userpwchk.value){
	    	alert("비밀번호를 동일하게 입력하세요.");
	    	return false;            
	    }      
	    
	    const userName = userInfo.userName;
	    if(userName.value.length == 0 || userName.value ==""){
			alert("이름을 입력 해주세요!");
			userID.focus();
			return false;
		}
		
		const userAge = userInfo.userAge;
		if(userAge.value.length == 0 || userAge.value ==""){
			alert("나이를 입력 해주세요!");
			userID.focus();
			return false;
		}
		
		const userPhone = userInfo.userAge;
		if(userPhone.value.length == 0 || userPhone.value ==""){
			alert("핸드폰 번호를 입력 해주세요!");
			userID.focus();
			return false;
		}
	    
	    if(isNaN(userInfo.userPhone.value)){
			alert("핸드폰 번호는 숫자만 입력 가능합니다.");
			return false;
		}	
		
		//아이디 중복 유무 확인을 하지 않은 경우
		//if(userInfo.idCheckResult.value="0"){
		//	alert('아이디 중복 확인을 반드시 해주세요.');
		//	return false;
				
		//}
		
	
}

 function idCheck(form) {
	
	const userInfo = document.userInfo;
	const userID = userInfo.userID;
	
	window.onload=function(){
		userInfo.userID.focus();
	}
	
	if(userID.value.length == 0 || userID.value ==""){
		alert('아이디 입력 후 중복확인 버튼을 눌러주세요');
		userID.focus();
		return;
	}
	
	var width = 400;
    var height = 100;
	var positionX = ( window.screen.width / 2 ) - ( width / 2 );
	var positionY = ( window.screen.height / 2 ) - ( height / 2 );
	var url = 'idCheck.jsp?userID='+ userID.value;
    window.open(url,'checkForm','width=400,height=125, top=' + positionY + ', left=' + positionX);	
}	