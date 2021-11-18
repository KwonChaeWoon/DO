<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>

<!-- CSS -->
<link href="resources/css/common.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+Mono:wght@900&family=Playfair+Display:wght@900&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/indigo.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<script>
	function logout() {
		alert('로그아웃 하시겠습니까?')
	}
</script>

</head>
<body>
	<nav class="header">
		<div class="header_logo">
			<a href="http://localhost:9090/"><img src="/resources/images/logo.PNG"></a>
			<a>Developer</a>
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
				<a href="login" title="로그인"><i class="bi bi-box-arrow-in-left" style="font-size: 2rem; color: #f0f5f4;"></i></a>
				<a href="signup" title="회원가입"><i class="bi bi-person" style="font-size: 2rem; color: #f0f5f4"></i></a>
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
	<div class="slick">
		<div class="bg1"></div>
		<div class="bg2">
			<a class="text1">FOR</a>
			<a class="text2">WEB DEVELOPER</a>
		</div>
		<div class="bg3">
			<a class="text1">COMMUNICATE</a>
			<a class="text2">WITH</a>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$('.slick').slick({
				vertical: false,
				arrow: true,
				infinite: true,
				autoplay: true,
				autoplaySpeed: 3000,
				pauseOnFocus: false,
				pauseOnHover: false,
				prevArrow : '<a href=""><i class="bi bi-chevron-left slick-prev" style="color: #f0f5f4; font-weight: bold;"></i><a>',
				nextArrow : '<a href=""><i class="bi bi-chevron-right slick-next" style="color: #f0f5f4; font-weight: bold;"></i><a>',
			});
		});
	</script>
</body>
</html>