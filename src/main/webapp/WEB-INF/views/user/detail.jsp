<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>사원 상세</title>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
	</head>
	<style>
		#subSideBar ul {
			text-align : left;
			margin-top : 30px;
			margin-left : 50px;
		}
		#subSideBar ul li {
			line-height : 30px;
		}
		#orgList {
 			height : 80vh; 
			overflow : auto;
		}
	</style>
	
	<body>
		<div id="container">
			<jsp:include page="../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar" style="overflow:auto;">
				<c:if test="${sessionScope.user.userType eq 1 }">
					<a href="/user/list">사원 목록</a><br>
					<a href="/user/registerView">사원 등록</a><br>
					<a href="/user/userStateList">사원 관리</a><br>
					<button onclick="toggleOrg();">조직도</button>
					<div id="orgList">
					</div>
				</c:if>
				<c:if test="${sessionScope.user.userType ne 1 }">
					<a href="/user/list">사원 목록</a><br>
					<button onclick="toggleOrg();">조직도</button>
					<div id="orgList">
					</div>
				</c:if> 
			</div>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
					<form action="/user/modify" action="post" enctype="multipart/form-data">
						<c:if test="${!empty user.userFileName }">
						<div>
							<img alt="" src="../resources/fileUploads/${user.userFileName }" width="200px" height="200px";>
						</div>
						</c:if>
						<c:if test="${empty user.userFileName }">
						<div>
							<img alt="" src="../resources/img/main/userlogo.png" width="200px" height="200px";>
						</div>
						</c:if>
						<div>
							사원번호 <input type="text" name="userId" value="${user.userId }" readonly><br>
							이름 <input type="text" name="userName" value="${user.userName }" readonly><br>
							부서 <input type="text" name="deptName" value="${user.deptName }" readonly><br>
							직급 <input type="text" name="positionName" value="${user.positionName }" readonly><br>
							연락처 <input type="text" name="userPhone" value="${user.userPhone }" readonly><br>
							이메일 <input type="text" name="userEmail" value="${user.userEmail }" readonly><br>
							생년월일 <input type="text" name="userBirth" value="${user.userBirth }" readonly><br>
						</div>
					</form>
					<a href="/user/list">목록</a>
					<br>
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