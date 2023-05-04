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
		<title>자유게시판 목록</title>
		
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<style>
		#sideBar li:nth-child(9){
		    background-color: #2653e8ba;
  				
		}
		#sideBar li:nth-child(9) a{
			color: white !important;
		}
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
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성날짜</th>
							<th>조회수</th>
						<!--   	<th>첨부파일</th> -->
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${sList }" var="free" varStatus="i">
						<tr>
							<td>${i.count }</td>
							<td><a href="/free/detail?freeNo=${free.freeNo }">${free.freeTitle }</a>
							<c:choose>
								    <c:when test="${free.freeFilename eq null }">
								    </c:when>
								    <c:when test="${free.freeFilename ne null }">
								        <img alt="" src="../../../../resources/img/kooimg/Web_(35).jpg" width="20px" height="20px">
								    </c:when>
								    <c:otherwise>
								        <!-- ${free.freefilename}이 null인 경우 처리할 내용 작성 -->
								    </c:otherwise>
								</c:choose>
								<c:choose>
										<c:when test="${free.replyCount eq 0 }">
									</c:when>
										<c:when test="${free.replyCount > 0 }">
										<small>(${free.replyCount })</small>
									</c:when>
								</c:choose>
							</td>
							<td>${free.userId }</td>
							<td>${free.freeWriteDate }</td>
							<td>${free.freeCount }</td>
							
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
									<c:url var="pageUrl" value="/free/search">
										<c:param name="page" value="${p }"></c:param>
										<c:param name="searchValue" value="${search.searchValue }"></c:param>
										<c:param name="searchCondition" 
										value="${search.searchCondition }"></c:param>
									</c:url>
									<a href="${pageUrl }">${p }</a>&nbsp;
								</c:forEach><br> <br> <input type="button" value="전체 목록으로 이동" class="btn btn-primary"
								onclick="location='/free/list'">
							</td>
						</tr>
						
						
						<tr>
							<td colspan="4">
								<form action="/free/search" method="get">
									<select name="searchCondition">
									<option value="all">전체</option>
									<option value="id">작성자Id</option>
									<option value="title">제목</option>
									<option value="content">내용</option>
								</select>
									<input type="text" id="id" name="searchValue" placeholder="검색어를 입력해주세요">
									<input type="submit" value="검색" onclick="return check()" class="btn btn-primary">
								</form>
							</td>
							<td>
								<button 
										  onclick="
										    <c:choose>
										      <c:when test='${sessionScope.user.userBoardGrant eq "N"}'>
										        alert('게시판을 쓸 수 있는 권한이 없습니다.');
										      </c:when>
										      <c:otherwise>
										        location.href='/free/writeView';
										      </c:otherwise>
										    </c:choose>
										  " 
										  class="btn btn-primary">게시판 쓰기
										</button>
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