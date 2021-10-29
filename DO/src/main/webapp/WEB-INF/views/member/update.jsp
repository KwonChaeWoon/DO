<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div>
		<h3>사용자 정보 변경</h3>
		<form method="post">
			<div>
				<label>아이디:</label>
				<input type="text" value="${item.id}" readonly>
			</div>
			<div>
				<label>비밀번호:</label>
				<input type="text" name="passwd" value="${item.passwd}">
			</div>
			<div>
				<label>성명:</label>
				<input type="text" name="name" value="${item.name}">
			</div>
			<div>
				<label>생년월일:</label>
				<input type="text" name="birth" value="${item.birth}">
			</div>
			<div>
				<label>전화번호:</label>
				<input type="text" name="tel" value="${item.tel}">
			</div>
			<div>
				<label>이메일:</label>
				<input type="text" name="email" value="${item.email}">
			</div>
			<div>
				<button>변경</button>
			</div>
		</form>
	</div>
</body>
</html>