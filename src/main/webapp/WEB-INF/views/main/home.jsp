<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>메인</title>
		<style type="text/css">
			#sideBar li:nth-child(2){
			    background-color: #2653e8ba;
  				
			}
			#sideBar li:nth-child(2) a{
				color: white !important;
			}
		</style>
	</head>
	
	<body>
		<div id="container">
			<jsp:include page="../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
				서브 사이드바 코드 작성 부분. 
			</div>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
				메인 코드 작성 부분
				
			</main>
		</div>
	</body>
	
</html>