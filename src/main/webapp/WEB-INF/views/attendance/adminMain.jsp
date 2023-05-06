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
        #sideBar li:nth-child(3){
		    background-color: #2653e8ba;
  				
		}
		#sideBar li:nth-child(3) a{
			color: white !important;
		}
    </style>
    
	</head>
	
	<body>
	<input type="hidden" id="userId" value="${sessionScope.user.userId }">
		<div id="container">
			<jsp:include page="../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
				<h2>근태관리</h2>
				<h4><a href="/attendance/mainView">근태관리</a></h4>
				<h4><a href="/vacation/mainView">연차관리</a></h4>
				<c:if test="${sessionScope.user.userType == 1 }">
					<h4><a href="/attendance/adminView">관리자</a></h4>
				</c:if>
			</div>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
			<div id="main-container">
	            <div id="main-top">
	                <div id="time-btn">
	                <div id="time"></div>
	                <div id="btns">
<!-- 	                    <input type="button" class="home-btn" onclick="goToWork();" value="출근"> -->
<!-- 	                    <input type="button" class="home-btn" onclick="goToHome();" value="퇴근"> -->
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
            
                <div id="document_wrap">
		        <div id="content_box">
		            <form action="/admin/searchUser" method="get">
		                이름 : 
		                <input type="text" name="searchValue" value="${keyword }"placeholder="검색">
		                <input type="submit" id="search-btn" name="search-btn"value="검색">
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
                            <th>이름</th>
                            <th>날짜</th>
                            <th>출근시간</th>
                            <th>퇴근시간</th>
                            <th>근무시간</th>
                            <th>근무상태</th>
                        </tr>
                      </thead>
                        <tbody>
	                        <c:forEach items="${uList }" var="attendance">
	                            <tr>
	                                <td>${attendance.userName}</td>
	                                <td>${attendance.atteDate}</td>
	                                <td>${attendance.startTime}</td>
	                                <td>${attendance.finishTime}</td>
	                                <td>${attendance.totalWorkHour}</td>
	                                <td>${attendance.atteStatus}</td>
	                            </tr>
	                        </c:forEach>
	                    </tbody>
	                    
                        <tfoot>
                              <tr align="center">
                                  <td colspan="6">
                                      <c:if test="${pi.currentPage > 1 }">
										<a href="/attendance/adminView?status=${status }&page=1"> &#10094;&#10094; </a>&nbsp;&nbsp;
									</c:if>
									<c:if test="${pi.currentPage > 1 }">
										<a href="/attendance/adminView?status=${status }&page=${pi.currentPage -1 }"> &#10094; </a>
									</c:if>
									&nbsp;&nbsp;&nbsp;
									<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="page">
										<c:url var="pageUrl" value="/attendance/adminView">
											<c:param name="page" value="${page }" />
											<c:param name="status" value="${status }" />
										</c:url>
										<a href="${pageUrl }">${page }</a>&nbsp;&nbsp;&nbsp;&nbsp;
									</c:forEach>
									<c:if test="${pi.currentPage < pi.maxPage }">
										<a href="/attendance/adminView?status=${status }&page=${pi.currentPage +1}"> &#10095; </a>&nbsp;&nbsp;
									</c:if>
									<c:if test="${pi.currentPage < pi.maxPage }">
										<a href="/attendance/adminView?status=${status }&page=${pi.maxPage }"> &#10095;&#10095; </a>
									</c:if>
                                  </td>
                              </tr>
                            </tfoot>
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
							location.reload(); 	// 성공하면 페이지 새로고침
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
               	
               	  
               	  
               	  
            </script>
	</body>
	
</html>