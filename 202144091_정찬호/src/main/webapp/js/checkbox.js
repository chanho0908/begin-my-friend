 function is_checked(){
		var form = document.resreveInfo;
		
		if(!form.chk1.checked){
			alert("약관을 확인해 주세요");
			return false;
		}
		
		if(!form.chk2.checked){
			alert("약관을 확인해 주세요");
			return false;
		}
	}