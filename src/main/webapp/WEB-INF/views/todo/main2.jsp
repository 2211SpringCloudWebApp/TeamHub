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
		<script>
		
		  document.addEventListener('DOMContentLoaded', function() {
		    var calendarEl = document.getElementById('calendar');
		
		    var calendar = new FullCalendar.Calendar(calendarEl, {
		      
		      navLinks: true, // can click day/week names to navigate views
		      selectable: true,
		      selectMirror: true,
		      locale: 'ko',	// 한국어 설정
		      select: function(arg) {
		    	  console.log(arg);
// 		        var title = prompt('일정 등록:');
// 		        if (title) {
// 		          calendar.addEvent({
// 		            title: title,
// 		            start: arg.start,
// 		            end: arg.end,
// 		            allDay: arg.allDay
// 		          })
// 		        }
// 		        calendar.unselect()
		      },
		      eventClick: function(arg) {
		        if (confirm('삭제할까여?')) {
		          arg.event.remove()
		        }
		      },
		      editable: true,
		      dayMaxEvents: true, // allow "more" link when too many events
		      events: [
		        {
		          title: 'All Day Event',
		          start: '2023-01-01'
		        },
		        {
		          title: 'Long Event',
		          start: '2023-01-07',
		          end: '2023-01-10'
		        },
		        {
		          groupId: 999,
		          title: 'Repeating Event',
		          start: '2023-01-09T16:00:00'
		        },
		        {
		          groupId: 999,
		          title: 'Repeating Event',
		          start: '2023-01-16T16:00:00'
		        },
		        {
		          title: 'Conference',
		          start: '2023-01-11',
		          end: '2023-01-13'
		        },
		        {
		          title: 'Meeting',
		          start: '2023-01-12T10:30:00',
		          end: '2023-01-12T12:30:00'
		        },
		        {
		          title: 'Lunch',
		          start: '2023-01-12T12:00:00'
		        },
		        {
		          title: 'Meeting',
		          start: '2023-01-12T14:30:00'
		        },
		        {
		          title: 'Happy Hour',
		          start: '2023-01-12T17:30:00'
		        },
		        {
		          title: 'Dinner',
		          start: '2023-01-12T20:00:00'
		        },
		        {
		          title: 'Birthday Party',
		          start: '2023-01-13T07:00:00'
		        },
		        {
		          title: 'Click for Google',
		          url: 'http://google.com/',
		          start: '2023-01-28'
		        }
		      ]
		    });
		
		    calendar.render();
		  });
		  
		  // 할 일 목록
		  document.addEventListener('DOMContentLoaded', () => {
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
	            input.addEventListener('keypress', (event) => {
	                const ENTER = 13
	                if (event.keyCode === ENTER)
	                    addTodo();
	            })
	        })
		
		</script>
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
                                <h3>Today</h3> 
                            </div>
                            <div id="today-list">
                                <h2>할 일 목록</h2>
                                <span></span><br>
                                <input id="todo">
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
								        <button id="${todo.todoNo }" onclick="deleteTodo('${todo.todoNo}');">제거하기</button>
								    </div>
                                </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div id="month">
                                <h3>Month</h3>
                            <div id="calendar">
                                여기는 달력
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
			function insertTodo() {
				$.ajax ({
// 					앞에 '/' 까먹지말고..
					url : '/ajaxInsertTodo',
					data : {
// 						컨트롤러에서 Todo todo 로 받으니까 도메인에서 써준거랑 똑같이 써야됨 -todoContent
						"todoContent" : $("#todo").val(),
						"userId" : $("#userId").val()
					},
					type : 'post',
					success : function(data) {
						location.reload();
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
					type : 'post',
					success : function(data) {
						console.log(data);
							console.log(data[4]);
							console.log(JSON.parse(data).isFinished);
							var isFinished = JSON.parse(data).isFinished;
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
							$("#"+todoNo).parent().remove();
						},
						error : function(data) {
							
						}
					})
					
				}
			}
			
			
			
			
		</script>
	</body>
	
</html>