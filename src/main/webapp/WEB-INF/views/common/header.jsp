<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>header</title>
		<link rel="stylesheet" href="../../../resources/css/common/header.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<!-- No mapping for GET /favicon.ico 안뜨게 설정 -->
		<link rel="icon" type="image/ico" href="${pageContext.request.contextPath}/resources/static/images/favicon.ico">
		<style type="text/css">

		#header nav ul {
			display: flex;
			justify-content: end;
			align-items: center;
			height: 80px;
		}
		
		#header nav ul li {
			padding: 30px 40px;
			height: 80px;
		} 
		
		#userInfo {
			padding-right: 30px;
		}
		#header nav ul li a {
			display: block;
			text-decoration: none;
			color: #333;
			height: 100%;
		}
		
		#header nav ul li ul {
			display: none;
			position: absolute;
			background-color: #fff;
			margin-top: 15px;
		}
		
		#header nav ul li:hover ul {
			display: block;
		}
		
		#header nav ul li ul li {
			width: 155px;
			display: block;
		}
		
		#header nav ul li ul li:hover {
			background-color: #eee;
		}
		
		</style>
		
	</head>
	
		
		
	<body>
	
	<div id="header">
		<nav>
			<ul>
				<li class="dropdown">
					<a>쪽지</a>
				</li>
				<li class="dropdown">
					<a>알림</a>
				</li>
				<li class="dropdown" style="padding-right: 130px;" ><a><b>${sessionScope.user.userName }</b>님</a>
					<ul>
						<li><a href="#">마이페이지</a></li>
						<li><a href="/user/logout">로그아웃</a></li>
					</ul>
				</li>
			</ul>
		</nav>

		<!-- 
		<h1 style="padding-right: 40px; text-align: right; line-height: 2.5;">${sessionScope.user.userName} 님</h1>  -->
	</div>
	
	</body>
	
</html>