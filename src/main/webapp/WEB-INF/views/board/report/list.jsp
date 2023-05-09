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
	
		
		#head{
		background-color: #FAFAFA;
		}
		</style>
	</head>
	
	<body>
		<div id="container">
		<jsp:include page="../../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
			<h1> 신고게시판 </h1>
			<ul id="search">
				<li><a href="/free/list"><h5>자유게시판</h5></a></li>
				<li><a href="/notice/list"><h5>공지사항</h5></a></li>
                <li  style="color: #275ab5"><a href="/report/list"><h5>신고게시판</h5></a></li>
                 <li><h5><a href="/free/blacklist">정지 리스트</a></h5></li>
			</ul>
			</div>
			<jsp:include page="../../common/header.jsp"></jsp:include>
			<main>
			<form action="/report/delete" method="post">
				<table class="table table-hover">
					<thead>
					<h2>신고 목록</h2> 
						<tr id="head">
							<th>번호</th>
							<th>신고 사유</th>
							<th>상세 내용</th>
							<th>신고자</th>
							<th>삭제</th>
							
						<!--   	<th>첨부파일</th> -->
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${rList }" var="report" varStatus="i">
						<tr>
							<td>${i.count }</td>
							<td>${report.reportTitle }</td>
							 <td><a href="/free/detail?freeNo=${report.boardNo }">${report.reportContent }</a></td>
							<td>${report.reportId }</td>
							<td><input type="checkbox" name="reportNo" value="${report.reportNo }"></td>
						</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr align="center">
							<td colspan="5">
								<c:forEach begin="${pi.startNavi}" end="${pi.endNavi }" var="p">
									<c:url var="pageUrl" value="/report/list">
										<c:param name="page" value="${p }"></c:param>
									</c:url>
									<a href="${pageUrl }">${p }</a>&nbsp;
								</c:forEach>
								<button style="float: right; margin-right: 145px;" class="btn btn-primary" id="reportDelete">삭제</button>
							</td>
						</tr>
						
					</tfoot>
				</table>
			</form>
			</main>
		</div>
		
	</body>
	
</html>