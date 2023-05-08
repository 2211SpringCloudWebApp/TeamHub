<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>사원 목록</title>
		<link rel="stylesheet" href="../../../resources/css/user/user.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	</head>
	<body>
		<div id="container">
			<jsp:include page="../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
				<h2 style="font-weight:bold;">사원관리</h2><br>
				<c:if test="${sessionScope.user.userType eq 1 }">
					<a href="/user/list">사원 목록</a><br>
					<a href="/user/registerView">사원 등록</a><br>
					<a href="/user/userStateList">사원 관리</a><br>
					<button class="orgBtn" onclick="toggleOrg();">조직도</button>
					<div id="orgList">
					</div>
				</c:if>
				<c:if test="${sessionScope.user.userType ne 1 }">
					<a href="/user/list">사원 목록</a><br>
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
				<div class="searchArea">
					<form action="/user/stateSearch" method="get">
						<select name="condition" id="">
							<option value="name">이름</option>
						</select>
						<input type="text" id="" name="keyword" placeholder="이름을 입력하세요">
						<input type="submit" value="검색">
					</form>
				</div>
				<div class="tableTitle">재직자목록</div>
				<div class="tableArea" style="overflow:auto; margin: auto;">
				<table class="table table-hover">
					<thead style="text-align: center;">
						<tr class="table-light">
							<th style="width:15%;">사원번호</th>
							<th style="width:20%;">사원명</th>
							<th style="width:20%;">부서</th>
							<th style="width:15%;">직급</th>
							<th style="width:30%;">상세정보</th>
						</tr>
					</thead>
					<tbody style="text-align: center;">
						<c:forEach items="${userStateList }" var="user">
						<c:if test="${user.userState == '재직' }">
							<tr>
								<td>${user.userId }</td>
								<td>${user.userName }</td>
								<td>${user.deptName }</td>
								<td>${user.positionName }</td>
								<td><button class="detailBtn" onclick="location.href='/user/detailAdmin?userId=${user.userId }'">조회/수정</button></td>
							</tr>
						</c:if>
						</c:forEach>
					</tbody>
					<tfoot>
					
					</tfoot>
				</table>
				</div>
				<div class="tableTitle">퇴직자목록</div>
				<div class="tableArea" style="overflow:auto; margin: auto;">
					<table class="table table-hover" style="margin-bottom: 50px;">
						<thead style="text-align: center;">
							<tr class="table-light">
								<th style="width:15%;">사원번호</th>
								<th style="width:20%;">사원명</th>
								<th style="width:20%;">부서</th>
								<th style="width:15%;">직급</th>
								<th style="width:30%;">상세정보</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${userStateList }" var="user">
								<c:if test="${user.userState == '퇴직' }">
									<tr>
										<td>${user.userId }</td>
										<td>${user.userName }</td>
										<td>${user.deptName }</td>
										<td>${user.positionName }</td>
										<td><button class="detailBtn" onclick="location.href='/user/detailAdmin?userId=${user.userId }'">조회/수정</button></td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
						<tfoot>
						
						</tfoot>
					</table>
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
	//					var orgList = $("#orgList");
					orgList.empty();
					var ul = $("<ul>");
					var li, span;
					var prevDept = null;
					
					$.each(data, function(e, i) {
						if(prevDept !== i.deptName) {
							li = $("<li>").text(i.deptName);
	//							var img = $("<img>").attr("src", "/resources/img/main/minus.gif");
							ul.append(li);
							prevDept = i.deptName;
						}
						
						if(i.userName != null && i.positionName != null){
							var span = $("<span>");
							  var nameLink = $("<a>").attr("href", "/user/detail?userId=" + i.userId);
							  var nameSpan = $("<span>").text(i.userName).addClass("user-name");
	//							  var img = $("<img>").attr("src", "/resources/img/main/minus.gif");
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