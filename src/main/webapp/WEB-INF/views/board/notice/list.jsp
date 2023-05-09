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
		<title>공지사항 목록</title>
		
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  </head>
		<style>
		table{
			border : 1px solid black;
		}
		th, td {
			border : 1px soild black;
		}
		#sideBar ul{
			padding: 0 !important;
			
		}
		
		.btnbtn {
		   	background-color: skyblue;
		    width: 200px;
		    height: 60px;
		    border: 1px;
		    margin: 50px 0px;
		    font-size: 21px;
		}
		
		
		#head{
		background-color: #FAFAFA;
		}
		</style>
	
	
	<body>
		<div id="container">
			<jsp:include page="../../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
			<h1> 공지사항 </h1>
			<button class="btnbtn" onclick="location.href='/free/writeView';">게시글 작성</button>
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
				<table class="table table-hover">
				<h2>공지사항 </h2>
					<thead>
						<tr id="head">
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성날짜</th>
							<th>조회수</th>
						<!--   	<th>첨부파일</th> -->
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${nList }" var="notice" varStatus="i">
						<tr>
							<td>${i.count }</td>
							<td><a href="/notice/detail?noticeNo=${notice.noticeNo }">${notice.noticeTitle }</a>
								<c:choose>
								    <c:when test="${notice.noticeFilename eq null }">
								    </c:when>
								    <c:when test="${notice.noticeFilename ne null }">
								        <img alt="" src="../../../../resources/img/kooimg/Web_(35).jpg" width="20px" height="20px">
								    </c:when>
								    <c:otherwise>
								        <!-- ${free.freefilename}이 null인 경우 처리할 내용 작성 -->
								    </c:otherwise>
								</c:choose>
							</td>
							<td>${notice.userId }</td>
							<td>${notice.noticeWriteDate }</td>
							<td>${notice.noticeCount }</td>
							
							
						<%-- 	<td>
								<c:if test= "${not empty free.freeFilename }">O</c:if>
								<c:if test= "${empty free.freeFilename }">X</c:if>
							</td> --%>
						</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr align="center">
							<td colspan="5">
								<c:forEach begin="${pi.startNavi}" end="${pi.endNavi }" var="p">
									<c:url var="pageUrl" value="/notice/list">
										<c:param name="page" value="${p }"></c:param>
									</c:url>
									<a href="${pageUrl }">${p }</a>&nbsp;
								</c:forEach>
							</td>
						</tr>
						
						
						<tr>
							<td colspan="4">
							<form action="/notice/search" method="get">
								<select name="searchCondition">
									<option value="all">전체</option>
									<option value="title">제목</option>
									<option value="content">내용</option>
								</select> <input type="text" id="id" name="searchValue" placeholder="검색어를 입력하세요">
								<input type="submit" value="검색" onclick="return check()" class="btn btn-primary">
							</form>
						</td>
	
							<td>
								<c:if test="${sessionScope.user.userType == 1}">
									<button onclick="location.href='/notice/writeView'" class="btn btn-primary">게시판 작성</button>
								</c:if>
							</td>
						</tr>
					</tfoot>
				</table>
			</main>
		</div>
		<script>
		function check() {
			var valid = true;
			valid = valid && validateId();
			return valid;
		}
		</script>
	</body>
	
</html>