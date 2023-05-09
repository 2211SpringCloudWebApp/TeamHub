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
		<title>자유 게시판</title>
		<style>
		#form{
			heigt: 100%;
		}
		
			#search a {
			    text-decoration: none;
			    color: inherit;
			}
		
		#sideBar li:nth-child(9){
		    background-color: #2653e8ba;
  				
		}
		#sideBar li:nth-child(9) a{
			color: white !important;
		}
		#sideBar ul{
			padding: 0 !important;
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
			height: 550px;
			padding: 15px;
			box-sizing: border-box;
			border: 0;
			resize: vertical;
		}
		#cancle{
			text-align: center;
			
		}
		.btn{
			width: 100px;
 			height: 50px;
		}
		.btnbtn{
			background-color: skyblue;
			width: 200px;
			height: 60px;
			border: 1px;
			margin: 50px 0px;
			font-size:21 px;
		}
		
		</style>
	</head>
	
	<body>
		<div id="container">
		<jsp:include page="../../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
			<h1> 자유게시판 </h1>
			<button class="btnbtn" onclick="location.href='/free/writeView';">게시글 작성</button>
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
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
			<main>
				<form action="/free/write" method="post" enctype="multipart/form-data" id="form">
				<input type="hidden" name="userId" value="${user.userId }">
					<div class="board_title">
						<h1>자유게시판 작성</h1>
						</div>
						<div class="board_write_wrap">
							<div class="board_write">
								<div class="title">
									<dl>
										<dt>제목</dt>
										<dd><input type="text" name="freeTitle" placeholder="제목을 입력하세요!"></dd>
									</dl>
								</div>
								<div class="info">
									<dl>
										<dt>작성자</dt>
										<dd>${sessionScope.user.userId }</dd>
									</dl>
									<dl>
										<dt>첨부 파일</dt>
										<dd><input type="file" name="uploadFile"></dd>
									</dl>
								</div>
								<div class="cont">
									<textarea name="freeContent" placeholder="내용을 입력해주세요!"></textarea>
							</div>
						</div>
					</div>
						
						
					<!-- 	내용 : <textarea name="freeContent"></textarea>
						첨부파일 : <input type="file" name="uploadFile">
					 -->
					 <div id="cancle">
					<input type="submit" value="등록" onclick="checkForm()" class="btn btn-primary">
					<input type="reset" value="취소" onclick="location='/free/list'" class="btn btn-primary">
					</div>
				</form>
			</main>
		</div>
<script>
    function checkForm() {
        var title = document.getElementsByName("freeTitle")[0].value;
        var content = document.getElementsByName("freeContent")[0].value;

        if (title == "" || content == "") {
            alert("제목과 내용은 필수 입력 항목입니다.");
         
        } else {
            document.getElementById("freeForm").submit();
        }
    }
</script>
	</body>
	
</html>