<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div>
		<h3>회원 목록</h3>
		<div>
			<table border="1">
				<thead>
					<tr>
						<th>아이디</th>
						<th>성명</th>
						<th>생년월일</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list.size() < 1}">
						<tr>
							<td colspan="3">등록 된 사용자 카테고리가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.id}</td>
							<td>${item.name}</td>
							<td>${item.tel}</td>
							<td>${item.email}</td>
							<td><a href="delete?id=${item.id}">삭제</a> <a href="update?id=${item.id}">변경</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<a href="add">등록</a>
			<a href="..">처음으로</a>
		</div>
	</div>
</body>
</html>