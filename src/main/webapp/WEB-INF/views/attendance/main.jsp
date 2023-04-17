<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>근태관리</title>
	    <link rel="stylesheet" href="../../../resources/css/attendance/attendance.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	</head>
	
	<body>
		<div id="container">
			<jsp:include page="../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
				<h2>근태관리</h2>
				<h4><a href="/attendance/mainView">근태관리</a></h4>
				<h4><a href="#">연차관리</a></h4>
			</div>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
			<div id="main-container">
	            <div id="main-top">
	                <div id="time-btn">
	                <div id="time"></div>
	                <div id="btns">
	                    <input type="button" class="home-btn" onclick="goToWork();" value="출근">
	                    <input type="button" class="home-btn" onclick="goToHome();" value="퇴근">
	                </div>
	            </div>
	                <div id="total">
	                    <table id="total-table" class="table">
	                        <thead class="table-light">
	                            <tr>
	                                <th colspan="3">통계</th>
	                            </tr>
	                            <tr>
	                                <th>지각</th>
	                                <th>조퇴</th>
	                                <th>출근</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            
	                            <tr>
	                                <td>ㅇ</td>
	                                <td>ㅇ</td>
	                                <td>ㅇ</td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>
	            </div>
            <div id="select">
                <form action="">
                    <select name="" id="">
                        <option value="">1월</option>
                        <option value="">2월</option>
                    </select>
                    <input type="submit" id="submit-btn" value="검색">
                </form>
            </div>
            <div id="board">
                <table id="board-table" class="table">
                    <thead class="table-light">
                        <tr>
                            <th>날짜</th>
                            <th>출근시간</th>
                            <th>퇴근시간</th>
                            <th>근무시간</th>
                            <th>근무상태</th>
                        </tr>
                        <tbody>
                            <tr>
                                <td>2023-04-11</td>
                                <td>08:57:00</td>
                                <td>02:34:00</td>
                                <td>04:00:00</td>
                                <td>출근</td>
                            </tr>
                            <tr>
                                <td>2023-04-11</td>
                                <td>08:57:00</td>
                                <td>02:34:00</td>
                                <td>04:00:00</td>
                                <td>출근</td>
                            </tr>
                        </tbody>
                        
                    </thead>
                </table>
            </div>
        </div>
			</main>
		</div>
		
		<script>
                const dpTime = function () {
                const now = new Date()
                let hours = now.getHours()
                let minutes = now.getMinutes()
                let seconds = now.getSeconds()
                let ampm = ''
                if (hours > 12) {
                    hours -= 12
                    ampm = '오후'
                } else {
                    ampm = '오전'
                }
                if (hours < 10) {
                    hours = '0' + hours
                }
                if (minutes < 10) {
                    minutes = '0' + minutes
                }
                if (seconds < 10) {
                    seconds = '0' + seconds
                }
                document.querySelector('#time').innerHTML = ampm + hours + ":" + minutes + ":" + seconds
                }
                setInterval(dpTime, 1000)  // 1초마다 함수 실행되도록 설정
                
                
                function goToWork() {
                	const now = new Date();
                    let hours = now.getHours();
                    let minutes = now.getMinutes();
                    let seconds = now.getSeconds();
                    var time = "";
                    if(hours < 10) {
                    	time += ('0' + hours);
                    } else {
                    	time += hours;
                    }
                    if(minutes < 10) {
                    	time += (":" + '0' + minutes);
                    } else {
                    	time += (":" + minutes);
                    }
                	if(seconds < 10){
                		time += (":" + '0' + seconds);
                	} else {
                		time += (":" + seconds);
                	}
                	
                	console.log(time);
                	$.ajax({
                		url : '/ajaxGoToWork',
                		data : {
                			 "date" : time
                		},
                		type : 'post',
                		success : function(data){
                			if(data == '0') { 		// 성공
                				alert("출근 완료");
                			} else if(data == '1') { // 실패
                				alert("출근 실패 - 다시 눌러주세요");
                			} else{
                				alert("이미 출근하셨습니다."); //-> 중복체크
                			}
                		},
                		error : function(data){
                			console.log("서버에러");
                		}
                	
                		
                	})
                }
                
                function goToHome() {
                	const now = new Date();
                    let hours = now.getHours();
                    let minutes = now.getMinutes();
                    let seconds = now.getSeconds();
                    var time = "";
                    if(hours < 10) {
                    	time += ('0' + hours);
                    } else {
                    	time += hours;
                    }
                    if(minutes < 10) {
                    	time += (":" + '0' + minutes);
                    } else {
                    	time += (":" + minutes);
                    }
                	if(seconds < 10){
                		time += (":" + '0' + seconds);
                	} else {
                		time += (":" + seconds);
                	}
                	
                	console.log(time);
                	$.ajax({
                		url : '/ajaxGoToHome',
                		data : {
                			 "date" : time
                		},
                		dataType:'json',
                		type : 'post',
                		success : function(data){
//                 			if(data == '0') { 		// 성공
//                 				alert("퇴근 완료");
//                 			} else if(data == '1') { // 실패
//                 				alert("퇴근 실패 - 다시 눌러주세요");
//                 			} else if(data == '2'){
//                 				alert("이미 퇴근하셨습니다."); //-> 중복체크
//                 			} else {
//                 				alert("출근먼저하시길");
//                 			}
							alert(data);
                		},
                		error : function(data){
                			console.log(data);
                		}
                	
                		
                	})
                }
                
         
            </script>
	</body>
	
</html>