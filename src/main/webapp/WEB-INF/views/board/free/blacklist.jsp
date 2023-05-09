<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
if(session.getAttribute("user") == null){
    response.sendRedirect("/");
} else {
    
}
%><!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>신고 목록</title>
		
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
		#search li{
			list-style-type: square !important;
		}
		#head{
		background-color: #FAFAFA;
		}
		</style>
	</head>
	
	<body>
		<div id="container">
		<jsp:include page="../../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
			<h1> 자유게시판 </h1>
			<ul id="search">
				<li><a href="/free/list"><h5>자유게시판</h5></a></li>
				<li><a href="/notice/list"><h5>공지사항</h5></a></li>
                <li><a href="/report/list"><h5>신고게시판</h5></a></li>
                <li  style="color: #275ab5"><h5><a href="/free/blacklist">정지 리스트</a></h5></li>
			</ul>
			</div>
			<jsp:include page="../../common/header.jsp"></jsp:include>
			<main>
			<form action="/blacklist/bdelete" method="post">
				<table class="table table-hover">
					<thead>
					<h2>신고 목록</h2> 
						<tr id="head">
							<th>번호</th>
							<th>ID</th>
							<th>이름</th>
							<th>부서</th>
							<th>직급</th>
							<th>제한 해제</th>
							
						<!--   	<th>첨부파일</th> -->
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${bList }" var="user" varStatus="i">
						<tr>
							<td>${i.count }</td>
							<td>${user.userId }</td>
							 <td>${user.userName }</td>
							 <td>${user.deptName }</td>
							<td>${user.positionName }</td>
							<td><input type="checkbox" name="userId" value="${user.userId }"></td>
						</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr align="center">
							<td colspan="5">
								<c:forEach begin="${pi.startNavi}" end="${pi.endNavi }" var="p">
									<c:url var="pageUrl" value="/free/blacklist">
										<c:param name="page" value="${p }"></c:param>
									</c:url>
									<a href="${pageUrl }">${p }</a>&nbsp;
								</c:forEach>
								<button style="float: right; margin-right: -75px;" class="btn btn-primary" id="deleteReport">해제</button>
							</td>
						</tr>
						
					</tfoot>
				</table>
			</form>
			</main>
		</div>
		
	</body>
	
</html>