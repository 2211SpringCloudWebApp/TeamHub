<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>자유게시판 목록</title>
		<style>
		table{
			border : 1px solid black;
		}
		th, td {
			border : 1px soild black;
		}
		</style>
	</head>
	
	<body>
		<div id="container">
			<jsp:include page="../../common/header.jsp"></jsp:include>
			<div class="index_section">
				<h1>자유게시판 목록</h1> 
			</div>
			<main>
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성날짜</th>
							<th>첨부파일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${fList }" var="free" varStatus="i">
						<tr>
							<td>${i.count }</td>
							<td>${free.freeTitle }</td>
							<td>${free.freeContent }</td>
							<td>${free.freeWriteDate }</td>
							<td>X</td>
						</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<td colspan="5">
							<input type="text" placeholder="검색어를 입력해주세요">
							<button onclick="location.href='/free/writeView'">게시판 쓰기</button>
						</td>
					</tfoot>
				</table>
			</main>
		</div>
	</body>
	
</html>