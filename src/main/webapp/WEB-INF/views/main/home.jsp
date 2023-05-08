<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>메인</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
		<link rel="stylesheet" href="../../../resources/css/main/main.css">
		<style type="text/css">
			#sideBar li:nth-child(2){
			    background-color: #2653e8ba;
  				
			}
			#sideBar li:nth-child(2) a{
				color: white !important;
			}
			#header{
				width: calc(100% - 250px) !important;
				margin-left: 250px !important;
			}
			main{
				width: calc(100% - 250px) !important;
				margin-left: 250px !important;
			}
			p{
				margin-bottom: 0px;
			}
		</style>
	</head>
	
	<body>
		<div id="container">
			<jsp:include page="../common/sideBar.jsp"></jsp:include>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
				<div id="main-box">
				
			<!-- 메인 왼쪽 -->
					<div id="main-box-left">
						<div id="main-user">
							<div>
								<p class="main-title">내 정보</p>
							</div>
							<div>
								<img id="main-user-img" src="../../../resources/img/main/p9s9e9-img.jpg">
							</div>
							<div>
								<p>${sessionScope.user.userName } ${sessionScope.user.positionName }</p>
								<p>${sessionScope.user.deptName}</p>
								<p>결제 대기 문서</p>
								<p>결제 진행 문서</p>
								<p>결제 완료 문서</p>
						</div>
						<div id="main-notice">
							<p>공지사항</p>
						</div>
					</div>
					
			<!-- 메인 센터 -->
					<div id="main-box-center">
						<div id="main-schedule">
							<p>스케쥴</p>
						</div>
						<div id="main-todo">
							<p>todo</p>
						</div>
					</div>
					
			<!-- 메인 오른쪽 -->
					<div id="main-box-right">
						<div id="main-attendance">
							<p>근태관리</p>
						</div>
						<div id="main-project">
							<p>project</p>
						</div>
					</div>
				
				
				
					
					
					
					
					
				</div>
			</main>
		</div>
	</body>
	
</html>