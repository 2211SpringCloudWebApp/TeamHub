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
		<title>상세 조회</title>
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
		
		#buttt{
			text-align: center;
		}
		.container{
			height: 800px;
		}
		
			.btnbtn {
		   	background-color: skyblue;
		    width: 200px;
		    height: 60px;
		    border: 1px;
		    margin: 50px 0px;
		    font-size: 21px;
		}
		
		</style>
		
		
	</head>
	
	<body>
		<div id="container">
		<jsp:include page="../../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
			<h1> 공지사항 </h1>
			<button class="btnbtn" onclick="location.href='/free/writeView';">게시글 작성</button>
			<ul id="search">
				<li><a href="/free/list"><h5>자유게시판</h5></a></li>
				<li  style="color: #275ab5"><a href="/notice/list"><h5>공지사항</h5></a></li>
				 <c:if test="${sessionScope.user.userType eq 1}">
                <li><a href="/report/list"><h5>신고게시판</h5></a></li>
                <li><a href="/free/blacklist"><h5>정지 리스트</h5></a></li>
            </c:if>
			</ul>
			</div>
			<jsp:include page="../../common/header.jsp"></jsp:include>
			<main>
			<div class="container">
				<table class="table table-hover" >
					<tbody>
						<tr>
							<th>번호</th>
							<td>${notice.noticeNo }</td>
							<th>작성자</th>
							<td>${notice.userId }</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td><c:forEach items="${fileList }" var="freeFile">
									${freeFile.fileName }
							</c:forEach></td>
							<th>작성날짜</th>
							<td>${notice.noticeWriteDate }</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>${notice.noticeTitle }</td>
							<th></th>
							<td></td>
						</tr>
						<tr style="height: 600px;">
						<td>${notice.noticeContent }</td>
						<th></th>
						<td></td>
						<th></th>
						</tr>
					</tbody>
				</table>
			</div>
				<div id="buttt">
				<c:url var="nModify" value="/notice/modifyView">
					<c:param name="noticeNo" value="${notice.noticeNo }"/>
				</c:url>
				<c:if test="${sessionScope.user.userType == 1}">
					<a href="${nModify }" class="btn btn-primary">수정 페이지로 이동</a>
					<a href="javascript:void(0);" onclick="removeCheck(${notice.noticeNo});"  class="btn btn-primary">게시판 삭제</a>
				</c:if>
				</div>
				<script>
					function removeCheck(noticeNo){
						if(confirm("정말 삭제하시겠습니까?"))
						location.href="/notice/remove?noticeNo="+noticeNo;
					}
					
					 
					  
					  
				</script>
			</main>
		</div>
	</body>
	
</html>