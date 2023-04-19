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
            
     <style type="text/css">
        table.ui-datepicker-calendar { display: none; }

    </style>
    
	</head>
	
	<body>
	<input type="hidden" id="userId" value="${sessionScope.user.userId }">
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
	                                <td id="total-late">${result }</td> <!--지각 -->
	                                <td id="total-early">${result2 }</td> <!--조퇴 -->
	                                <td id="total-work">${result3 }</td> <!--출근 -->
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>
	            </div>
            <div id="select">
            
			<!-- datepicker 검색 -->
                <div id="document_wrap">
		        <div id="content_box">
		            <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
		            <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		            <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
		 
		            <script>
		                $(document).ready(function () {
		                    $.datepicker.regional['ko'] = {
		                        closeText: '닫기',
		                        prevText: '이전달',
		                        nextText: '다음달',
		                        currentText: '오늘',
		                        monthNames: ['1월(JAN)', '2월(FEB)', '3월(MAR)', '4월(APR)', '5월(MAY)', '6월(JUN)',
		                            '7월(JUL)', '8월(AUG)', '9월(SEP)', '10월(OCT)', '11월(NOV)', '12월(DEC)'],
		                        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월',
		                            '7월', '8월', '9월', '10월', '11월', '12월'],
		                        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		                        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		                        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		                        weekHeader: 'Wk',
		                        dateFormat: 'yy-mm-dd',
		                        firstDay: 0,
		                        isRTL: false,
		                        showMonthAfterYear: true,
		                        yearSuffix: '',
		                        showOn: 'both',
		                        buttonText: "검색",
		                        changeMonth: true,
		                        changeYear: true,
		                        showButtonPanel: true,
		                        yearRange: 'c-99:c+99',
		                    };
		                    $.datepicker.setDefaults($.datepicker.regional['ko']);
		 
		                    var datepicker_default = {
		                        showOn: 'both',
		                        buttonText: "검색",
		                        currentText: "이번달",
		                        changeMonth: true,
		                        changeYear: true,
		                        showButtonPanel: true,
		                        yearRange: 'c-99:c+99',
		                        showOtherMonths: true,
		                        selectOtherMonths: true
		                    }
		 
		                    datepicker_default.closeText = "선택";
		                    datepicker_default.dateFormat = "yy/mm";
		                    datepicker_default.onClose = function (dateText, inst) {
		                        var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
		                        var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
		                        $(this).datepicker("option", "defaultDate", new Date(year, month, 1));
		                        $(this).datepicker('setDate', new Date(year, month, 1));
		
		                        month = (parseInt(month, 10) + 1);
		                        
		                        console.log("선택된 년도: " + year);
		                         // 선택된 월 값을 1 증가시켜서 출력
		                        console.log("선택된 월: " + month);
		                         dateChange();
		                    }
		 
		                    datepicker_default.beforeShow = function () {
		                        var selectDate = $("#sdate").val().split("-");
		                        var year = Number(selectDate[0]);
		                        var month = Number(selectDate[1]) - 1;
		                        $(this).datepicker("option", "defaultDate", new Date(year, month, 1));
		                    }
		                    $("#sdate").datepicker(datepicker_default);
		                });
		
		                
		            </script>
		 
		 
		            <form name="frmEX">
		                검색일 : 
		                <input type="text" name="sdate" id="sdate" size="15" maxlength="15" onchange="dateChange();" />
		                <br />
		            </form>
		        </div>
    </div>
            </div>
		<!-- 출퇴근 리스트 -->
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
	                        <c:forEach items="${aList }" var="attendance">
	                            <tr>
	                                <td>${attendance.atteDate}</td>
	                                <td>${attendance.startTime}</td>
	                                <td>${attendance.finishTime}</td>
	                                <td>${attendance.totalWorkHour}</td>
	                                <td>${attendance.atteStatus}</td>
	                            </tr>
	                        </c:forEach>
	                    </tbody>
                        
                    </thead>
                </table>
            </div>
        </div>
			</main>
		</div>
		
		<script>
			const dpTime = function () { 		// 	실시간시간
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
                
                
               $(function() {
              	  $("#sdate").datepicker({
              	    onSelect: function(dateText, inst) {
              	      console.log("Selected date: " + dateText);
              	      // 선택된 날짜에 대한 추가 작업을 수행합니다.
              	      dateChange();
              	    }
              	  });
              	});

               	function dateChange(){
               	  $.ajax ({
               	    url : '/ajaxGetMonthByAtten',
               	    data : {
               	      "date": $("#sdate").val(),
               	      "userId" : $("#userId").val()
               	    },
               	    type : 'post',
//                	    dataType:'json',
               	    success : function(data){
               	      //console.log(JSON.parse(data));
               	      console.log(data);
//                	      tbody에td비우고 data 만큼 나오게해줘야됨
// 						for문돌려, 그리고 그만큼 뿌려
						const tableBody = $("#board-table tbody");
						tableBody.html("");
						let tr;
                        let aDate;
                        let aStart;
                        let aFinish;
                        let aTotal;
                        let aStatus;
                        if(data.length > 0) {
                        	for(let i in data) {
                        		tr = $("<tr>");
                        		aDate = $("<td>").text(data[i].atteDate);
                        		aStart = $("<td>").text(data[i].startTime);
                        		aFinish = $("<td>").text(data[i].finishTime);
                        		aTotal = $("<td>").text(data[i].totalWorkHour);
                        		aStatus = $("<td>").text(data[i].atteStatus);
                        		tr.append(aDate);
                        		tr.append(aStart);
                        		tr.append(aFinish);
                        		tr.append(aTotal);
                        		tr.append(aStatus);
                        		tableBody.append(tr);
                        	}
                        }
               	      
               	    },
               	    error : function(data) {
               	      
               	    }
               	  })
               	  $.ajax ({
               		  url : '/ajaxGetListByAtten',
               		  data : {
               			  "date" : $("#sdate").val(),
               			  "userId" : $("#userId").val()
               		  },
               		  type : 'post',
               		  dataType: 'json',
               		  success : function(data) {
               			  // 통계 테이블(total-table)의 td 에 datePicker로 선택한 월의 값들(ex) 지각=2) 넣어줌
               			$("#total-late").text(data.late);
               			$("#total-early").text(data.leaveEarly);
               			$("#total-work").text(data.goToWork);
               			  
               		  },
               		  error : function(data) {
               			  
               		  }
               		  
               		  })
               	  }
               	
               	  
               	  
               	  
//                 function dateChange(){
//                 	console.log("dd");
//                 	$.ajax ({
//                 		url : '/ajaxGetMonthByAtten',
//                 		data : {
//                 			"date": $("#sdate").val(),
//                 			"userId" : $("#userId").val()
//                 		},
//                 		type : 'post',
//                 		success : function(data){
                			
//                 		},
//                 		error : function(data) {
                			
//                 		}
//                 	})
                	
//                 }
            </script>
	</body>
	
</html>