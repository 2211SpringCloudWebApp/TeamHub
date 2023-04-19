<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>일정 관리2</title>
		<link rel="stylesheet" href="../../../resources/css/schedule/schedule.css">
		<link href='../../../resources/css/schedule/packages/core/main.css' rel='stylesheet' />
		<link href='../../../resources/css/schedule/packages/daygrid/main.css' rel='stylesheet' />
		<link href='../../../resources/css/schedule/packages/timegrid/main.css' rel='stylesheet' />
		<script src='../../../resources/css/schedule/packages/core/main.js'></script>
		<script src='../../../resources/css/schedule/packages/interaction/main.js'></script>
		<script src='../../../resources/css/schedule/packages/daygrid/main.js'></script>
		<script src='../../../resources/css/schedule/packages/timegrid/main.js'></script>
		
		<style type="text/css">
			#calendar {
		    	margin: 30px 70px;
		    	max-width: 100%;
		    	min-height: 500px;
		  	}
		  	.fc-button-primary {
			    color: black;
			    background-color: rgba(60, 114, 221, 0.13);
			    border-color: #b3b1b1;
			}
			.fc-icon-chevron-left:before {
			    content: "<";
			}
						.fc-icon-chevron-right:before {
			    content: ">";
			}
		  	.fc-content, .fc-time{
		  		font-size : 16px;
		  		font-weight: normal !important;
		  	}
		  	#modal.modal-overlay {
		       width: 100%;
		       height: 100%;
		       position: absolute;
		       left: 0;
		       top: 0;
		       display: flex;
		       flex-direction: column;
		       align-items: center;
		       justify-content: center;
		       background: rgba(255, 255, 255, 0.4); 
		       box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
		       border-radius: 10px;
		       border: 1px solid rgba(255, 255, 255, 0.18);
		       z-index: 100;
		       display: none;
		   }
		   #modal .modal-window {
		       background: white;
		       box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
		       backdrop-filter: blur( 13.5px );
		       -webkit-backdrop-filter: blur( 13.5px );
		       border-radius: 10px;
		       border: 1px solid rgba( 255, 255, 255, 0.18 );
		       width: 580px;
		       height: 600px;
		       position: relative;
		       top: -50px;
		       padding: 10px;
		   }
		   #modal .title {
		       padding-left: 230px;
		       display: inline;
		       color: black;
		       
		   }
		   #modal .title h2 {
		       display: inline;
		   }
		   #modal .close-area {
		       display: inline;
		       float: right;
		       padding-right: 10px;
		       cursor: pointer;
		       text-shadow: 1px 1px 2px gray;
		       color: black;
		       font-size: 33px;
		   }
		   #inner{
			   padding-left: 25px;	
		   }
		   #input-main{
		   		margin-top: 30px;
		   }
		   #input-main td{
		   	  padding-bottom: 20px;
		   }
		   #input-main td:first-of-type {
		      padding-right: 40px;
			}
			input[name=scheduleName]{
				width: 303px;
			    height: 28px;
			    padding-left: 5px;
			}
			#input-main span{
			    margin-right: 10px;
			    vertical-align: text-bottom;
			}
			.schedule-color .color-box{
				display: inline-block;
				width: 20px;
				height: 20px;
				margin-right: 5px;
				cursor: pointer;
			}
			#scheduleContent{
				padding: 10px;
			}
		</style>
	</head>
	
	<body>
		<div id="container">
			<!-- 비로그인으로 예약 버튼 클릭시 모달창 띄우기 -->
		    <div id="modal" class="modal-overlay">
		        <div class="modal-window">
					<div class="title">
		                <h2>일정 등록</h2>
		            </div>
		            <div onclick="closeModal()" class="close-area">X</div>
						<div id="inner">
							<div id="input-main">
								<table>
									<tr>
										<td>일정명</td>
										<td><input type="text" name="scheduleName" id="scheduleName"></td>
									</tr>
									<tr>
										<td>색 선택</td>
										<td class="schedule-color">
										   <input type="hidden" id="scheduleColor" name="scheduleColor">
										   <div class="color-box" style="background-color: #FF0000" onclick="getColor(this)"></div>
										   <div class="color-box" style="background-color: #ff893c" onclick="getColor(this)"></div>
										   <div class="color-box" style="background-color: #c1c610" onclick="getColor(this)"></div>
										   <div class="color-box" style="background-color: #85dc1a" onclick="getColor(this)"></div>
										   <div class="color-box" style="background-color: #0000FF" onclick="getColor(this)"></div>
										   <div class="color-box" style="background-color: #45b2ff" onclick="getColor(this)"></div>
										   <div class="color-box" style="background-color: #d469ff" onclick="getColor(this)"></div>
										   <div class="color-box" style="background-color: #fc73a4" onclick="getColor(this)"></div>
										</td>
									</tr>
									<tr>
										<td>일시</td>
										<td><input type="datetime-local" name="scheduleStart" id="startTime">
										     ~ 
										    <input type="datetime-local" name="scheduleEnd" id="endTime">
										</td>
									</tr>
									<tr>
										<td>일정구분</td>
										<td><input type="radio" name="scheduleKind" value="전사"> <span>전사일정</span>
										    <input type="radio" name="scheduleKind" value="부서"> <span>부서일정</span> 
										    <input type="radio" name="scheduleKind" value="개인" checked> <span>개인일정</span>  
										</td>
									</tr>
									<tr>
										<td>내용</td>
										<td><textarea rows="10" cols="40" name="scheduleContent" id="scheduleContent"></textarea> </td>
									</tr>
									<tr>
										<td>알림여부</td>
										<td><input type="checkbox" name="scheduleAlram" id="scheduleAlram"><span style="vertical-align: text-bottom; margin-left: 10px;">일정 전날 알림</span></td>
									</tr>
								</table>
							</div>
							
							<div id="input-btn">
								<button type="submit" class="modal-input" onclick="scheduleAdd();">
									<span>등록</span>
								</button>
								<button type="button" class="modal-input" >
									<span>닫기</span>
								</button>
							</div>
						</div>
				</div>
		    </div>
		    <!-- ------------------------------------------------>
			<jsp:include page="../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
				<h1>일정관리</h1>
				<button class="scheduleAddBtn">일정등록</button>
				<h3>내 캘린더</h3>
				<ul>
				    <li><input type="checkbox" id ="enterSche" name="enterSche" value="enterSche">전사일정</li>
				    <li><input type="checkbox" id ="deptSche" name="deptSche" value="deptSche">부서일정</li>
				    <li><input type="checkbox" id ="userSche" name="userSche" value="userSche">개인일정</li>
				</ul> 
			</div>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
				<div id='calendar'></div>
			</main>
		</div>
		
		
<script>

  document.addEventListener('DOMContentLoaded', function() {
	
    var modal = document.querySelector("#modal");
    modal.style.display = "none";
	var calendarEl = document.getElementById('calendar');
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
      header: {
        left: 'prev,next,today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      
      locale : "ko",
      defaultDate: '2020-02-12', // 디폴트 날짜, 지우면 현재 날짜로 보여줌.
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {
    	const modal = document.querySelector("#modal");
    	var localOffset = (arg.start).getTimezoneOffset() * 60000; // 분을 밀리초로 변환
   		var localDate = new Date(arg.start - localOffset);
    	
    	$("#startTime").val(localDate.toISOString().slice(0,16));
    	$("#endTime").val((arg.end).toISOString().slice(0,16));
    	
        openModal();
        var title = prompt('Event Title:');
//         console.log(title);
//         if (title) {
//           calendar.addEvent({
//             title: title,
//             start: arg.start,
//             end: arg.end,
//             allDay: arg.allDay
//           })
// 			 종류, 부서코드, 일정명, 시작날짜, 종료날짜, 선택색상, 내용, 알림여부
//           $.ajax({
//             일정등록
//           })
//         }
        calendar.unselect()
      },
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: []
    	  
    });
    var calendarEvents = [
    	{
         title: 'All Day Event',
         start: '2020-02-01',
         end: '2020-02-02',
         color : "#FF0000"  // 빨강
        }
    ];
    calendar.setOption('events', calendarEvents);
    calendar.render();
  });
  
  
  function openModal(start, end, allDay){
	  document.querySelector("body").style.overflow="hidden";
	  window.scrollTo(0,0);
      modal.style.display = "flex"
  }
  function closeModal(){
	  document.querySelector("body").style.overflow="visible";
      modal.style.display = "none"
  }
  // 일정 - 색 선택
  function getColor(element) {
	  var colorBox = $(".color-box");
	  for (var i = 0; i < colorBox.length; i++) {
 		colorBox[i].style.transform= "scale(1.0)";
	}
	  element.style.transform= "scale(1.5)";   // 색 선택시 스케일 1.5배 키워 구별시키기.
	  scheduleColor = element.style.backgroundColor;  
	  $("#scheduleColor").val(scheduleColor);   // 선택한 색상의 rgb값을 input태그의 hidden값으로 넣어주기.
  }
  // 일정 등록
  function scheduleAdd(){
	  var userId = "${user.userId }";
	  var userDeptName = "${user.deptName}";
	  
	  if($("#scheduleAlram").is(":checked")){
		  $("#scheduleAlram").val("y");
	  } else{
		  $("#scheduleAlram").val("n");
	  }
	  /* 일정 데이터 담기*/
	  var scheduleName = $("#scheduleName").val();
	  var scheduleColor = $("#scheduleColor").val();
	  var scheduleStartTime = new Date($("#startTime").val());
	  var scheduleEndTime = new Date($("#endTime").val());
	  var scheduleKind = $("input[name='scheduleKind']:checked").val();
	  var scheduleContent = $("#scheduleContent").val();
	  var scheduleAlram = $("#scheduleAlram").val();
	  
	  /* 유효성검사하기 */
	  var scheduleNameCheck = true;
	  var scheduleColorCheck = true;
	  var scheduleStartTimeCheck = true;
	  var scheduleEndTimeCheck = true;
	  var scheduleContentCheck = true;
	  if($("#scheduleName").val() == ''){
		  alert("일정명을 입력해주세요.")
		  scheduleNameCheck = false;
	  } else if($("#scheduleColor").val() == ''){
		  alert("색상을 선택해주세요.")
		  scheduleColorCheck = false;
	  } else if(($("#startTime").val() == '') || ($("#endTime").val() == '')){
		  alert("날짜를 입력해주세요.");
		  scheduleStartTimeCheck = false;
	  }	else if($("#startTime").val() > $("#endTime").val()){
		  alert("시작날짜는 종료날짜보다 이전이어야 합니다.");
		  scheduleStartTimeCheck = false;
	  } else if($("#scheduleContent").val() == ''){
		  alert("내용을 입력해주세요.")
		  scheduleContentCheck = false;
	  }
	  
	  if(scheduleName && scheduleColor && scheduleStartTime && scheduleEndTime && scheduleContent){
		  $.ajax({
			 url : "/schedule/add",
			 data : {
				 "scheduleName": scheduleName,
				 "scheduleColor": scheduleColor,
				 "scheduleStart": scheduleStartTime,
				 "scheduleEnd": scheduleEndTime,
				 "scheduleKind": scheduleKind,
				 "scheduleContent":scheduleContent,
				 "scheduleAlram":scheduleAlram,
				 "userId": userId,
				 "deptCode": userDeptName
				    },
			 type : "post",
			 success : function(data){
// 				 이벤트 데이터를 받아와서 events 배열에 추가
			     $('#calendar').fullCalendar('addEventSource', data);  
			 },
			 error : function(){
				 alert("일정 등록 실패! 관리자 문의 요망");
			 }
		 })
	  } 
  }
  
 	// 일정 데이터를 가져와서 fullCalendar의 events 배열 추가해주기.
  	 function updateCalendar() {
        // 체크박스의 체크 상태를 가져옴
	    var checkboxAll = $("#enterSche");
	    var checkboxDepartment = $("#deptSche");
	    var checkboxPersonal = $("#userSche");
	    var userId = "${user.userId }";
		var userDeptName = "${user.deptName}";
		var all = false;
		var department = false;
		var personal = false;
		
	    if (checkboxAll.prop("checked")) {
	      all = true;
	    }
	    if (checkboxDepartment.prop("checked")) {
	      department = true;
	    }
	    if (checkboxPersonal.prop("checked")) {
	      personal = true;
	    }
	    // AJAX 요청 보내기
	    $.ajax({
	      url: "/schedule/events",
	      data: {"userId": userId, "userDeptName":userDeptName, "all":all, "department":department, "personal":personal}, 
	      type: "GET",
	      success: function(events) {
	    	console.log(events);
	    	calendarOptions.events = events; // 서버에서 받아온 데이터(events)를 FullCalendar에 설정
            $('#calendar').fullCalendar('removeEvents'); // 기존의 일정 이벤트 모두 제거
            $('#calendar').fullCalendar('addEventSource', events); // 새로운 일정 이벤트 추가
            $('#calendar').fullCalendar('refetchEvents'); // 일정 이벤트 다시 가져오기
	      },
	      error: function() {
	        // 에러 처리
	        alert('데이터를 가져오는데 실패했습니다.');
	      }
	    });
	  }
  	  // 체크박스의 변경 이벤트 리스너 등록
  	  document.getElementById('enterSche').addEventListener('change', updateCalendar);
  	  document.getElementById('deptSche').addEventListener('change', updateCalendar);
  	  document.getElementById('userSche').addEventListener('change', updateCalendar);

  	  // 초기 FullCalendar 인스턴스 생성
  	  $('#calendar').fullCalendar(calendarOptions);
  
</script>
		
		
	</body>
</html>