<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<style>
		table {
			border : 1px solid black;
		}
	</style>
	<body>
		<div id="container">
			<jsp:include page="../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar" style="overflow:auto;">
				<c:if test="${sessionScope.user.userType eq 1 }">
					<a href="/user/list">사원 목록</a><br>
					<a href="#">조직도</a><br>
					<a href="/user/registerView">사원 등록</a><br>
					<a href="/user/userStateList">사원 관리</a>
					<hr>
					<div>//조직도//</div>
				</c:if>
				<c:if test="${sessionScope.user.userType ne 1 }">
					<a href="/user/list">사원 목록</a><br>
					<a href="#">조직도</a>
					<hr>
					<div>//조직도//</div>
				</c:if> 
			</div>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
				<form action="/user/stateSearch" method="get">
					<select name="condition" id="">
						<option value="name">이름</option>
					</select>
					<input type="text" id="" name="keyword" placeholder="이름을 입력해주세요">
					<input type="submit" value="검색">
				</form>
				재직자목록
				<table>
					<thead>
						<tr>
							<th>사원번호</th>
							<th>이름</th>
							<th>부서</th>
							<th>직급</th>
							<th>상세정보</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userStateList }" var="user">
							<c:if test="${user.userState == '재직' }">
								<tr>
									<td><a href="/user/detail?userId=${user.userId }">${user.userId }</a></td>
									<td><a href="/user/detail?userId=${user.userId }">${user.userName }</a></td>
									<td>${user.deptName }</td>
									<td>${user.positionName }</td>
									<td><button onclick="location.href='/user/detail?userId=${user.userId }'">조회/수정</button></td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
					<tfoot>
					
					</tfoot>
				</table>
				<hr>
				퇴직자목록
				<table>
					<thead>
					
						<tr>
							<th>사원번호</th>
							<th>이름</th>
							<th>부서</th>
							<th>직급</th>
							<th>상태</th>
							<th>상세정보</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userStateList }" var="user">
							<c:if test="${user.userState == '퇴직' }">
								<tr>
									<td><a href="/user/detail?userId=${user.userId }">${user.userId }</a></td>
									<td><a href="/user/detail?userId=${user.userId }">${user.userName }</a></td>
									<td>${user.deptName }</td>
									<td>${user.positionName }</td>
									<td>${user.userState }</td>
									<td><button onclick="location.href='/user/detail?userId=${user.userId }'">조회/수정</button></td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
					<tfoot>
					
					</tfoot>
				</table>
			</main>
		</div>
	</body>
	
</html>