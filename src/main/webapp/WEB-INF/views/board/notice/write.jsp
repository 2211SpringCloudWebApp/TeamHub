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
		<title>공지 사항</title>
		<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style type="text/css">
		table{
			border : 1px solid black;
		}
		th, td {
			border : 1px soild black;
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
			<main class="table table-hover">
				<form action="/notice/write" method="post" enctype="multipart/form-data">
					제목 : <input type="text" name="noticeTitle" ><br>
					작성자 : <input type="text" name="userId" value="${sessionScope.user.userId }" readonly><br>
					내용 : <textarea name="noticeContent"></textarea><br>
					첨부파일 : <input type="file" name="uploadFile"><br>
					
					
					<input type="submit" value="등록">
					<input type="reset" value="취소">
				</form>
			<script>
			// 공지사항 등록 form
			const form = document.querySelector('form[action="/notice/write"]');

			// submit 이벤트 핸들러 등록
			form.addEventListener('submit', function(event) {

			  if (${sessionScope.user.userType != 1}) {
			    // '1'이 아닌 경우 form 제출 중단
			    event.preventDefault();
			    // 경고창 띄우기
			    alert('관리자만 게시글을 등록할 수 있습니다.');
			    window.location.href = '/notice/list';
			  }
			});
			</script>
			</main>
		</div>
	</body>
	
</html>