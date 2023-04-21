<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>자유 게시판</title>
		<style>
		#sideBar ul{
			padding: 0 !important;
		}
		</style>
	</head>
	
	<body>
		<div id="container">
			<jsp:include page="../../common/header.jsp"></jsp:include>
			<div class="index_section">
				<h1>자유게시판 등록페이지</h1>
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
			</div>
			<main class="table table-hover">
				<form action="/free/write" method="post" enctype="multipart/form-data">
					제목 : <input type="text" name="freeTitle" ><br>
					작성자 : <input type="text" name="userId" value="${sessionScope.user.userId }" readonly><br>
					내용 : <textarea name="freeContent"></textarea><br>
					첨부파일 : <input type="file" name="uploadFile"><br>
					
					<input type="submit" value="등록">
					<input type="reset" value="취소">
				</form>
			</main>
		</div>
	</body>
	
</html>