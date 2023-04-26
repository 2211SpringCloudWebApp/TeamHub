<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
if(session.getAttribute("user") == null){
    response.sendRedirect("/");
}
%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>자유게시판 수정</title>
		<style>
		#sideBar ul{
			padding: 0 !important;
		}
		</style>
	</head>
	
	<body>
		<div id="container">
			<jsp:include page="../../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
				<h1>자유게시판 수정</h1> 
			</div>
			<jsp:include page="../../common/header.jsp"></jsp:include>
			<main>
				<form action="/notice/modify" method="post" enctype="multipart/form-data">
					<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
					<input type="hidden" name="fileName" value="${freefile[0].fileName }">
					<input type="hidden" name="filePath" value="${freefile[0].filePath }">
					제목 : <input type="text" name="noticeTitle" value="${notice.noticeTitle }"> <br>
					작성자 : <input type="text" name="userId" value="${notice.userId }" readonly><br>
					내용 : <textarea rows="5" cols="30" name="noticeContent">${notice.noticeContent }</textarea> <br>
					첨부파일 : <input type="file" name="reloadFile">&nbsp;&nbsp; ${freefile[0].fileName }<br>
					<input type="submit" value="수정">
				</form>
			</main>
		</div>
	</body>
	
</html>