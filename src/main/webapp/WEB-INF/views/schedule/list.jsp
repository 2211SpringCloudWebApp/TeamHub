<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>일정 관리</title>
		<link rel="stylesheet" href="../../../resources/css/schedule/schedule.css">
		<link href='../../../resources/css/schedule/packages/core/main.css' rel='stylesheet' />
		<link href='../../../resources/css/schedule/packages/daygrid/main.css' rel='stylesheet' />
		<link href='../../../resources/css/schedule/packages/timegrid/main.css' rel='stylesheet' />
		<script src='../../../resources/css/schedule/packages/core/main.js'></script>
		<script src='../../../resources/css/schedule/packages/interaction/main.js'></script>
		<script src='../../../resources/css/schedule/packages/daygrid/main.js'></script>
		<script src='../../../resources/css/schedule/packages/timegrid/main.js'></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
		
		<style type="text/css">
			#calendar {
 		    	margin: 30px auto; 
 		    	width: 55vw;
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
			.fc-ltr .fc-dayGrid-view .fc-day-top .fc-day-number {
			    float: left;
			    font-size: 18px;
			}
			.fc th{
				text-align: left;
				font-size: 18px;
			}
			.fc-sun{
				color: red;
			}
			.fc-icon-x:before {
			    content: "X";
			}
			#input-btn{
				margin-top: 20px;
			}
			
			#input-btn button{
				float: right;
				width: 52px;
    			height: 30px;
    			margin-right: 20px;
   				border: 1px solid #b3b1b1;
			    font-size: 18px;
			    background-color: #0060ff;
			    color: white;
			}
			#input-btn a{
				color: red;
			    text-decoration-line: underline;
			    font-size: 18px;
			    text-underline-offset: 5px;
			}
		</style>
	</head>
	
	<body>
		<div id="container">
			<!-- 비로그인으로 예약 버튼 클릭시 모달창 띄우기 -->
		    <div id="modal" class="modal-overlay">
		        <div class="modal-window">
					<div class="title">
		                <h2></h2>
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
										<td>
											<c:if test="${sessionScope.user.userType == 1}">
												<input type="radio" name="scheduleKind" value="전사"> <span>전사일정</span>
											</c:if>
											<c:if test="${sessionScope.user.userType == 0}">
											    <input type="radio" name="scheduleKind" value="부서"> <span>부서일정</span> 
											    <input type="radio" name="scheduleKind" value="개인" checked> <span>개인일정</span>  
										    </c:if>
										</td>
									</tr>
									<tr>
										<td>내용</td>
										<td><textarea rows="10" cols="50" name="scheduleContent" id="scheduleContent" style="resize: none;"></textarea> </td>
									</tr>
									<tr>
										<td>알림여부</td>
										<td><input type="checkbox" name="scheduleAlram" id="scheduleAlram"><span style="vertical-align: text-bottom; margin-left: 10px;">일정 전날 알림</span></td>
									</tr>
								</table>
							</div>
							
							<div id="input-btn">
								<a id="scheduleDeleteA" href="#" onclick="scheduleDelete();">일정 삭제</a>	
								<button type="button" class="modal-input" onclick="closeModal();">
									<span>닫기</span>
								</button>
								<button type="button" class="modal-input" id="scheduleAdd" onclick="scheduleAdd();">
									<span>등록</span>
								</button>
								<button type="button" class="modal-input" id="scheduleModify" onclick="scheduleMoidfy();">
									<span>수정</span>
								</button>
							</div>
						</div>
						<input type="hidden" id="scheduleNo" value="">
				</div>
		    </div>
		    <!-- ------------------------------------------------>
			<jsp:include page="../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
				<h1>일정관리</h1>
				<button class="scheduleAddBtn" onclick="openModal('일정 등록');">일정등록</button>
				<h3>내 캘린더</h3>
				<ul>
				    <li><input type="checkbox" id ="enterSche" name="enterSche" value="enterSche" checked="checked">전사일정</li>
				    <li><input type="checkbox" id ="deptSche" name="deptSche" value="deptSche" checked="checked">부서일정</li>
				    <li><input type="checkbox" id ="userSche" name="userSche" value="userSche" checked="checked">개인일정</li>
				</ul> 
			</div>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
				<div id='calendar'></div>
			</main>
		</div>
		
		
<script>
	
    var modal = document.querySelector("#modal");
    modal.style.display = "none";
    var calendarEl = document.getElementById('calendar');

    // calendarOptions 객체 정의
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
            const modal = document.querySelector("#modal");
            var localOffset = (arg.start).getTimezoneOffset() * 60000;
            var localDate = new Date(arg.start - localOffset);
            $("#startTime").val(localDate.toISOString().slice(0,16));
            $("#endTime").val((arg.end).toISOString().slice(0,16));
			
            console.log("select 원래 날짜: " + localDate)
            console.log("select 수정 날짜: " + localDate.toISOString().slice(0,16))
            
            openModal("일정 등록");
        },
        editable: true,
        eventLimit: true,
        events: [],
        eventClick: function(event, jsEvent, view) {
            console.log(event);
            console.log("title : " + event.event._def.title);
            console.log("startTime : " + (event.event._instance.range.start));
            console.log("endTime : " + (event.event._instance.range.end));
            console.log("no : " + event.event._def.extendedProps.no);
            
            
            
            openModal("일정 상세", event.event._def.extendedProps.no);
        }
    };

    // FullCalendar 인스턴스 초기화
    var calendar = new FullCalendar.Calendar(calendarEl, calendarOptions);
    calendar.render();
	
	// 일정 체크박스 
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

    // 체크박스의 변경 이벤트 리스너 등록
    document.getElementById('enterSche').addEventListener('change', updateCalendar);
    document.getElementById('deptSche').addEventListener('change', updateCalendar);
    document.getElementById('userSche').addEventListener('change', updateCalendar);

    updateCalendar();
    
 	
  
  function openModal(data, no){
	  document.querySelector("body").style.overflow="hidden";
	  window.scrollTo(0,0);
      modal.style.display = "flex"
      
      $(".title h2").text(data);
      if(data=="일정 등록"){
    	  console.log(data);
    	  $("#scheduleName").val(" ");
		  $("#scheduleColor").val(" ");
		  $("#startTime").val("");
		  $("#endTime").val("");
		  $("#scheduleContent").val(" ");
    	  $("#scheduleNo").val("");
		  
    	  $("#scheduleDeleteA").hide();
    	  $("#scheduleModify").hide();
    	  $("#scheduleAdd").show();
      }
      if(data=="일정 상세"){
    	  console.log(data);
    	  $.ajax({
    		  url : "/schedule/detail",
    		  data : {"scheduleNo":no},
    		  type : "post",
    		  success : function(data){
    			  // 스케쥴 객체 modal에 넣어주기.
    			  $("#scheduleNo").val(data.scheduleNo);
    			  $("#scheduleName").val(data.scheduleName);
				  $("#scheduleColor").val(data.scheduleColor);
				  $("#scheduleContent").val(data.scheduleContent);
				  var startDate = moment(data.scheduleStart,"MMM DD, YYYY, hh:mm:ss A").format("YYYY-MM-DDTHH:mm:ss");
				  var endDate = moment(data.scheduleEnd,"MMM DD, YYYY, hh:mm:ss A").format("YYYY-MM-DDTHH:mm:ss");
                  $("#startTime").val(startDate);
				  $("#endTime").val(endDate);
    		  },
    		  error : function(){
    			  alert("일정 정보 조회 실패! 관리자 문의 요망");
    		  }
    		  
    	  });
    	  $("#scheduleDeleteA").show();
    	  $("#scheduleModify").show();
    	  $("#scheduleAdd").hide();
      }
      
	  
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
  
  // "일정 등록"
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
				 closeModal();
				 updateCalendar();
			 },
			 error : function(){
				 alert("일정 등록 실패! 관리자 문의 요망");
			 }
		 })
	  } 
  }
  
  // 일정 수정하기.
  function scheduleMoidfy(){
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
	  
	  var scheduleNo = $("#scheduleNo").val();
	  
	  if(scheduleName && scheduleColor && scheduleStartTime && scheduleEndTime && scheduleContent){
		  $.ajax({
			 url : "/schedule/modify",
			 data : {
				 "scheduleNo": scheduleNo,
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
				 closeModal();
				 updateCalendar();
			 },
			 error : function(){
	
			 }
		 })
	 }
  }
  
  function scheduleDelete(){
	  var scheduleNo = $("#scheduleNo").val();
	  $.ajax({
		 url : "/schedule/delete",
		 data : {"scheduleNo": scheduleNo},
		 type : "post",
		 success : function(data){
			 closeModal();
			 updateCalendar(); 
		 },
		 error : function(){

		 }
	 })
  }  

  
</script>
		
		
	</body>
</html>