<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>사원 등록</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	</head>
	
	<body>
		<div id="container">
			<jsp:include page="../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
				서브 사이드바 코드 작성 부분. <br>
				<a href="/user/registerView">사원 등록</a><br>
				<a href="/user/userStateList">사원 관리</a>
			</div>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
				<form action="/user/register" method="post" enctype="multipart/form-data">
					<div id="img-viewer">
						<img id="img-view" alt="" src="../../../resources/img/main/userlogo.png" width="200" height="200">
					</div>
					사진 <input type="file" name="uploadFile" onchange="loadImg(this)"><br>
<!-- 					<input type="hidden" name="userFilePath"><br> -->
					아이디 <input type="text" name="userId" id="userId">
					<button onclick="checkId()">중복체크</button><br>
					비밀번호 <input type="password" name="userPw"><br>
					이름 <input type="text" name="userName"><br>
					부서 
					<select name="deptName" id="">
						<option value="인사팀">인사팀</option>
						<option value="회계팀">회계팀</option>
						<option value="개발팀">개발팀</option>
						<option value="디자인팀">디자인팀</option>
						<option value="경영팀">경영팀</option>
					</select><br>
					직급
					<select name="positionName" id="">
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
					이메일 <input type="text" name="userEmail"><br>
					연락처 <input type="text" name="userPhone"><br>
					생년월일 <input type="text" name="userBirth" placeholder="0000-00-00 형식으로 입력"><br>
					재직상태 
					<label for="E"><input type="radio" name="userState" id="E" value="재직" checked> 재직</label> 
					<label for="R"><input type="radio" name="userState" id="R" value="퇴직"> 퇴직</label><br>
					
					관리자여부 Y <input type="radio" name="userType" value="1" >
					N <input type="radio" name="userType" value="0" checked><br>
					<input type="submit" value="등록">
					<input type="reset" value="초기화">
				</form>
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
			
			// 아이디 중복 체크
			function checkId(){
				id = $("#userId").val();
				$.ajax({
					url : "/user/checkId",
					data : id,
					type : "post",
					success : function(result) {
						if(reselt == 0) {
							alert("사용할 수 있는 아이디입니다.");
						}else {
							alert("중복된 아이디가 존재합니다.");
						}
					},
					error : function(){
						alert("AJAX 처리 실패");
					}
				});
			}
		</script>
	</body>
	
</html>