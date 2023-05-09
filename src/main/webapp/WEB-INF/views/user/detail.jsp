<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>사원 상세</title>
		<link rel="stylesheet" href="../../../resources/css/user/user.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
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
					<h2>사원 상세</h2>
				</div>
				<div class="topArea"><a href="/user/list">목록</a></div>
				<form class="infoForm" action="/user/modify" method="post" enctype="multipart/form-data">
					<div class="imgArea">
						<c:if test="${!empty user.userFileName }">
						<div>
							<img alt="" src="../resources/fileUploads/${user.userFileName }" width="340px" height="330px";>
						</div>
						</c:if>
						<c:if test="${empty user.userFileName }">
						<div>
							<img alt="" src="../resources/img/main/userlogo.png" width="340px" height="330px";>
						</div>
						</c:if>
					</div>
					<div class="infoArea">
						<label>아이디</label> <input type="text" name="userId" value="${user.userId }" readonly><br>
						<label>사원명</label> <input type="text" name="userName" value="${user.userName }" readonly><br>
						<label>부서</label> <input type="text" name="deptName" value="${user.deptName }" readonly><br>
						<label>직급</label> <input type="text" name="positionName" value="${user.positionName }" readonly><br>
						<label>연락처</label> <input type="text" name="userPhone" value="${user.userPhone }" readonly><br>
						<label>이메일</label> <input type="text" name="userEmail" value="${user.userEmail }" readonly><br>
						<label>생년월일</label> <input type="text" name="userBirth" value="${user.userBirth }" readonly><br>
					</div>
				</form>
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
			toggleOrg()
			
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