<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/view.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script>
	$(function(){
		$("#addBtn").click(function(){
			const reply = {
					id: $("#id").val(),
					name: $("#name").val(),
					bid: $("#bid").val(),
					content: $("#content").val()
			}
			
			$.ajax({
				method: "POST",
				url: "/reply/add",
				traditional: true,
				data: JSON.stringify(reply),
				contentType: "application/json",
				success: function(){
					console.log("성공");
					
					html = '<tr>';
					html += '<td>';
					html += reply.name;
					html += '</td></tr><tr class="rpy"><td>';
					html += reply.content;
					html += '</td></tr>';
					
					$("#replyTable").append( $(html) );
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="header_logo">
		<a href="http://localhost:9090/"><img src="/resources/images/logo.PNG"></a>
		<a style="color: #f0f5f4;">Developer</a>
	</div>
	<div class="view_section">
		<h2>상세화면</h2>
		<div>
			<table class="table">
				<tr>
					<th>제목</th>
					<td>${item.title}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${item.content}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${item.name}</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td><fmt:formatDate value="${item.regdate}" pattern="yyyy-MM-dd"/></td>
				</tr>
				<tr>
					<th>관리</th>
					<td>
						<button type="button" class="btn btn-danger" onclick="location.href='/board/delete?bid=${item.bid}&sub_cname=${item.subCname}'">삭제</button>
						<button type="button" class="btn btn-primary" onclick="location.href='/board/update?bid=${item.bid}&sub_cname=${item.subCname}'">수정</button>
					</td>
				</tr>
			</table>
		</div>
		<div class="button">
			<button type="button" class="btn btn-dark" onclick="location.href='/board/list?sub_cname=${item.subCname}'">목록</button>
		</div>
		<div class="reply_section">
			<div class="container">
				<table id="replyTable">
					<c:forEach var="row" items="${list}">
					<tr>
						<td>${row.name}</td>
					</tr>
					<tr class="rpy">
						<td>${row.content}</td>
					</tr>
					</c:forEach>	
				</table>
			</div>
			<div class="reply">
				<input id="content" type="text">
				<input id="id" type="hidden" value="${sessionScope.member.id}">
				<input id="name" type="hidden" value="${sessionScope.member.name}">
				<input id="bid" type="hidden" value="${item.bid}">
				<button id="addBtn" type="button" class="btn btn-dark">등록</button>
			</div>
		</div>
	</div>
</body>
</html>