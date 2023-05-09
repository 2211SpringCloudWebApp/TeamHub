<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>메인</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="../../../resources/css/main/main.css">
		<!---- 스케쥴 추가 ---->
		<link href='../../../resources/css/schedule/packages/core/main.css' rel='stylesheet' />
		<link href='../../../resources/css/schedule/packages/daygrid/main.css' rel='stylesheet' />
		<link href='../../../resources/css/schedule/packages/timegrid/main.css' rel='stylesheet' />
		<script src='../../../resources/css/schedule/packages/core/main.js'></script>
		<script src='../../../resources/css/schedule/packages/interaction/main.js'></script>
		<script src='../../../resources/css/schedule/packages/daygrid/main.js'></script>
		<script src='../../../resources/css/schedule/packages/timegrid/main.js'></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
		<!---------------------->
		
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
			/***** 스케쥴 CSS 부분 ********/
			#calendar {

		  	}
		  	.fc-button-primary {
			    color: black;
			    background-image: linear-gradient(275deg, #a1c4fd 0%, #c2e9fb 100%);
			    border-color: #b3b1b1;
			}
			.fc-icon-chevron-left:before {
			    content: "<";
			}
						.fc-icon-chevron-right:before {
			    content: ">";
			}
		  	.fc-content, .fc-time{
		  		font-size : 12px;
		  		font-weight: normal !important;
		  	}
		  	/* *****************************/
		  	/***** 근태관리 CSS 부분 ********/
		  	#today{
			    margin-top: 10px;
			    text-align: center;
			    font-size: 32px;
			}
		  	#time{
		  		margin-top: 10px;
			    text-align: center;
			    font-size: 60px;
		  	}
		  	.home-btn{
		  		width: 150px;
			    height: 70px;
			    margin-left: 23px;
			    margin-top: 20px;
			    border: 1px solid gray;
			    border-radius: 30px 30px 30px 30px;
			    background-color: white;
			    color: #5358e9;
			    font-size: 23px;
			    font-weight: 600;
		  	}
		  	/* *****************************/
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
								<p class="main-title" style="margin-top: 10px;">내 정보</p>
							</div>
							<div>
								<img id="main-user-img" src="../../../resources/img/main/p9s9e9-img.jpg">
							</div>
							<div id="main-user-info">
								<p id="main-user-info-name">${sessionScope.user.userName } ${sessionScope.user.positionName }</p>
								<p id="main-user-info-dept">${sessionScope.user.deptName}</p>
								<p class="main-user-document">결제 진행 문서 <span style="color: red;"><a href="/approval/draftDocuments?progress=진행">5건</a></span></p>
								<p class="main-user-document">결제 완료 문서 <span style="color: red;"><a href="/approval/draftDocuments?progress=완료">4건</a></span></p>
								<p class="main-user-document">결제 반려 문서 <span style="color: red;"><a href="/approval/draftDocuments?progress=반려">4건</a></span></p>
							</div>
						</div>
						<div id="main-project">
							<div>
								<p class="main-title" style="margin-top: 10px;">참여중인 프로젝트</p>
								
							</div>
						</div>
					</div>
			<!-- 메인 센터 -->
					<div id="main-box-center">
						<div id="main-schedule">
							<div>
								<div id='calendar'></div>
							</div>
						</div>
						<div id="main-todo">
							<div>
								<p class="main-title" style="margin-top: 10px;">오늘의 업무</p>
							</div>
						</div>
					</div>
					
			<!-- 메인 오른쪽 -->
					<div id="main-box-right">
						<div id="main-attendance">
							<p class="main-title" style="padding-top: 10px;">근태 관리</p>
							<div id="time-btn">
								<div id="today"></div>
				                <div id="time"></div>
				                <div id="btns">
				                    <input type="button" class="home-btn" onclick="goToWork();" value="출근">
				                    <input type="button" class="home-btn" onclick="goToHome();" value="퇴근">
				                </div>
							</div>
						</div>
						<div id="main-notice">
							<div>
								<p class="main-title" style="margin-top: 10px;">공지사항</p>
								<table class="table table-hover">
									<th>제목</th>
									<th>작성자</th>
									<th>작성날짜</th>
								</table>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	<script>
		// 스케쥴 Script 부분 /////
		var calendarEl = document.getElementById('calendar');
		var calendarOptions = {
	        plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
	        header: {
	            left: 'prev,next,today',
	            center: 'title',
	            right: 'dayGridMonth,timeGridWeek,timeGridDay'
	        },
	        locale : "ko",
	        navLinks: true,
	        selectable: true,
	        selectMirror: true,
	        select: function(arg) {
	        	
	        },
	        editable: true,
	        eventLimit: true,
	        events: [],
	        eventClick: function(event, jsEvent, view) {
	        	
	        }
	    };
		// FullCalendar 인스턴스 초기화
	    var calendar = new FullCalendar.Calendar(calendarEl, calendarOptions);
	    calendar.render();
	    
		// 일정 체크박스 
	    function updateCalendar() {
	        // AJAX 요청 보내기
	        $.ajax({
	            url: "/schedule/events",
	            data: {"userId": "1", "userDeptName":"1", "all":true, "department":false, "personal":false},
	            type: "GET",
	            success: function(events) {
	                // FullCalendar에 이벤트 데이터 설정
	                var calendarEvents = [];
	                for (var i = 0; i < events.length; i++) {
	                  var startDate = new Date(events[i].scheduleStart);
	                  var endDate = new Date(events[i].scheduleEnd);

	                  var year = startDate.getFullYear(); // 년도
	              	  var month = ('0' + (startDate.getMonth() + 1)).slice(-2); // 월 (0부터 시작하므로 1을 더함)
	              	  var day = ('0' + startDate.getDate()).slice(-2); // 일
	              	  startDate = year + '-' + month + '-' + day; // yyyy-mm-dd 형식으로 포맷
	              	  
	              	  var year = endDate.getFullYear(); // 년도
	              	  var month = ('0' + (endDate.getMonth() + 1)).slice(-2); // 월 (0부터 시작하므로 1을 더함)
	              	  var day = ('0' + (endDate.getDate() + 1)).slice(-2); // 일
	                  endDate = year + '-' + month + '-' + day; // yyyy-mm-dd 형식으로 포맷
	                  
	                  var event = {
	                      title: events[i].scheduleName,
	                      start: startDate, // 시작일
	                      end: endDate, // 종료일
	                      color: events[i].scheduleColor, // 색상
	                      no: events[i].scheduleNo
	                      
	                  };
	                  calendarEvents.push(event);
	                }
	                calendar.getEvents().forEach(function(event) {
	                    event.remove();
	                });
	                
	                calendar.addEventSource(calendarEvents);
	                // 이벤트 데이터 다시 가져오기
	                calendar.refetchEvents();
	            },
	            error: function() {
	                // 에러 처리
	                alert('데이터를 가져오는데 실패했습니다.');
	            }
	        });
	    }
	    updateCalendar();
		///////////////////////////////////
		//// 근태 관리 Script ////////////
		const today = new Date();
		const year = today.getFullYear();
		const month = String(today.getMonth() + 1).padStart(2, '0');
		const date = String(today.getDate()).padStart(2, '0');
		const dayList = ['일', '월', '화', '수', '목', '금', '토'];
		const day = dayList[today.getDay()];
		const formattedDate = year+"-"+month+"-"+date+"("+day+")";
		$("#today").html(formattedDate);
		
		const dpTime = function () { 		// 	실시간시간
		const now = new Date()
		let hours = now.getHours()
		let minutes = now.getMinutes()
		let seconds = now.getSeconds()
		let ampm = ''
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
		
		function goToWork() {	// 출근
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
						location.reload();	// 성공하면 페이지 새로고침
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
		function goToHome() {		// 퇴근
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