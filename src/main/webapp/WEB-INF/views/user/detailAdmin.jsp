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
<!-- 				관리자일때 사원상세정보 -->
				<c:if test="${sessionScope.user.userType eq 1 }">
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
							사원번호 <input type="text" name="userId" value="${user.userId }"><br>
							이름 <input type="text" name="userName" value="${user.userName }"><br>
							부서
							<select name="deptName" id="">
								<option value="${user.deptName }">${user.deptName }</option>
								<option value="인사팀">인사팀</option>
								<option value="회계팀">회계팀</option>
								<option value="개발팀">개발팀</option>
								<option value="디자인팀">디자인팀</option>
								<option value="경영팀">경영팀</option>
							</select><br>
							직급
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
							연락처 <input type="text" name="userPhone" value="${user.userPhone }"><br>
							이메일 <input type="text" name="userEmail" value="${user.userEmail }"><br>
							생년월일 <input type="text" name="userBirth" value="${user.userBirth }"><br>
							상태 <input type="text" name="userState" value="${user.userState }" readonly>
	<!-- 						재직상태  -->
	<!-- 						<label for="E"><input type="radio" name="userState" id="E" value="재직" checked> 재직</label>  -->
	<!-- 						<label for="R"><input type="radio" name="userState" id="R" value="퇴직"> 퇴직</label><br> -->
						</div>
						<input type="submit" value="수정">
					</form>
					<a href="javascript:void(0);" onclick="removeCheck('${user.userId }');">삭제</a>
					<a href="/user/userStateList">목록</a>
					<br>
					<a href="#modal" rel="modal:open">퇴직처리</a>
					<div id="modal" class="modal">
						모달창 내용
					</div>
				</c:if>
			</main>
		</div>
	<script>
		function removeCheck(userId) {
	 		if(confirm("삭제하겠습니까?")){
	 			location.href="/user/delete?userId="+userId;
	 		}
	 	}
		
	</script>
	</body>	
</html>