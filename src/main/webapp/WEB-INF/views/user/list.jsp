<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>사원 전체 목록</title>
		<link rel="stylesheet" href="../../../resources/css/user/user.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script src="../../../resources/js/jquery.treeview.js"></script>
		<link rel="stylesheet" href="../../../resources/css/user/jquery.treeview.css" />
<!-- 		<link rel="stylesheet" href="../../../resources/css/user/screen.css" /> -->
	</head>

	<body>
		<div id="container">
			<jsp:include page="../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar" >
				<c:if test="${sessionScope.user.userType eq 1 }">
					<a href="/user/list">사원 목록</a><br>
<!-- 					<a href="javascript:void(0)" onclick="getOrg();">조직도</a><br> -->
					<a href="/user/registerView">사원 등록</a><br>
					<a href="/user/userStateList">사원 관리</a><br>
					<button onclick="toggleOrg();">조직도</button>
					<div id="orgList">
					</div>
				</c:if>
				<c:if test="${sessionScope.user.userType ne 1 }">
					<a href="/user/list">사원 목록</a><br>
<!-- 					<a href="javascript:void(0)" onclick="getOrg();">조직도</a> -->
					<button onclick="toggleOrg();">조직도</button>
					<div id="orgList">
					</div>
				</c:if>
			</div>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
				<form action="/user/search" method="get">
					<select name="condition" id="">
						<option value="all">전체</option>
						<option value="dept">부서</option>
						<option value="position">직급</option>
						<option value="name">이름</option>
					</select>
					<input type="text" id="" name="keyword" placeholder="검색어를 입력하세요">
					<input type="submit" value="검색">
				</form>
				<table>
					<thead>
						<tr>
<!-- 							<th>사원번호</th> -->
							<th>이름</th>
							<th>부서</th>
							<th>직급</th>
							<th>이메일</th>
							<th>연락처</th>
						</tr>
					</thead>
					<tbody>
							<c:forEach items="${uList }" var="user">
								<tr>
	<%-- 								<td><a href="/user/detail?userId=${user.userId }">${user.userId }</a></td> --%>
									<td><a href="/user/detail?userId=${user.userId }">${user.userName }</a></td>
									<td>${user.deptName }</td>
									<td>${user.positionName }</td>
									<td>${user.userEmail }</td>
									<td>${user.userPhone }</td>
								</tr>
							</c:forEach>
					</tbody>
					<tfoot>
					
					</tfoot>
					
				</table>
				<div>
					<c:if test="${pi.currentPage > 1 }">
						<a href="/user/list?page=1"><<</a>
					</c:if>
					<c:if test="${pi.currentPage > 1 }">
						<a href="/user/list?page=${pi.currentPage -1 }"><</a>
					</c:if>
					<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="page">
						<c:url var="pageUrl" value="/user/list">
							<c:param name="page" value="${page }" />
						</c:url>
						<a href="${pageUrl }">${page }</a>
					</c:forEach>
					<c:if test="${pi.currentPage < pi.maxPage }">
						<a href="/user/list?page=${pi.currentPage +1}">></a>
					</c:if>
					<c:if test="${pi.currentPage < pi.maxPage }">
						<a href="/user/list?page=${pi.maxPage }">>></a>
					</c:if>
				</div>
			</main>
		</div>
	<script>
	
		
		var orgList = $("#orgList");
		var isVisible = false;
		
		
 		/* 조직도 버튼 클릭시 */
		function toggleOrg(){
			if(isVisible) {
				orgList.css("display", "none");
			}else {
				getOrg();
				orgList.css("display", "block");
			}
			isVisible = !isVisible;
		}
		
		/* 조직도 조회 */
		function getOrg() {
			$.ajax({
				url : "/user/org",
				type : "get",
				dataType : "json",
				success : function(data) {
// 					var orgList = $("#orgList");
					orgList.empty();
					var ul = $("<ul>");
					var li, span;
					var prevDept = null;
					
					$.each(data, function(e, i) {
						if(prevDept !== i.deptName) {
							li = $("<li>").text(i.deptName);
// 							var img = $("<img>").attr("src", "/resources/img/main/minus.gif");
							ul.append(li);
							prevDept = i.deptName;
						}
						
						if(i.userName != null && i.positionName != null){
							var span = $("<span>");
							  var nameLink = $("<a>").attr("href", "/user/detail?userId=" + i.userId);
							  var nameSpan = $("<span>").text(i.userName).addClass("user-name");
// 							  var img = $("<img>").attr("src", "/resources/img/main/minus.gif");
							  var positionSpan = $("<span>").text(i.positionName);
							  
							  nameLink.append(nameSpan);
							  span.append("&#10551;").append(nameLink).append(" ").append(positionSpan);
							  var li = $("<li>");
							  li.append(span);
							  ul.append(li);
						}
					});
					
					orgList.append(ul);
				},
				error : function() {
					alert("Ajax 처리 실패");
				}
			});
		}
		
		
	</script>
	</body>	
</html>