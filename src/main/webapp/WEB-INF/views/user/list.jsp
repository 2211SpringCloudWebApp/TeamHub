<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>사원 전체 목록</title>
		<link rel="stylesheet" href="../../../resources/css/user/user.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script src="../../../resources/js/jquery.treeview.js"></script>
		<link rel="stylesheet" href="../../../resources/css/user/jquery.treeview.css" />
<!-- 		<link rel="stylesheet" href="../../../resources/css/user/screen.css" /> -->
	</head>

	<body>
		<div id="container">
			<jsp:include page="../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar" >
				<h2 style="font-weight:bold;">사원관리</h2><br>
				<c:if test="${sessionScope.user.userType eq 1 }">
					<a href="/user/list">사원 목록</a><br>
<!-- 					<a href="javascript:void(0)" onclick="getOrg();">조직도</a><br> -->
					<a href="/user/registerView">사원 등록</a><br>
					<a href="/user/userStateList">사원 관리</a><br>
					<button class="orgBtn" onclick="toggleOrg();">조직도</button>
					<div id="orgList">
					</div>
				</c:if>
				<c:if test="${sessionScope.user.userType ne 1 }">
					<a href="/user/list">사원 목록</a><br>
<!-- 					<a href="javascript:void(0)" onclick="getOrg();">조직도</a> -->
					<button class="orgBtn" onclick="toggleOrg();">조직도</button>
					<div id="orgList">
					</div>
				</c:if>
			</div>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
				<div class="mainTitle">
					<h2>사원 목록</h2>
				</div>
				<div class="tableArea" style="margin: auto;">
					<table class="table table-hover">
						<thead style="text-align: center;">
							<tr class="table-light">
								<th style="width:15%;">사원명</th>
								<th style="width:20%;">부서</th>
								<th style="width:20%;">직급</th>
								<th style="width:25%;">이메일</th>
								<th style="width:20%;">연락처</th>
							</tr>
						</thead>
						<tbody style="text-align: center;">
								<c:forEach items="${uList }" var="user">
									<tr>
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
				</div>
				<div class="pageArea">
					<c:if test="${pi.currentPage > 1 }">
						<a href="/user/list?page=1">&#10094;&#10094;&nbsp; </a>
					</c:if>
					<c:if test="${pi.currentPage > 1 }">
						<a href="/user/list?page=${pi.currentPage -1 }">&#10094; </a>&nbsp;
					</c:if>
					<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="page">
						<c:url var="pageUrl" value="/user/list">
							<c:param name="page" value="${page }" />
						</c:url>
						<a href="${pageUrl }">${page }</a>&nbsp;&nbsp;
					</c:forEach>
					<c:if test="${pi.currentPage < pi.maxPage }">
						<a href="/user/list?page=${pi.currentPage +1}">&#10095;</a>
					</c:if>
					<c:if test="${pi.currentPage < pi.maxPage }">
						<a href="/user/list?page=${pi.maxPage }">&nbsp;&#10095;&#10095;</a>&nbsp;
					</c:if>
				</div>
				<div class="searchArea">
					<form action="/user/search" method="get">
						<select name="condition" id="">
							<option value="all">전체</option>
							<option value="dept">부서</option>
							<option value="position">직급</option>
							<option value="name">사원명</option>
						</select>
						<input type="text" id="" name="keyword" placeholder="검색어를 입력하세요">
						<input type="submit" value="검색">
					</form>
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
								  span.append("　└ ").append(nameLink).append(" ").append(positionSpan);
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