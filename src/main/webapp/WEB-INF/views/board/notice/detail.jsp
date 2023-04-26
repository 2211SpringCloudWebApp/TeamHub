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
				<h1>자유게시판 상세조회</h1> 
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