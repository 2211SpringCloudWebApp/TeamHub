<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>자유 게시판</title>
	</head>
	
	<body>
		<div id="container">
			<jsp:include page="../../common/header.jsp"></jsp:include>
			<div class="index_section">
				<h1>자유게시판 등록페이지</h1>
			</div>
			<main>
				<form action="/free/write" method="post">
					제목 : <input type="text" name="freeTitle"><br>
					작성자 : <input type="text" name="userId" value=""><br>
					내용 : <textarea name="freeContent"></textarea><br>
					첨부파일 : <input type="file"><br>
					<input type="submit" value="등록">
					<input type="reset" value="취소">
				</form>
			</main>
		</div>
	</body>
	
</html>