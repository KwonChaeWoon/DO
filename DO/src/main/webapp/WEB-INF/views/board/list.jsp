<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div>
		<h3>게시판 목록</h3>
		<div class="mb-2">
			<form>
				<div class="row">
					<div class="col-3"></div>
					<div class="col-2">
						<select name="search" class="form-control form-control-sm">
							<option value="0">전체 검색</option>
							<option value="1" ${pager.search == 1 ? 'selected' : ''}>카테고리</option>
							<option value="2" ${pager.search == 2 ? 'selected' : ''}>작성자</option>
							<option value="3" ${pager.search == 3 ? 'selected' : ''}>제목</option>
							<option value="4" ${pager.search == 4 ? 'selected' : ''}>내용</option>
						</select>
					</div>
					<div class="col-5">
						<input type="text" name="keyword" class="form-control form-control-sm" value="${pager.keyword}">
					</div>
					<div class="col-2">
						<input type="submit" value="검색" class="btn btn-primary btn-sm">
					</div>
				</div>
			</form>
		</div>
		<div>
			<table border="1">
				<thead>
					<tr>
						<th>카테고리</th>
						<th>작성자</th>
						<th>제목</th>
						<th>내용</th>
						<th>이미지</th>
						<th>등록일</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list.size() < 1}">
						<tr>
							<td colspan="3">등록 된 글이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.subCname}</td>
							<td>${item.id}</td>
							<td>${item.title}</td>
							<td>${item.content}</td>
							<td>${item.image}</td>
							<td><fmt:formatDate value="${item.regdate}" pattern="yyyy-MM-dd"/></td>
							<td><a href="delete?bid=${item.bid}">삭제</a> <a href="update?bid=${item.bid}">변경</a></td>
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