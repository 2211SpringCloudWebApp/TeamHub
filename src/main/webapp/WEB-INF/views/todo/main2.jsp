<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>업무관리</title>
		<link rel="stylesheet" href="../../../resources/css/todo/todo2.css">
		<style type="text/css">
			#sideBar li:nth-child(5){
			    background-color: #2653e8ba;
   				
			}
			#sideBar li:nth-child(5) a{
				color: white !important;
			}
		</style>
		<script src='../../../resources/css/todo/fullcalendar-6.1.5/dist/index.global.js'></script>
		<style>
		
		  body {
		    margin: 20px 0 0 20px;
/* 		    font-size: 14px; */
		    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
		  }
		
		  #source-calendar,
		  #destination-calendar {
		    float: left;
		    width: 600px;
		    margin: 0 20px 20px 0;
		  }
			
		  .fc-icon-chevron-left:before {
			content: "<";
		  }
		  .fc-icon-chevron-right:before {
		    content: ">";
		  }
		
		</style>
	</head>
	
	<body>
	<input type="hidden" id="userId" value="${sessionScope.user.userId }">
		<div id="container">
			<jsp:include page="../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
				<h2>업무관리</h2>
				<h4><a href="#">할 일/메모 목록</a></h4>
			</div>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
				<div id="main-container">
                    <div id="main-top">
                        <div id="today">
                            <div id="today-title">
                                <h3 id="todayH3">Today</h3> 
                            </div>
                            <div id="today-list">
                                <h2>할 일 목록</h2>
                                <span></span><br>
                                <input type="text" id="todo">
                                <input type="hidden" id="todoCreateDate" value="">
                                <button id="add-button" onclick="insertTodo();">+</button>
                                <div id="todo-list">
                                <c:forEach items="${tList }" var="todo">
                                	<div class="item">
                                	<!-- isFinished가 'Y'면 체크박스 체크되어있게 -->
								        <input class="checkInput" type="checkbox" onclick="checkFinish(this,'${todo.todoNo}');" 
								            <c:if test="${todo.isFinished == 'Y'}">
								                checked
								            </c:if>
								        >
								        <!-- isFinished가 'Y'면 글자에 줄 그어지게 -->
								        <span <c:if test="${todo.isFinished == 'Y'}">style="text-decoration: line-through;"</c:if>>
								            ${todo.todoContent}
								        </span>
										<!-- 버튼 id를 todoNo로 줘서 삭제한 div를 선택할수 있도록 함 -->
								        <button id="${todo.todoNo }" onclick="deleteTodo('${todo.todoNo}');">제거하기</button>
								    </div>
                                </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div id="month">
                                <h3>Month</h3>
                            <div id="calendar">
                            </div>
                        </div>
                    </div>
                    <div id="main-bottom">
                        <div id="memo-title">
                            <h3>Memo</h3>
                            <button id="memo-btn1" onclick="insertMemo();">+</button>
                        </div>
                        
                        <div id="memo">
                            <c:forEach items="${mList }" var="memo">
                            	<div class="memo-note">
                            	<input type="hidden" value="${memo.memoNo }" id="memoNo">
                            	<button class="memo-btn2" onclick="deleteMemo(this);">X</button>
							    <button class="memo-btn2" onclick="saveMemo(this);">✓</button>
							    <div contenteditable id="memo-content">${memo.memoContent }</div>
                            	</div>
                            </c:forEach>
                        </div>
                    </div>
                    
                <input type="hidden" id="formattedDate">
                
                </div>
			</main>
		</div>
		
		<script>

			// '+' 버튼 눌렀을때 메모장 생성
			function insertMemo() {
			  $("#memo").append(
			    '<div class="memo-note">' +
			    '<button class="memo-btn2" onclick="deleteMemo(this);">X</button>' +
			    '<button class="memo-btn2" onclick="saveMemo(this);">✓</button>' +
			    '<div contenteditable id="memo-content"></div>' +
			    '</div>'
			  );
			}
			
			// '✓' 버튼 눌렀을때 메모내용 저장
			function saveMemo(button) {
				// ("#memo-content").html() -> 줄바꿈까지 저장하려고
				// ("#memo-content").text() -> 줄바꿈 저장안됨
				// trim() : 앞뒤 공백을 제거
				  var memoContent = $(button).siblings("#memo-content").html().trim();
				  if (memoContent.length === 0) {
					alert("내용을 입력해주세요~");
				    return;
				  }
				  console.log(memoContent);
// 			  var memoData = {
// 					    "userId": $("#userId").val(),
// 					    "memoContent": memoContent
// 					  };

			  
			  $.ajax({
				    type: "POST",
				    url: "/ajaxInsertMemo",
				    data: {
				    	"userId": $("#userId").val(),
					    "memoContent": memoContent
				    },
				    success: function(result) {
				    },
				    error: function(xhr, status, error) {
				    	
				    }
				  });
				}
			
			function deleteMemo(button) {
				// closest : 현재 선택한 요소를 포함하여 가장 가까운 상위 요소를 선택
				  var memoNote = $(button).closest(".memo-note");
				  var memoNo = $(button).siblings("#memoNo").val();

				  if (confirm("정말로 삭제하시겠습니까?")) {
				    $.ajax({
				      type: 'post',
				      url: '/ajaxDeleteMemo',
				      data: {
				        "memoNo": memoNo
				      },
				      success: function (data) {
				        memoNote.remove();
				      },
				      error: function (data) {
				        memoNote.show();
				      }
				    });
				  } else {
				    memoNote.show();
				  }
				}
			
		
			// 달력
		    var calendarEl = document.getElementById('calendar');
		
		    var calendarOptions = {
// 	    		  navLinks: true, // can click day/week names to navigate views
			      selectable: true, // 새로운 이벤트를 선택할 수 있도록 허용
// 			      selectMirror: true,
			      locale: 'ko',	// 한국어 설정
			      select: function(arg) {
			    	// 달력에서 선택한 날짜 구하기
					const dateString = JSON.stringify(arg.startStr); // 받아온 문자열을 JSON 형식으로 변환
					const dateObj = new Date(dateString); // Date 객체 생성
					const year = dateObj.getFullYear().toString().substring(2); // 년도의 뒤 두 자리만 추출
					const month = (dateObj.getMonth() + 1).toString().padStart(2, "0"); // 월(4월이면 4 말고 04 이렇게되게)
					const day = dateObj.getDate().toString().padStart(2, "0"); // 일
					let formattedDate = '';
					formattedDate = year + '/' +month + '/' +day;
					// 밑에랑 똑같음, #formattedDate의 val을 내가 선택한 날짜로 하는거
					$("#formattedDate").val(formattedDate);
					
					// 'Today' 여기가 내가선택한 날짜로나오게
					$("#todayH3").html(formattedDate);
					
					// #todoCreateDate의 val을 내가 선택한 날짜로
					// <input type="hidden" id="todoCreateDate" value="23/04/26"> 4/26 선택하면 이렇게됨
					// <input type="hidden" id="todoCreateDate" value="23/04/25"> 4/25 선택하면 이렇게됨
					$("#todoCreateDate").val(formattedDate);
					// 달력에서 선택한 날짜의 리스트 가져오기
			    	  $.ajax({ 
			    		  url: '/ajaxSelectDay',
			    		  data: {
			    		    "date": formattedDate
			    		  },
			    		  type: 'post',
			    		  dataType: 'json',
			    		  success: function(data) {
			    		    // 성공 시 처리할 코드
			    		    const todoList = $("#todo-list");
			    		    todoList.html("");
			    		    for (let i = 0; i < data.length; i++) {
			    		    	  var todo = data[i];
			    		    	  const isChecked = todo.isFinished === 'Y' ? 'checked' : ''; // 체크 여부에 따른 checked 속성 추가
			    		    	  console.log(todo.todoNo);
			    		    	  var itemHTML = '<div class="item">';
			    		    	        if(todo.isFinished == 'Y') {
				    		    	        itemHTML+= '<input class="checkInput" type="checkbox" onclick="checkFinish(this, '+todo.todoNo+');" checked>';
				    		    	        itemHTML+=  '<span style="text-decoration: line-through;">'+todo.todoContent+'</span>';
			    		    	        }else {
				    		    	        itemHTML+= '<input class="checkInput" type="checkbox" onclick="checkFinish(this, '+todo.todoNo+');">';
				    		    	        itemHTML+=  '<span style="text-decoration: none;">'+todo.todoContent+'</span>';
			    		    	        }
			    		    	        itemHTML+=    '<button id="'+todo.todoNo+'" onclick="deleteTodo('+todo.todoNo+');">제거하기</button></div>';
			    		    	     
			    		    	  todoList.append(itemHTML); 
			    		    }
			    		  },
			    		  error: function(data) {
			    		    // 오류 시 처리할 코드
			    		  }
			    		});
			      },
// 			      eventClick: function(arg) {
// 			        if (confirm('삭제할까요?')) {
// 			          arg.event.remove()
// 			        }
// 			      },
// 			      editable: true,
			      dayMaxEvents: true, // 하루에 표시할 수 있는 이벤트 수를 제한하고, 이를 초과하는 경우 "더보기" 링크를 제공
			      events: []
		    }
		    // 달력만들기
		    var calendar = new FullCalendar.Calendar(calendarEl, calendarOptions);
		    calendar.render();
		    
		    
		    // events 옵션추가
		    // 로그인한 아이디의 할일 리스트를 달력에 보여주기
		    function calendarEvents() {
		    	var userId = "${user.userId}"
		    	$.ajax({
		    		url : '/ajaxCalendarEvents',
		    		data : {
		    			"userId" : userId
		    		},
		    		type : 'post',
		    		success : function(events){
		    			var calendarEvents = [];
		                for (var i = 0; i < events.length; i++) {
		                	
		                  var startDate = new Date(events[i].todoCreateDate);
		                  var endDate = new Date(events[i].todoCreateDate);

		                  var year = startDate.getFullYear(); // 년도
		              	  var month = ('0' + (startDate.getMonth() + 1)).slice(-2); // 월 (0부터 시작하므로 1을 더함)
		              	  var day = ('0' + startDate.getDate()).slice(-2); // 일
		              	  startDate = year + '-' + month + '-' + day; // yyyy-mm-dd 형식으로 포맷
		              	  
		              	  var year = endDate.getFullYear(); // 년도
		              	  var month = ('0' + (endDate.getMonth() + 1)).slice(-2); // 월 (0부터 시작하므로 1을 더함)
		              	  var day = ('0' + (endDate.getDate() + 1)).slice(-2); // 일
		                  endDate = year + '-' + month + '-' + day; // yyyy-mm-dd 형식으로 포맷
		                  
		                  // 리스트만큼 event만들기
		                  var event = {
		                      title: events[i].todoContent,
		                      start: startDate, // 시작일
		                      end: endDate, // 종료일
		                      no: events[i].todoNo
		                      
		                  };
		                  // calendarEvents에 event 하나씩 담기
		                  calendarEvents.push(event);
		                }
		                calendar.getEvents().forEach(function(event) {
		                    event.remove();
		                });
		                
		                calendar.addEventSource(calendarEvents);
		                // 이벤트 데이터 다시 가져오기
		                calendar.refetchEvents(); 
		    		},
		    		error : function() {
		    			
		    		}
		    	})
		    	
		    	
		    }
		    calendarEvents();
		  
		  // 할 일 목록
// 		  document.addEventListener('DOMContentLoaded', () => {
//             const input = document.querySelector('#todo')
//             const addButton = document.querySelector('#add-button')
//             const todoList = document.querySelector('#todo-list')
//             const alert = document.querySelector('span')

	        // 오늘 날짜 구하기
			var today = new Date(); // 현재 날짜와 시간을 가져옴
			var year = today.getFullYear().toString().slice(-2); // 년도의 마지막 두 자리 추출
			var month = (today.getMonth() + 1).toString().padStart(2, "0"); // 월을 추출하고, 한 자리 숫자인 경우 0을 채워서 두 자리로 만든다.
			var day = today.getDate().toString().padStart(2, "0"); // 일을 추출하고, 한 자리 숫자인 경우 0을 채워서 두 자리로 만든다.
			var formattedDate = '';
			formattedDate = year + '/' +month + '/' +day;
			// #formattedDate를 오늘날짜로 만들어주기
			$("#formattedDate").val(formattedDate);
			// 처음에 업무관리 페이지 들어갔을때 오늘날짜로 만들어주기(페이지 들어가자마자 달력선택안해도 등록될 수 있도록)
			$("#todoCreateDate").val(formattedDate);
			
			// 등록
			function insertTodo() {
				$.ajax ({
// 					앞에 '/' 까먹지말고..
					url : '/ajaxInsertTodo',
					data : {
// 						컨트롤러에서 Todo todo 로 받으니까 도메인에서 써준거랑 똑같이 써야됨 -todoContent
						"todoContent" : $("#todo").val(),
						"userId" : $("#userId").val(),
						// 위에서 오늘날짜로 만들어준거 보내주기
						"tdCreateDate" : $("#todoCreateDate").val()
					},
					type : 'post',
					success : function(data) {
						calendarEvents(); // 등록 성공하면 바로 달력에 일정 추가될 수 있도록
						todoInsertList(); // 등록 성공하면 바로 리스트 새로 불러오도록
						$("#todo").val(''); // 등록하고 input 내용 비워주기
					},
					error : function(date) {
						
					}
				})
			}
			// 등록하고 리스트 불러오기
			function todoInsertList() {
				// 딱 처음에는 오늘의날짜(위에서 오늘 날짜 구하기 해서 날짜를 구해줘서)인데 달력에서 날짜 선택하는 순간 그 날짜가 들어옴
				var formattedDate = $("#formattedDate").val();
				$.ajax({ 
		    		  url: '/ajaxSelectDay',
		    		  data: {
		    		    "date": formattedDate
		    		  },
		    		  type: 'post',
		    		  dataType: 'json',
		    		  success: function(data) {
		    		    // 성공 시 처리할 코드
		    		    const todoList = $("#todo-list");
		    		    todoList.html("");
		    		    for (let i = 0; i < data.length; i++) {
		    		    	  var todo = data[i];
		    		    	  const isChecked = todo.isFinished === 'Y' ? 'checked' : ''; // 체크 여부에 따른 checked 속성 추가
		    		    	  console.log(todo.todoNo);
		    		    	  var itemHTML = '<div class="item">';
		    		    	        if(todo.isFinished == 'Y') {
			    		    	        itemHTML+= '<input class="checkInput" type="checkbox" onclick="checkFinish(this, '+todo.todoNo+');" checked>';
			    		    	        itemHTML+=  '<span style="text-decoration: line-through;">'+todo.todoContent+'</span>';
		    		    	        }else {
			    		    	        itemHTML+= '<input class="checkInput" type="checkbox" onclick="checkFinish(this, '+todo.todoNo+');">';
			    		    	        itemHTML+=  '<span style="text-decoration: none;">'+todo.todoContent+'</span>';
		    		    	        }
		    		    	        itemHTML+=    '<button id="'+todo.todoNo+'" onclick="deleteTodo('+todo.todoNo+');">제거하기</button></div>';
		    		    	     
		    		    	  todoList.append(itemHTML); 
		    		    }
		    		  },
		    		  error: function(data) {
		    		    // 오류 시 처리할 코드
		    		  }
		    		});
			}
			
			// 체크박스 
			function checkFinish(checkbox, todoNo) {
// 				console.log(checkbox.nextElementSibling);
				$.ajax ({
					url : '/ajaxCheckFinish',
					data : {
						"todoNo" : todoNo
					},
					dataType : "json",
					type : 'post',
					success : function(data) {
						console.log(data);
						console.log(data.isFinished);
						var isFinished = data.isFinished;
						// isFinished가 Y면 체크박스 계속 체크되어있고 글자에 줄 그어지도록
						if (isFinished == 'Y') {
							checkbox.checked = true;
							checkbox.nextElementSibling.style.textDecoration = 'line-through';
						// isFinished가 N이면 체크박스 체크x, 글자에 줄 x
						} else {
							checkbox.checked = false;
							checkbox.nextElementSibling.style.textDecoration = 'none';
						}
						calendarEvents();
					},
					error : function(data) {
						
					}
				})
			}
			
			// 삭제
			function deleteTodo(todoNo) {
				console.log(todoNo);
				console.log($("#"+todoNo).parent());
				if (confirm("정말로 삭제하시겠습니까?")) {
					$.ajax ({
						url : '/ajaxDeleteTodo',
						data : {
							"todoNo" : todoNo
						},
						type : 'post',
						success : function(data) {
							console.log(data);
// 							id를 todoNo로가진 버튼(내가 지운거)의 부모(div)를 지워줌
							$("#"+todoNo).parent().remove();
							calendarEvents(); // 등록 성공하면 바로 달력에 일정 추가될 수 있도록
						},
						error : function(data) {
							
						}
					})
					
				}
			}
		</script>
	</body>
	
</html>