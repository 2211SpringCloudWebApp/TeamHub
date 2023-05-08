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
					<div class="topArea">
						<a href="javascript:void(0);" onclick="removeCheck('${user.userId }');">삭제</a>
						<a href="/user/userStateList">목록</a>
					</div>
					<form action="/user/modify" method="post" enctype="multipart/form-data">
						<div class="infoForm">
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
								<label>사진</label> <input type="file" name="uploadFile" onchange="loadImg(this)"><br>
								<label>사원번호</label> <input type="text" name="userId" value="${user.userId }"><br>
								<label>사원명</label> <input type="text" name="userName" value="${user.userName }"><br>
								<label>부서</label>
								<select name="deptName" id="">
									<option value="${user.deptName }">${user.deptName }</option>
									<option value="인사팀">인사팀</option>
									<option value="회계팀">회계팀</option>
									<option value="개발팀">개발팀</option>
									<option value="디자인팀">디자인팀</option>
									<option value="경영팀">경영팀</option>
								</select><br>
								<label>직급</label>
								<select name="positionName" id="">
									<option value="${user.positionName }">${user.positionName }</option>
									<option value="회장">회장</option>
									<option value="부회장">부회장</option>
									<option value="사장">사장</option>
									<option value="부사장">부사장</option>
									<option value="전무">전무</option>
									<option value="상무">상무</option>
									<option value="이사">이사</option>
									<option value="부장">부장</option>
									<option value="차장">차장</option>						
									<option value="과장">과장</option>
									<option value="대리">대리</option>
									<option value="주임">주임</option>
									<option value="사원">사원</option>
									<option value="인턴">인턴</option>
								</select><br>
								<label>연락처</label> <input type="text" name="userPhone" value="${user.userPhone }"><br>
								<label>이메일</label> <input type="text" name="userEmail" value="${user.userEmail }"><br>
								<label>생년월일</label> <input type="text" name="userBirth" value="${user.userBirth }"><br>
								<label>상태</label> <input type="text" name="userState" value="${user.userState }" readonly>
							</div>
						</div>
						<br>
						<div class="modifyArea">
							<input type="submit" value="수정">
						</div>
					</form>
					<br>
					<c:if test="${user.userState == '재직' }">
						<form class="retireForm" action="/user/modifyState" method="post">
							<input type="hidden" name="userId" value="${user.userId }">
							<input type="hidden" name="userState" value="${user.userState }">
							<input type="submit" value="퇴직처리">
						</form>
					</c:if>
					
			</main>
		</div>
		<script>
		
		//이미지 미리보기
		function loadImg(obj) {
			if(obj.files.length != 0 && obj.files[0] != 0) {
				let reader = new FileReader();
				reader.readAsDataURL(obj.files[0]);
				reader.onload = function(e) {
					document.querySelector("#img-view").setAttribute("src", e.target.result);
				}
			}else {
				document.querySelector("#img-view").setAttribute("src", "");
			}
		}
		
		
		/* 삭제 여부 묻기 */
		function removeCheck(userId) {
	 		if(confirm("삭제하시겠습니까?")){
	 			location.href="/user/delete?userId="+userId;
	 		}
	 	}
		
		/* 변수 선언 */
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