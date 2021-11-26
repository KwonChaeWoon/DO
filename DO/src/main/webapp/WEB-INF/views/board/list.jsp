<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/board.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
$(function(){
	$("#perPage").change(function() {
		const queryString = new URLSearchParams(location.search);
		const perPage = $(this).val();
	
		queryString.set("perPage", perPage);
		queryString.set("page", 1);
	
		location.href = location.origin + location.pathname + "?" + queryString.toString();
	});
});
</script>
</head>
<body>
	<nav class="header">
		<div class="header_logo">
			<a href="http://localhost:9090/"><img src="/resources/images/logo.PNG"></a>
			<a style="color: #f0f5f4">Developer</a>
		</div>
		<ul class="header_menu">
			<li><a href="#">언어</a>
				<ul class="sub_menu">
					<li><a href="/board/list?sub_cname=Javascript">Javascript</a></li>
					<li><a href="/board/list?sub_cname=Java">Java</a></li>
					<li><a href="/board/list?sub_cname=HTML">HTML</a></li>
				</ul>
			</li>
			<li><a href="#">프레임워크</a>
				<ul class="sub_menu">
					<li><a href="/board/list?sub_cname=Spring">Spring</a></li>
					<li><a href="/board/list?sub_cname=jQuery">jQuery</a></li>
					<li><a href="/board/list?sub_cname=Node.js">Node.js</a></li>
				</ul>
			</li>
			<li><a href="#">개발도구</a>
				<ul class="sub_menu">
					<li><a href="/board/list?sub_cname=Visual Studio Code">Visual Studio Code</a></li>
					<li><a href="/board/list?sub_cname=Eclipse">Eclipse</a></li>
				</ul>
			</li>
			<li><a href="#">데이터베이스</a>
				<ul class="sub_menu">
					<li><a href="/board/list?sub_cname=MySQL">MySQL</a></li>
					<li><a href="/board/list?sub_cname=Oracle">Oracle</a></li>
				</ul>
			</li>
		</ul>
		<script>
			$(document).ready(function() {
				$(".header .sub_menu").hide();
				$(".header .header_menu li").click(function() {
					$("ul", this).slideToggle("fast");
				});
			});
		</script>
		<div class="header_icons">
			<c:if test="${sessionScope.member == null}">
				<a href="/login" title="로그인"><i class="bi bi-box-arrow-in-left" style="font-size: 2rem; color: #f0f5f4;"></i></a>
				<a href="/signup" title="회원가입"><i class="bi bi-person" style="font-size: 2rem; color: #f0f5f4"></i></a>
			</c:if>
			<c:if test="${sessionScope.member != null}">
				<div>
					<a class="welcom">${sessionScope.member.name} 님 환영합니다.</a>
					<a href="logout" title="로그아웃" onclick="logout()"><i class="bi bi-box-arrow-in-right" style="font-size: 2rem; color: #f0f5f4"></i></a>
					<a href="member/update?id=${sessionScope.member.id}" title="마이페이지"><i class="bi bi-person" style="font-size: 2rem; color: #f0f5f4"></i></a>
				</div>
			</c:if>
			<div class="menu_toggle">
				<a><i class="bi bi-list" style="font-size: 2.5rem; color: #f0f5f4"></i></a>
			</div>
		</div>
	</nav>
	<div class="board_section">
		<h2>${subCname}</h2>
		<h5>게시물 목록 (총 개수:<fmt:formatNumber value="${pager.total}" />개)</h5>
		<div class="my-2">
			<form>
				<div class="row">
					<div class="col-1">
						<select id="perPage" class="form-select form-select-sm">
							<option value="10">기본</option>
							<option value="5" ${pager.perPage == 5 ? 'selected' : ''}>5개</option>
							<option value="10" ${pager.perPage == 10 ? 'selected' : ''}>10개</option>
							<option value="20" ${pager.perPage == 20 ? 'selected' : ''}>20개</option>
							<option value="30" ${pager.perPage == 30 ? 'selected' : ''}>30개</option>
						</select>
					</div>
					<div class="col-5"></div>
					<div class="col-1">
						<select name="search" class="form-select form-select-sm">
							<option value="0">선택</option>
							<option value="1" ${pager.search == 1 ? 'selected' : ''}>제목</option>
							<option value="2" ${pager.search == 2 ? 'selected' : ''}>작성자</option>
							<option value="3" ${pager.search == 3 ? 'selected' : ''}>내용</option>
						</select>
					</div>

					<div class="col-4">
						<input name="keyword" type="text"
							class="form-control form-control-sm" value="${pager.keyword}">
					</div>
					<input type="hidden" name="sub_cname" value="${subCname}">
					<div class="col d-grid">
						<button class="btn btn-sm btn-dark">검색</button>
					</div>
				</div>
			</form>
		</div>
		<div>
			<table border="1" class="table table-sm">
				<thead class="table-dark">
					<tr>
						<th style="width: 300px;">제목</th>
						<th style="width: 100px;">작성자</th>
						<th style="width: 100px;">등록일</th>
						<th style="width: 100px;">조회수</th>
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
							<td><a href="view/${item.bid}">${item.title}</a></td>
							<td>${item.name}</td>
							<td><fmt:formatDate value="${item.regdate}" pattern="yyyy-MM-dd"/></td>
							<td><a href="delete?bid=${item.bid}&sub_cname=${item.subCname}">삭제</a> <a href="update?bid=${item.bid}&sub_cname=${item.subCname}">변경</a></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="7">
							<div class="pagination pagination-sm" style="justify-content: center">
								<div class="page-item">
									<a href="?page=1&${pager.query}&sub_cname=${subCname}" class="page-link">처음</a>
								</div>
								<div class="page-item">
									<a href="?page=${pager.prev}&${pager.query}&sub_cname=${subCname}" class="page-link">이전</a>
								</div>
	
								<c:forEach var="page" items="${pager.list}">
									<div class="page-item ${pager.page == page?'active':''}">
										<a href="?page=${page}&${pager.query}&sub_cname=${subCname}" class="page-link">${page}</a>
									</div>
								</c:forEach>
	
								<div class="page-item">
									<a href="?page=${pager.next}&${pager.query}&sub_cname=${subCname}" class="page-link">다음</a>
								</div>
								<div class="page-item">
									<a href="?page=${pager.last}&${pager.query}&sub_cname=${subCname}" class="page-link">마지막</a>
								</div>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
		<div class="button">
			<button type="button" class="btn btn-dark" onclick="location.href='add?sub_cname=${subCname}'">글쓰기</button>
			<button type="button" class="btn btn-secondary" onclick="location.href='..'">처음으로</button>
		</div>
	</div>
</body>
</html>