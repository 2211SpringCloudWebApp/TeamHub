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
		<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script> 
		<!-- No mapping for GET /favicon.ico 안뜨게 설정 -->
		<link rel="icon" type="image/ico" href="${pageContext.request.contextPath}/resources/static/images/favicon.ico">
		<style type="text/css">
		#header nav ul {
			display: flex;
			justify-content: end;
			align-items: center;
			height: 80px;
			margin-right: 50px;
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
			background-color: white;
		}
		#header nav ul li ul li:hover {
			background-color: #eee;
		}
		.side-icon{
			width: 30px;
		    margin-right: 15px;
		}
		#alram-count{
			position: absolute;
		    display: inline;
		    top: 13px;
		    left: 30px;
		    width: 28px;
		    height: 18px;
		    line-height: 20px;
		    padding: 0 5px;
		    text-align: center;
		    color: #fff;
		    background-color: #fc0d1b;
		    border-radius: 6px;
		    z-index: 100;
		}
		#alram-menu{
		    position: absolute;
		    width: 530px;
		    height: 380px;
		    top: 80px;
		    left: -477px;
		    background-color: aliceblue;
		    font-size: 18px;
		}
		#alram-allCheck{
			text-align: right;
		    cursor: pointer;
		    font-weight: 600;
		    border: 1px solid gray;
		    padding-top: 10px;
		    padding-bottom: 10px;
	        background-image: linear-gradient(78deg, #a1c4fd 0%, #c2e9fb 100%);
		}
		#alram-allCheck span{
			margin-right: 20px;
		}
		#alram-list{
			height: 100%;
		    overflow-y: auto;
		    background-color: aliceblue;
		    padding-left: 20px;
		    padding-right: 20px;
		    border: 1px solid gray;
		    border-top: none;
		}
		#alram-list a{
			height: 2rem !important;
		    margin-top: 20px;
		    font-weight: 600;
		}
		#alram-list p{
			color: gray;
			border-bottom: 1px solid gray;
		}
		</style>
		
	</head>
		
	<body>
		<div id="header">
			<nav>
				<ul>
					<li class="dropdown" style="padding:0px; padding-right: 0px;">
						<a href="#" onclick="openAlramList();">
							<img class="side-icon" src="../../../resources/img/sidebar/alarm.svg" style="margin-right: -7px;width: 44px; height: 83px;">
							<span id="alram-count">0</span>
						</a>
						<div id="alram-menu">
							<p id="alram-allCheck" onclick="checkAllAlram();" style="margin-bottom: 0px;"><span>전체 읽음</span></p>
							<div id="alram-list">
								
							</div>	
						</div>
					</li>
					<li style="padding: 0px; height: 60px; padding-left: 30px;">
						<div class="imgArea">
							<c:if test="${!empty sessionScope.user.userFileName }">
				<%-- ${sessionScope.user.userFileName } : 그냥 ${user.userFileName }로 하면 사원관리 들어갔을때 클릭한 사원의 사진으로 바뀜 --%>
								<div>
									<img alt="" src="../../../resources/fileUploads/${sessionScope.user.userFileName }" width="60px" height="60px" style="border-radius: 50%;">
								</div>
							</c:if>
							<c:if test="${empty sessionScope.user.userFileName }">
								<div>
									<img alt="" src="../../../resources/img/main/userlogo.png" width="60px" height="60px" style="border-radius: 50%;">
								</div>
							</c:if>
						</div>
					</li>
					<li class="dropdown" style="padding-left: 20px;" ><a><b>${sessionScope.user.userName }</b>님</a>
						<ul>
							<li><a href="/user/mypage">마이페이지</a></li>
							<li><a href="/user/logout">로그아웃</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
		
		
		<script type="text/javascript">
		
		// 전역변수 설정
		var alarmTest = $("#alramTest");
		var text ="";
		const userId = "${sessionScope.user.userId}";
		var socket = null;
		
		$(document).ready(function(){
			connectWs();
		})

		
		function connectWs(){
			var ws = new SockJS("/alram");
			socket = ws;
			// onopen은 소켓이 연결 됐을 때
			ws.onopen = function() {
				console.log('open');
				ws.send(userId);
			 };

			// onmessage 는 서버에서 메세지를 받았을 때
			ws.onmessage = function(event) {  
				console.log(event.data);
				$("#alram-list").append(event.data);
				
				
				// Ajax를 이용해서 내 알림 숫자 구하기.
				$.ajax({
					 url : "/alram/count",
					 data : {
						 "userId": userId,
						    },
					 type : "post",
					 success : function(data){
					 	console.log("알람개수 : " + data)
					 	$("#alram-count").html(data);
					 },
					 error : function(){
						alert("알람 에러! 관리자 문의 요망");
					 }
				 })
			};

			// onclose는 소켓 연결 해제됐을 때
			ws.onclose = function() {
			    console.log('close');
 			};
		};
		
		// 알람 개수
		function alramCount(){
			$.ajax({
				 url : "/alram/count",
				 data : {
					 "userId": userId,
					    },
				 type : "post",
				 success : function(data){
				 	console.log("알람개수 : " + data)
				 	$("#alram-count").html(data);
				 },
				 error : function(){
					alert("알람 에러! 관리자 문의 요망");
				 }
			 })
		}
		
		$("#alram-menu").css("display", "none");
		// 알람 클릭시 목록 출력 함수
		function openAlramList(){
			var displayValue = $("#alram-menu").css("display");
			 if (displayValue === "none") {
			    // display 속성 값을 "block"으로 설정
			    $("#alram-menu").css("display", "block");
			  } else if(displayValue === "block"){
			    $("#alram-menu").css("display", "none");
			  }
		}
		
		// 알람 클릭시 체크로 변경
		function checkAlram(data){
			console.log("번호: " + data);
			$.ajax({
				url: "/alram/check",
				data: {"alramNo" : data},
				type: "POST",
				success: function(){
					$("#alram-list").html("");
					alramCount();
				},
				error: function(){
					
				}
			})
		}
		// 모두읽음 클릭시 알람 전체 체크로 변경
		function checkAllAlram(){
			var userId = "${sessionScope.user.userId}";
			$.ajax({
				url: "/alram/checkAll",
				data: {"userId" : userId},
				type: "POST",
				success: function(){
					$("#alram-list").html("");
					$("#alram-menu").css("display", "none");
					alramCount();
				},
				error: function(){
					
				}
			})
		}
		
	</script>
	</body>
</html>