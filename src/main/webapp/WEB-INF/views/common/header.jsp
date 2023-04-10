<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>header</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<!-- No mapping for GET /favicon.ico 안뜨게 설정 -->
		<link rel="icon" type="image/ico"
			href="${pageContext.request.contextPath}/resources/static/images/favicon.ico">
		</head>
		
		<style>
		 @font-face {
            font-family: 'RIDIBatang';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
		*,
		*::before,
		*::after {
			font-family: 'RIDIBatang';
			box-sizing: border-box;
			margin : 0;
			padding : 0;
		}
		html {
			/* 스크롤 내리는 속도를 천천히 */
			scroll-behavior: smooth;
		}
		body {
			margin: 0;
			min-width: 320px;
		}
		a {
			text-decoration: none;
			color: inherit;
		}
		li {
			list-style: none;
		}
		input:focus{
			outline: none;
		}
		table {
		    border-collapse: collapse;
		    border-spacing: 0;
		}
/* 		수정하기 
		#navbar {
		  position: fixed;
		  width: 100%;
		  height: 60px;
		  display: flex;
		  justify-content: space-between;
		  align-items: center;
		  padding: 16px;
		  transition: all 300ms ease-in-out;
		  z-index: 1;
		  background: linear-gradient(to right, #101820, #17222e, #24374b, #38546d);
		  border-top-left-radius: 25px;
		} */
		
		
		
		</style>
	<body>
	
	<ul id="navigator">
            <li><img id="navi-img" src="img/팀허브로고.png" alt=""></li>
            <li><a class="active" href="#">홈</a></li>
            <li><a href="#">근태관리</a></li>
            <li><a href="#">일정관리</a></li>
            <li><a href="#">업무관리</a></li>
            <li><a href="#">사원관리</a></li>
            <li><a href="#">프로젝트</a></li>
            <li><a href="#">전자결재</a></li>
            <li><a href="#">게시판</a></li>
        </ul>
        
        <div style="margin-left: 18%;padding:1px 16px;height:1000px;">
        <h1>네비 세로</h1>
        </div>
	
	
	<c:if test="${sessionScope.user == null || sessionScope.user ==''}">
	
	</c:if>
	<c:if test="${sessionScope.user != null && sessionScope.user !=''}">
	
	</c:if>

	
	</body>
	
	
	
</html>