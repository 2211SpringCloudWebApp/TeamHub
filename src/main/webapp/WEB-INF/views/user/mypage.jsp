<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<div id="container">
			<jsp:include page="../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
				마이페이지<br><br>
				<a href="/user/mypage">회원 수정</a><br>
				<a href="javascript:void(0);" onclick="removeCheck('${user.userId }');">회원 탈퇴</a>
			</div>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
				<form action="/user/modifyMypage" action="post">
					<c:if test="${!empty user.userFileName }">
					<div>
						<img alt="" src="../resources/fileUploads/${user.userFileName }" width="200px" height="200px;">
					</div>
					</c:if>
					<c:if test="${empty user.userFileName }">
					<div>
						<img alt="" src="../resources/img/main/userlogo.png" width="200px" height="200px;">
					</div>
					</c:if>
					<div>
					아이디 <input type="text" name="userId" value="${user.userId }" readonly><br>
					비밀번호 <input type="password" name="userPw" value="${user.userPw }"><br>
					이름 <input type="text" name="userName" value="${user.userName }" readonly><br>
					부서 <input type="text" name="deptName" value="${user.deptName }" readonly><br>
					직급 <input type="text" name="positionName" value="${user.positionName }" readonly><br>
					연락처 <input type="text" name="userPhone" value="${user.userPhone }"><br>
					이메일 <input type="text" name="userEmail" value="${user.userEmail }"><br>
					생년월일 <input type="text" name="userBirth" value="${user.userBirth }" readonly><br>
					</div>
					<input type="submit" value="수정">
					<input type="reset" value="취소">
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