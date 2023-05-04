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
				<h1>게시글 보기</h1>
				번호 : ${notice.noticeNo } / 제목 : ${notice.noticeTitle } / 작성자 : ${notice.userId }
				/ 작성날짜 : ${notice.noticeWriteDate }
				<br>
				내용 : ${notice.noticeContent }
				<br>
				첨부파일 : 
				<c:forEach items="${fileList }" var="freeFile">
					${freeFile.fileName }
				</c:forEach>
				<c:url var="nModify" value="/notice/modifyView">
					<c:param name="noticeNo" value="${notice.noticeNo }"/>
				</c:url>
				<c:if test="${sessionScope.user.userType == 1}">
					<a href="${nModify }">수정 페이지로 이동</a>
					<a href="javascript:void(0);" onclick="removeCheck(${notice.noticeNo});">게시판 삭제</a>
				</c:if>
				
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