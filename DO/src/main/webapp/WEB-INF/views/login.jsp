<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="resources/css/login.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

</head>
<body>
	<div>
		<div class="header_logo">
			<a href="http://localhost:9090/"><img src="resources/images/logo.PNG"></a>
			<a style="color: #f0f5f4">Developer</a>
		</div>
		<h2>로그인</h2>
		<div class="wrapper">
			<div class="login_section">
				<form name="loginForm" method="post">
					<div class="label">
						<label>아이디</label>
					</div>
					<div class="box login_id">
						<input type="text" class="int" name="id">
					</div>
					<div class="label">
						<label>비밀번호</label>
					</div>
					<div class="box login_pw">
						<input type="password" class="int" name="passwd">
					</div>
					<div class="d-grid gap-2">
						<button class="btn btn-dark" type="submit">로그인</button>
					</div>
				</form>
					<div>
						<a href="signup">회원가입</a>
						<a href="find/id">아이디 찾기</a>
						<a href="find/passwd">비밀번호 찾기</a>
					</div>
			</div>
		</div>
	</div>
</body>
</html>