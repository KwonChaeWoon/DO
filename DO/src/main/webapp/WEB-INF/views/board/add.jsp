<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/add.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			height: 300,
			minHeight: null,
			maxHeight: null,
			focus: true,
			lang: "ko-KR",
 
			toolbar: [
				['fontname', ['fontname']],
				['fontsize', ['fontsize']],
				['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				['color', ['forecolor','color']],
				['table', ['table']],
				['para', ['ul', 'ol', 'paragraph']],
				['height', ['height']],
				['insert',['picture','link','video']],
				['view', ['fullscreen', 'help']]
			],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		});
	});
</script>
</head>
<body>
	<div class="header_logo">
		<a href="http://localhost:9090/"><img src="/resources/images/logo.PNG"></a>
		<a style="color: #f0f5f4;">Developer</a>
	</div>
	<div class="add_section">
		<h2>글쓰기</h2>
		<div class="container">
			<form method="post">
				<div class="row mb-3">
					<label class="col-3">카테고리</label>
					<div class="col">
						<input type="text" name="subCname" value="${subCname}" readonly="readonly" class="form-control">
					</div>
				</div>
				<div class="row mb-3">
					<label class="col-3">제목</label>
					<div class="col">
						<input type="text" name="title" class="form-control">
					</div>
				</div>
				<div class="row mb-3">
					<label class="col-3">내용</label>
					<div class="col">
						<textarea id="summernote" name="content"></textarea>
					</div>
				</div>
				<div class="row mb-3">
					<label class="col-3">작성자</label>
					<div class="col">
						<input type="text" name="id" value="${sessionScope.member.id}" readonly="readonly" class="form-control">
					</div>
				</div>
				<div class="button">
					<div class="row col">
						<button class="btn btn-primary" type="submit">등록</button>
					</div>
					<div>
						<a href="list?sub_cname=${subCname}" class="btn btn-warning">목록</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>