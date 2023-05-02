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
				<h4><a href="#">완료 목록</a></h4>
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
                        </div>
                        
                        <div id="memo">
                            여기는 메모장
                        </div>
                    </div>
                
                </div>
			</main>
		</div>
		
		<script>
		    var calendarEl = document.getElementById('calendar');
		
		    var calendarOptions = {
// 	    		  navLinks: true, // can click day/week names to navigate views
			      selectable: true,
// 			      selectMirror: true,
			      locale: 'ko',	// 한국어 설정
			      select: function(arg) {
			    	  
					const dateString = JSON.stringify(arg.startStr); // 받아온 문자열을 JSON 형식으로 변환
					const dateObj = new Date(dateString); // Date 객체 생성
					const year = dateObj.getFullYear().toString().substring(2); // 년도의 뒤 두 자리만 추출
					const month = (dateObj.getMonth() + 1).toString().padStart(2, "0"); // 월(4월이면 4 말고 04 이렇게되게)
					const day = dateObj.getDate().toString().padStart(2, "0"); // 일
					let formattedDate = '';
					formattedDate = year + '/' +month + '/' +day;
					// 내가선택한 날짜로나오게
					$("#todayH3").html(formattedDate);
					// #todoCreateDate의 val을 내가 선택한 날짜로
					// <input type="hidden" id="todoCreateDate" value="23/04/26"> 4/26 선택하면 이렇게됨
					// <input type="hidden" id="todoCreateDate" value="23/04/25"> 4/25 선택하면 이렇게됨
					$("#todoCreateDate").val(formattedDate);
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
			      dayMaxEvents: true, // allow "more" link when too many events
			      events: []
		    }
		    // 달력만들기
		    var calendar = new FullCalendar.Calendar(calendarEl, calendarOptions);
		    calendar.render();
		    
		    
		    // events 옵션추가
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
		                  
		                  var event = {
		                      title: events[i].todoContent,
		                      start: startDate, // 시작일
		                      end: endDate, // 종료일
		                      no: events[i].todoNo
		                      
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
		    		error : function() {
		    			
		    		}
		    	})
		    	
		    	
		    }
		    calendarEvents();
		  
		  // 할 일 목록
// 		  document.addEventListener('DOMContentLoaded', () => {
            const input = document.querySelector('#todo')
            const addButton = document.querySelector('#add-button')
            const todoList = document.querySelector('#todo-list')
            const alert = document.querySelector('span')

      		// '+' 버튼 익명 화살표 함수 
            const addTodo = () => {
                if (input.value !== '') {
                    const item = document.createElement('div')
                     item.classList.add('item')
      		    // 체크박스
                    const checkbox = document.createElement('input')
                    checkbox.type='checkbox'
     		    // text
                    const text = document.createElement('span');
      		    // 제거하기 버튼
                    const deleteButton = document.createElement('button')
                    deleteButton.textContent="제거하기"
                    

                    text.textContent = input.value
                    input.value=''
                
                    item.appendChild(checkbox)
                    item.appendChild(text)
                    item.appendChild(deleteButton)
                    todoList.appendChild(item)

			// 체크박스 이벤트 리스너
                    checkbox.addEventListener('change', (event) =>{ 
                        if (event.currentTarget.checked)
                        {
                            text.style.textDecoration='line-through'
                        }
                        else {
                            text.style.textDecoration='none'
                        }
                    })

      		    // 제거하기 버튼 클릭 이벤트 리스너
                    deleteButton.addEventListener('click', (event) => {
                        todoList.removeChild(event.currentTarget.parentNode)
                    })
                    input.value =''
                    alert.textContent = ''
                }
                else
                    alert.textContent = '할 일을 입력하세요!'
            }

            addButton.addEventListener('click', addTodo)
    
// 	      		할 일 입력창에서 enter key가 눌렸을 때
// 	            input.addEventListener('keypress', (event) => {
// 	                const ENTER = 13
// 	                if (event.keyCode === ENTER)
// 	                    addTodo();
// 	            })
// 	        })
	        
			var today = new Date(); // 현재 날짜와 시간을 가져옵니다.
			var year = today.getFullYear().toString().slice(-2); // 년도의 마지막 두 자리를 추출합니다.
			var month = (today.getMonth() + 1).toString().padStart(2, "0"); // 월을 추출하고, 한 자리 숫자인 경우 0을 채워서 두 자리로 만듭니다.
			var day = today.getDate().toString().padStart(2, "0"); // 일을 추출하고, 한 자리 숫자인 경우 0을 채워서 두 자리로 만듭니다.
			var formattedDate = '';
			formattedDate = year + '/' +month + '/' +day;
			$("#todoCreateDate").val(formattedDate);
			
			function insertTodo() {
				$.ajax ({
// 					앞에 '/' 까먹지말고..
					url : '/ajaxInsertTodo',
					data : {
// 						컨트롤러에서 Todo todo 로 받으니까 도메인에서 써준거랑 똑같이 써야됨 -todoContent
						"todoContent" : $("#todo").val(),
						"userId" : $("#userId").val(),
						"tdCreateDate" : $("#todoCreateDate").val()
					},
					type : 'post',
					success : function(data) {
						calendarEvents();
					},
					error : function(date) {
						
					}
				})
			}
			
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
						if (isFinished == 'Y') {
							checkbox.checked = true;
							checkbox.nextElementSibling.style.textDecoration = 'line-through';
						} else {
							checkbox.checked = false;
							checkbox.nextElementSibling.style.textDecoration = 'none';
						}
					},
					error : function(data) {
						
					}
				})
			}
			
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
							calendarEvents();
						},
						error : function(data) {
							
						}
					})
					
				}
			}
			
			
			
			
		</script>
	</body>
	
</html>