<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>프로젝트 메인</title>
	</head>
	
	<body>
		<div id="container">
			<jsp:include page="../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
				<ul>
					<li><button>프로젝트 생성</button></li>
					<li><a href="#">전체보기</a></li>
					<li><a href="#">진행 중인 프로젝트</a></li>
					<li><a href="#">종료된 프로젝트</a></li>
	           </ul>
			</div>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
				<h2>프로젝트 전체보기</h2>
				
			</main>
		</div>
	</body>
	
</html>