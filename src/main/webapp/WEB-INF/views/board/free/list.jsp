<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>자유게시판 목록</title>
		
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  </head>
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
		</style>
	</head>
	
	<body>
		<div id="container">
			<jsp:include page="../../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
				<h1>자유게시판 목록</h1> 
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
						<c:forEach items="${fList }" var="free" varStatus="i">
						<tr>
							<td>${i.count }</td>
							<td><a href="/free/detail?freeNo=${free.freeNo }">${free.freeTitle }</a></td>
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
									<c:url var="pageUrl" value="/free/list">
										<c:param name="page" value="${p }"></c:param>
									</c:url>
									<a href="${pageUrl }">${p }</a>&nbsp;
								</c:forEach>
							</td>
						</tr>
						
						
						<tr>
							<td colspan="4">
							<form action="/free/search" method="get">
								<select name="searchCondition">
									<option value="all">전체</option>
									<option value="id">작성자id</option>
									<option value="title">제목</option>
									<option value="content">내용</option>
								</select> <input type="text" id="id" name="searchValue" placeholder="검색어를 입력하세요">
								<input type="submit" value="검색" onclick="return check()">
							</form>
						</td>
	
							<td>
								<button onclick="location.href='/free/writeView'">게시판 쓰기</button>
							</td>
						</tr>
					</tfoot>
				</table>
			</main>
		</div>
	</body>
	
</html>