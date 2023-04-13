<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>일정관리</title>
		<link rel="stylesheet" href="../../../resources/css/schedule/schedule.css">
	</head>
	
	<body>
		<div id="container">
			<jsp:include page="../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
				<h1>일정관리</h1>
				<button class="scheduleAddBtn">일정등록</button>
				<h3>내 캘린더</h3>
				<ul>
				    <li><input type="checkbox" name="allSche" value="allSche">전사일정</li>
				    <li><input type="checkbox" name="deptSche" value="deptSche">부서일정</li>
				    <li><input type="checkbox" name="userSche" value="userSche">개인일정</li>
				</ul>
			</div>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
				메인 코드 작성 부분
			</main>
		</div>
		
		<script type="text/javascript">
		
		
		</script>
		
		
	</body>
</html>