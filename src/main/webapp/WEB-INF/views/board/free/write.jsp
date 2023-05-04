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
			border-bottom: none;
		}
		</style>
	</head>
	
	<body>
		<<div id="container">
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
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
			<main class="table table-hover">
				<form action="/free/write" method="post" enctype="multipart/form-data">
					제목 : <input type="text" name="freeTitle" ><br>
					작성자 : <input type="text" name="userId" value="${sessionScope.user.userId }" readonly><br>
					내용 : <textarea name="freeContent"></textarea><br>
					첨부파일 : <input type="file" name="uploadFile"><br>
					
					<input type="submit" value="등록" onclick="checkForm()">
					<input type="reset" value="취소">
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