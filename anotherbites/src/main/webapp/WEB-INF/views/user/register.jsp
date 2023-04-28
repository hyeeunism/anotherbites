<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<h1>회원가입</h1>
	<form method="post" action="/user/register" class="userJoin">
		<label for="id">아이디</label>
		<input type="text" id="userId" name="userId">
		<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button><br><br>
		
		<label for="userPwd">비밀번호</label>
		<input type="password" id="userPwd" name="userPwd"><br><br>
		
		<label for="pwdCheck">비밀번호 확인</label>
		<input type="password" id="pwdCheck" name="pwdCheck"><br><br>
		
		<label for="name">이름</label>
		<input type="text" id="userName" name="userName"><br><br>
		
		<label for="nickname">닉네임</label>
		<input type="text" id="userNickname" name="userNickname">
		<button class="nicknameChk" type="button" id="nicknameChk" onclick="fn_nicknameChk();" value="N">중복확인</button><br><br>
		
		<label for="email">이메일</label>
		<input type="email" id="userEmail" name="userEmail"><br><br>
		
		<label for="phone">휴대폰번호</label>
		<input type="tel" id="userTel" name="userTel"><br><br>
		
		<label for="zipcode">우편번호</label>
		<input type="text" id="zipcode" name="zipcode">
		<input type="button" value="우편번호 검색" onclick="openDaumPostcode()"><br><br>
		
		<label for="address1">기본주소</label>
		<input type="text" id="address1" name="address1"><br><br>
		
		<label for="userAddr">상세주소</label>
		<input type="text" id="address2" name="address2"><br><br>
		
		<label for="address3">참고항목</label>
		<input type="text" id="address3" name="address3"><br><br>
		
		<input type="hidden" id="userAddr" name="userAddr"><br><br>
		
		<input type="submit" value="회원가입">
	</form>
</body>
<script>
$(document).ready(function(){
	 $("#address1, #address2").on("input", function() {
	        var address1 = $("#address1").val();
	        var address2 = $("#address2").val();
	        $("#userAddr").val(address1 + address2);
	    });
	
	$(".userJoin").on("submit", function(){
		
		let idval = $('#userId').val()
	    let idvalcheck = /^[a-z0-9]+$/
	    if (!idvalcheck.test(idval) || idval.length<6){
	    	alert('아이디는 영소문자,숫자로 구성된 6글자 이상으로 조합하시오.')
	        $('#userId').focus()
	        return false
	    }
		
		if($("#userPwd").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#userPwd").focus();
			return false;
		}
		if($("#pwdCheck").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#pwdCheck").focus();
			return false;
		}
		if($("#pwdCheck").val()!=$("#userPwd").val()){
			alert("비밀번호가 다릅니다.");
			$("#pwdCheck").focus();
			return false;
		}
		if($("#userName").val()==""){
			alert("성명을 입력해주세요.");
			$("#userName").focus();
			return false;
		}

		var idChkVal = $("#idChk").val();
		if(idChkVal == "N"){
			alert("중복확인 버튼을 눌러주세요.");
		}else if(idChkVal == "Y"){
			$("#regForm").submit();
		}
		if($("#userEmail").val()==""){
			alert("이메일을 입력해주세요.");
			$("#userEmail").focus();
			return false;
		}
		if($("#userTel").val()==""){
			alert("휴대폰번호를 입력해주세요.");
			$("#userTel").focus();
			return false;
		}
		if($("#zipcode").val()==""){
			alert("우편번호를 입력해주세요.");
			$("#zipcode").focus();
			return false;
		}
		
	});
})

function fn_idChk(){
	
	if($("#userId").val()==""){
		alert("아이디를 입력해주세요.");
		$("#userId").focus();
		return false;
	}
	
	$.ajax({
		url : "/user/idChk",
		type : "post",
		dataType : "json",
		data : {"userId" : $("#userId").val()},
		success : function(data){
			if(data == 1){
				alert("사용 중인 아이디입니다.");
			}else if(data == 0){
				$("#idChk").attr("value", "Y");
				alert("사용가능한 아이디입니다.");
			}
		}
	})
}

function fn_nicknameChk(){
	
	if($("#userNickname").val()==""){
		alert("닉네임을 입력해주세요.");
		$("#userNickname").focus();
		return false;
	}
	
	$.ajax({
		url : "/user/nicknameChk",
		type : "post",
		dataType : "json",
		data : {"userNickname" : $("#userNickname").val()},
		success : function(data){
			if(data == 1){
				alert("사용 중인 닉네임입니다.");
			}else if(data == 0){
				$("#nicknameChk").attr("value", "Y");
				alert("사용가능한 닉네임입니다.");
			}
		}
	})
}
</script>
<script>
    function openDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
            
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
     
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("address3").value = extraAddr;
                
                } else {
                    document.getElementById("address3").value = '';
                }
                
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address1").value = addr;
                document.getElementById("userAddr").focus();
            }
        
        }).open();
    }
    
</script>
</html>