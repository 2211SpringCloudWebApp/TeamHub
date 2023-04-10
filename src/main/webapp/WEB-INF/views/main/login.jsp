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
	        <div class="login-wrapper">
	            <input type="text" placeholder="ID" id="id" class="account">
	            <input type="password" placeholder="Password" id="password" class="account">
	            <button id="login" class="account">login</button>
	        </div>
	    </div>   
	</body>
	
</html>
