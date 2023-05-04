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
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<style>
		#sideBar li:nth-child(9){
		    background-color: #2653e8ba;
  				
		}
		#sideBar li:nth-child(9) a{
			color: white !important;
		}
		#sideBar ul{
			padding: 0 !important;
		}
		#search li{
			list-style-type: square !important;
		}
		</style>
	</head>
	
	<body>
		<div id="container">
		<jsp:include page="../../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
			<h1> 자유게시판 </h1>
			<ul id="search">
				<li style="color: #275ab5"><a href="/free/list"><h5>자유게시판</h5></a></li>
				<li><a href="/notice/list"><h5>공지사항</h5></a></li>
				 <c:if test="${sessionScope.user.userType eq 1}">
                <li><a href="/report/list"><h5>신고게시판</h5></a></li>
                <li><a href="/free/blacklist"><h5>정지 리스트</h5></a></li>
            </c:if>
            
			</ul>
			</div>
			<jsp:include page="../../common/header.jsp"></jsp:include>
			<main>
				<form action="/free/modify" method="post" enctype="multipart/form-data">
					<input type="hidden" name="freeNo" value="${free.freeNo }">
					<input type="hidden" name="fileName" value="${freefile[0].fileName }">
					<input type="hidden" name="filePath" value="${freefile[0].filePath }">
					제목 : <input type="text" name="freeTitle" value="${free.freeTitle }"> <br>
					작성자 : <input type="text" name="userId" value="${free.userId }" readonly><br>
					내용 : <textarea rows="5" cols="30" name="freeContent">${free.freeContent }</textarea> <br>
					첨부파일 : <input type="file" name="reloadFile">&nbsp;&nbsp; ${freefile[0].fileName }<br>
					<input type="submit" value="수정">
				</form>
			</main>
		</div>
	</body>
	
</html>