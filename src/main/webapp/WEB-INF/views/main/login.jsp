<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="../../../resources/css/main/login.css">
	    <title>로그인</title>
	</head>
	<body>
	    <div class="main">
	        <div class="login-logo">
	            <img src="../../../resources/img/main/logo.png" alt="로고">
	        </div>
	        <form action="/user/login" method="post">
		        <div class="login-wrapper">
		            <input type="text" name="userId" placeholder="ID" id="id" class="account" required autofocus>
		            <input type="password" name="userPw" placeholder="Password" id="password" class="account" required>
		            <button id="login" class="account">login</button>
		        </div>
	        </form>
	    </div>   
	</body>
	
</html>
