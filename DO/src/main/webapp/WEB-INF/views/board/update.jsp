<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body>
<div class="container">
		<h3>글 수정</h3>
		<div>
			<form method="post">
				<div class="row mb-3">
					<label class="col-3">카테고리</label>
					<div class="col">
						<input type="text" name="subCname" value="${item.subCname}" class="form-control col-9">
					</div>					
				</div>
				<div class="row mb-3">
					<label class="col-3">작성자</label>
					<div class="col">
						<input type="text" name="id" value="${item.id}" class="form-control">
					</div>
				</div>
				<div class="row mb-3">
					<label class="col-3">제목</label>
					<div class="col">
						<input type="text" name="title" value="${item.title}" class="form-control">
					</div>
				</div>
				<div class="row mb-3">
					<label class="col-3">내용</label>
					<div class="col">
						<input type="text" name="content" value="${item.content}" class="form-control">
					</div>
				</div>
				<div class="row mb-3">
					<label class="col-3">이미지</label>
					<div class="col">
						<input type="text" name="image" value="${item.image}" class="form-control">
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-3"></div>
					<div class="row col">
						<input type="submit" value="등록" class="btn btn-primary">
					</div>
					<div class="col-3"></div>
				</div>			
			</form>
			<div>
			<a href="list" class="btn btn-warning">목록</a>
		</div>
		</div>
	</div>
</body>
</html>