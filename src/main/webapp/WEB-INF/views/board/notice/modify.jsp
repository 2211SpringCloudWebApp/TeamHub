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
		<title>공지사항 수정</title>
		<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
		.board_write{
			border-top: 2px solid #000;
		}
		.board_write .title,
		.board_write .info {
			padding: 15px;
		}
		
		.board_write .info {
			border-top: 1px dashed #ddd;
			border-bottom: 1px solid #000;
			font-size: 0;
		}
		
		.board_write .title dt,
		.board_write .title dd,
		.board_write .info dt,
		.board_write .info dd {
			display: inline-block;
			vertical-align: middle;
			font-size: 1.4rem;
		}
		
		.board_write .title dt,
		.board_write .info dt {
			width: 100px;
		}
		
		.board_write .title dd{
			width: calc(100% - 100px);
		}
		
		.board_write .title input[type="text"] ,
		.board_write .info input[type="text"],
		.board_write .title input[type="file"]  {
			
			box-sizing: border-box; 
		}
		
		.board_write .title input[type="text"] {
			width: 60%;
		}
		
		.board_write .cont {
			border-bottom: 1px solid #000;
		}
		.board_write .cont textarea {
			display: block;
			width: 100%;
			height: 300px;
			padding: 15px;
			box-sizing: border-box;
			border: 0;
			resize: vertical;
		}
		#modi{
			text-align: center;
		}
		</style>
		
		
	</head>
	
	<body>
		<div id="container">
		<jsp:include page="../../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
			<h1> 공지사항 </h1>
			<ul id="search">
				<li><a href="/free/list"><h5>자유게시판</h5></a></li>
				<li style="color: #275ab5"><a href="/notice/list"><h5>공지사항</h5></a></li>
				 <c:if test="${sessionScope.user.userType eq 1}">
                <li><a href="/report/list"><h5>신고게시판</h5></a></li>
                <li><a href="/free/blacklist"><h5>정지 리스트</h5></a></li>
            </c:if>
			</ul>
			</div>
			<jsp:include page="../../common/header.jsp"></jsp:include>
			<main>
				<form action="/notice/modify" method="post" enctype="multipart/form-data">
					<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
					<input type="hidden" name="fileName" value="${freefile[0].fileName }">
					<input type="hidden" name="filePath" value="${freefile[0].filePath }">
					<div class="board_title">
						<h1>공지사항 상세</h1>
					</div>
					<div class="board_write_wrap">
						<div class="board_write">
							<div class="title">
								<dl>
									<dt>제목</dt>
									<dd><input type="text" name="noticeTitle" value="${notice.noticeTitle }"></dd>
								</dl>
							</div>
							<div class="info">
								<dl>
									<dt>작성자</dt>
									<dd>${sessionScope.user.userId }</dd>
								</dl>
								<dl>
									<dt>첨부파일</dt>
									<dd><input type="file" name="reloadFile">&nbsp;&nbsp; ${freefile[0].fileName }
								</dl>
							</div>
							<div>
								<div class="cont">
								<textarea rows="5" cols="30" name="noticeContent">${notice.noticeContent }</textarea>
								</div>
							</div>
						</div>
					</div>
					<div id="modi">
					<input type="submit" value="수정" class="btn btn-primary" >
					</div>
				</form>
			</main>
		</div>
	</body>
	
</html>