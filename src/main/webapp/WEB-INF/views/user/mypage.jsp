<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>마이 페이지</title>
		<link rel="stylesheet" href="../../../resources/css/user/user.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	</head>
	
	<body>
		<div id="container">
			<jsp:include page="../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
				<h2 style="font-weight:bold;">마이페이지</h2>
				<br>
				<a href="/user/mypage">회원 수정</a><br>
				<a href="javascript:void(0);" onclick="removeCheck('${user.userId }');">회원 탈퇴</a>
			</div>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
				<div class="mainTitle">
					<h2>마이페이지</h2>
				</div>
				<div class="topArea"></div>
				<form action="/user/modifyMypage" action="post">
					<div class="infoForm">
						<div class="imgArea">
							<c:if test="${!empty user.userFileName }">
							<div>
								<img alt="" src="../resources/fileUploads/${user.userFileName }" width="340px" height="330px">
							</div>
							</c:if>
							<c:if test="${empty user.userFileName }">
							<div>
								<img alt="" src="../resources/img/main/userlogo.png" width="340px" height="330px">
							</div>
							</c:if>
						</div>
						<div class="infoArea">
							<label>사원번호 </label><input type="text" name="userId" value="${user.userId }" readonly><br>
							<label>비밀번호 </label><input type="password" name="userPw" value="${user.userPw }"><br>
							<label>사원명 </label><input type="text" name="userName" value="${user.userName }" readonly><br>
							<label>부서 </label><input type="text" name="deptName" value="${user.deptName }" readonly><br>
							<label>직급 </label><input type="text" name="positionName" value="${user.positionName }" readonly><br>
							<label>연락처 </label><input type="text" name="userPhone" value="${user.userPhone }"><br>
							<label>이메일 </label><input type="text" name="userEmail" value="${user.userEmail }"><br>
							<label>생년월일 </label><input type="text" name="userBirth" value="${user.userBirth }" readonly><br>
						</div>
					</div>
					<div class="modifyArea">
						<input type="submit" value="수정">
						<input type="reset" value="취소">
					</div>
				</form>
			</main>
		</div>
		<script>
			function removeCheck(userId) {
		 		if(confirm("탈퇴하시겠습니까?")){
		 			location.href="/user/delete?userId="+userId;
		 		}
		 	}
		</script>
	</body>
	
</html>