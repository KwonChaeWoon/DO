<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/signup.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>
	let check_id = false;
	
	function checkId_Async() {
		const form = document.signupForm;

		const xhr = new XMLHttpRequest();

		xhr.open("GET", "checkId?id=" + form.id.value, true);

		xhr.onreadystatechange = function() {
			if(xhr.readyState == XMLHttpRequest.DONE) {
				if(xhr.status == 200) {
					if(xhr.responseText == "OK") {
						check_id = true;
						alert("사용가능한 아이디 입니다.")
					} else
						alert("이미 등록 된 아이디 입니다.")
				}
			}
		};
		
		xhr.send();

		console.log("결과1: " + xhr.responseText);
	}
	
	/* function checkId_Sync() {
		const form = document.signupForm;

		const xhr = new XMLHttpRequest();

		xhr.open("GET", "checkId?id=" + form.id.value, false);

		xhr.send();

		console.log(xhr.responseText);
		
		if(xhr.responseText == "OK") {
			check_id = true;
			alert("사용가능한 아이디 입니다.")
		} else
			alert("이미 등록 된 아이디 입니다.")
	} */
	
	function signup() {
		const form = document.signupForm;
		
		if(form.id.value == '') {
			alert('아이디를 입력해주세요.');
			form.id.focus();
			return;
		}
		if(!check_id) {
			alert('아이디 중복 검사를 해주세요.');
			return;
		}
		if(form.passwd.value == '') {
			alert('비밀번호를 입력해주세요.');
			form.passwd.focus();
			return;
		}
		if(form.passwd_check.value == '') {
			alert('비밀번호 확인을 입력해주세요.');
			form.passwd_check.focus();
			return;
		}
		if(form.passwd.value !== form.passwd_check.value) {
			alert('비밀번호가 일치하지 않습니다.');
			form.passwd_check.focus();
			return;
		}
		if(form.name.value == '') {
			alert('이름을 입력해주세요.');
			form.name.focus();
			return;
		}
		if(form.birth.value == '') {
			alert('생년월일을 입력해주세요.');
			form.name.focus();
			return;
		}
		if(form.tel.value == '') {
			alert('전화번호를 입력해주세요.');
			form.tel.focus();
			return;
		}
		if(form.email.value == '') {
			alert('이메일을 입력해주세요.');
			form.address.focus();
			return;
		}
		form.submit();
		alert('회원가입이 완료되었습니다.');
	}

	function changeId() {
		check_id = false;
	}
	
	function goBack() {
		// history.back();
		location.href = ".";
	}
</script>
</head>
<body>
	<div>
		<div class="header_logo">
			<a href="http://localhost:9090/"><img src="resources/images/logo.PNG"></a>
			<a style="color: #f0f5f4">Developer</a>
		</div>
		<h2>회원가입</h2>
		<div class="wrapper">
			<div class="signup_section" style="width: 500px">
				<form name="signupForm" method="post">
					<div class="label">
						<label>아이디</label>
					</div>
					<div class="box signup_id">
						<input type="text" class="int int_id" name="id" onchange="changeId()">
						<a style="cursor: pointer;" onclick="checkId_Async()">중복확인</a>
					</div>
					<div class="label">
						<label>비밀번호</label>
					</div>
					<div class="box signup_pw">
						<input type="password" class="int" name="passwd">
					</div>
					<div class="label">
						<label>비밀번호 확인</label>
					</div>
					<div class="box signup_pww">
						<input type="password" class="int" name="passwd_check">
					</div>
					<div class="label">
						<label>성명</label>
					</div>
					<div class="box signup_name">
						<input type="text" class="int" name="name">
					</div>
					<div class="label">
						<label>생년월일</label>
					</div>
					<div class="box signup_birth">
						<input type="text" class="int birth" name="birth">
					</div>
					<div class="label">
						<label>전화번호</label>
					</div>
					<div class="box signup_tel">
						<input type="text" class="int" name="tel" placeholder="'-' 없이 번호만 입력해주세요.">
					</div>
					<div class="label">
						<label>이메일</label>
					</div>
					<div class="box signup_email">
						<input type="text" class="int" name="email">
					</div>
				</form>
				<div class="d-grid gap-2">
					<button type="button" class="btn btn-dark" onclick="signup()">회원가입</button>
					<button type="button" class="btn btn-secondary" onclick="goBack()">취소</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$(".birth").datepicker({
				dateFormat: 'yy-mm-dd',
				monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				dayNamesMin: ['일','월','화','수','목','금','토'],
				changeMonth: true,
				changeYear: true,
				showMonthAfterYear: true,
				yearRange: 'c-100:c+10',
			})
		})
	</script>
</body>
</html>