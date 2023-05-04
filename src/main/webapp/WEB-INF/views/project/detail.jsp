<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>프로젝트 상세</title>
		<link rel="stylesheet" href="../../../resources/css/project/detail.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	</head>
	<style>
	.modal {
		display: none;
		position: fixed;
		z-index: 100;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background-color: rgba(0, 0, 0, 0.3);
	}	
	.close {
		color: #aaa;
		text-align: right;
		font-size: 28px;
		font-weight: bold;
	}	
	.close:hover, .close:focus {
		color: black;
		text-decoration: none;
		cursor: pointer;
	}	
	.modal-content {
		background-color: #fefefe;
		margin: 15% auto;
		padding: 10px 20px 20px 20px;
		border: 1px solid #888;
		border-radius: 10px;
		width: 600px;
		height: 400px;
	}
	.modal-content p {
		font-size: 25px;
		font-weight: bold;
		text-align: center;
		padding-bottom: 10px;
	}
	.modal-content td {
		padding-left: 20px;
		padding-right: 10px;
		font-size: 18px;
		font-weight: bold;
		height: 50px;
		line-height : 2.5;
	}
	.modal-content input[type=text] {
		line-height: normal;
		border:none;
    	border-bottom: 1px solid #bebebe;
		width: 395px;
		height: 30px;
	}
	.modal-content input[type=date] {
		line-height: normal;
		width: 185px;
		border: 1px solid #bebebe;
	}
	.modal-content input[type=submit] {
		margin-top: 30px;
	    margin-left: 175px;
	    width: 150px;
	    height: 50px;
	    border: 1px solid #bebebe;
	    border-radius: 5px;
	}
	</style>
	</head>
		
	<body>
		<div id="container">
			<jsp:include page="../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
				<h2 class="thProject">프로젝트 관리</h2>
				<ul>
					<li><a href="/project/list">프로젝트 목록</a></li>
					<li style="color: #275ab5;">프로젝트 상세 조회</li>
	           </ul>
			</div>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
				<div id="contents-area">
					<div id="top-area">
						<h2 id="titleTop" class="thProject">프로젝트 정보</h2>
						<div id="btn-area">
							<c:if test="${project.userName == user.userName && project.projectStatus != '종료'}">
								<button onclick="showModal();">수정</button>
								<button onclick="removeCheck('${project.projectNo}');">삭제</button>
							</c:if>
						</div>
					</div>
					<table id="projectInfo" class="table">
						<tr>
							<td class="titletxt">프로젝트명</td>
							<td>${project.projectName }</td>
						</tr>
						<tr>
							<td class="titletxt">책임자</td>
							<td>${project.userName }</td>
						</tr>
						<tr>
							<td class="titletxt">진행기간</td>
							<td>${project.projectStart } ~ ${project.projectEnd }</td>
						</tr>
						<tr>
							<td colspan="2" class="titletxt" style="border-bottom: none;">진행률</td>
						</tr>
					</table>
				</div>
				
				<div id="mid-area">
					<div class="progress-bar">
						<div class="progress" id="project-progress"></div>
					</div>
					<h3 id="progress" class="mt-10"></h3>
					<!-- 계산식 {(완료)+0.5*(진행중)/(전체-중지)}*100 -->
				</div>
				
				<div id="btm-area">
					<h5 style="font-weight:bold;">칸반보드</h5>
					<div id="kanban-area">
						<div class="col" data-order="0">
							<div class="kanban-wrap">
								<h3 id="noView"></h3>
								<button class="btn-plus" type="button" onclick="openModal(this);">&#10133;</button>
								<section class="section-modal">
									<div class="section-modal_conts">
										<button type="button" class="btn-close"></button>
										<h3>칸반보드 추가</h3>
										<ul>
											<li><label for="">담당자</label><input type="text" id="kUsername0" value="${user.userName }" readonly></li>
											<li><label for="">내용</label><input type="text" id="kContent0"></li>
										</ul>
										<div class="btns-wrap">
											<button class="point" type="button" onclick="addBtn(this);" value="0">추가</button>
											<button class="finished closeWindow" type="button">닫기</button>
										</div>
									</div>
								</section>
							</div>
							<div class="kanban-wrap mt-20 padding-20 kanbanCard" id="btbZero" data-draggable="target"></div>
						</div>
						<div class="col" data-order="1">
							<div class="kanban-wrap">
								<h3 id="beforeView"></h3>
								<button class="btn-plus" type="button" onclick="openModal(this);">&#10010;</button>
								<section class="section-modal">
									<div class="section-modal_conts">
										<button type="button" class="btn-close"></button>
										<h3>칸반보드 추가</h3>
										<ul>
											<li><label for="">담당자</label><input type="text" id="kUsername1" value="${user.userName }" readonly></li>
											<li><label for="">내용</label><input type="text" id="kContent1"></li>
										</ul>
										<div class="btns-wrap">
											<button class="point" type="button" onclick="addBtn(this);" value="1">추가</button>
											<button class="finished closeWindow" type="button">닫기</button>
										</div>
									</div>
								</section>
							</div>
							<div class="kanban-wrap mt-20 padding-20 kanbanCard" id="btbOne" data-draggable="target"></div>
						</div>
						<div class="col" data-order="2">
							<div class="kanban-wrap">
								<h3 id="proceedingView"></h3>
								<button class="btn-plus" type="button" onclick="openModal(this);">&#10010;</button>
								<section class="section-modal">
									<div class="section-modal_conts">
										<button type="button" class="btn-close"></button>
										<h3>칸반보드 추가</h3>
										<ul>
											<li><label for="">담당자</label><input type="text" id="kUsername2" value="${user.userName }" readonly></li>
											<li><label for="">내용</label><input type="text" id="kContent2"></li>
										</ul>
										<div class="btns-wrap">
											<button class="point" type="button" onclick="addBtn(this);" value="2">추가</button>
											<button class="finished closeWindow" type="button">닫기</button>
										</div>
									</div>
								</section>
							</div>
							<div class="kanban-wrap mt-20 padding-20 kanbanCard" id="btbTwo" data-draggable="target"></div>
						</div>
						<div class="col" data-order="3">
							<div class="kanban-wrap">
								<h3 id="completeView"></h3>
								<button class="btn-plus" type="button" onclick="openModal(this);">&#10010;</button>
								<section class="section-modal">
									<div class="section-modal_conts">
										<button type="button" class="btn-close"></button>
										<h3>칸반보드 추가</h3>
										<ul>
											<li><label for="">담당자</label><input type="text" id="kUsername3" value="${user.userName }" readonly></li>
											<li><label for="">내용</label><input type="text" id="kContent3"></li>
										</ul>
										<div class="btns-wrap">
											<button class="point" type="button" onclick="addBtn(this);" value="3">추가</button>
											<button class="finished closeWindow" type="button">닫기</button>
										</div>
									</div>
								</section>
							</div>
							<div class="kanban-wrap mt-20 padding-20 kanbanCard" id="btbThree" data-draggable="target"></div>
						</div>
						<div class="col" data-order="4">
							<div class="kanban-wrap">
								<h3 id="stopView"></h3>
								<button class="btn-plus" type="button" onclick="openModal(this);">&#10010;</button>
								<section class="section-modal">
									<div class="section-modal_conts">
										<button type="button" class="btn-close"></button>
										<h3>칸반보드 추가</h3>
										<ul>
											<li><label for="">담당자</label><input type="text" id="kUsername4" value="${user.userName }" readonly></li>
											<li><label for="">내용</label><input type="text" id="kContent4"></li>
										</ul>
										<div class="btns-wrap">
											<button class="point" type="button" onclick="addBtn(this);" value="4">추가</button>
											<button class="finished closeWindow" type="button">닫기</button>
										</div>
									</div>
								</section>
							</div>
							<div class="kanban-wrap mt-20 padding-20 kanbanCard" id="btbFour" data-draggable="target"></div>
						</div>
					</div>
				</div>
				
				<div id="modal" class="modal">
					<div class="modal-content">
						<span class="close">×</span>
						<p>프로젝트 수정</p>
						<form action="/project/modify" method="POST">
							<input type="hidden" id="projectNo" name="projectNo" value="${project.projectNo }">
							<table>
								<tr>
									<td>프로젝트명</td>
									<td><input type="text" id="ptitle" name="projectName" value="${project.projectName }"></td>
								</tr>
								<tr>
									<td>책임자</td>
									<td><input type="text" value="${project.userName }" readonly></td>
								</tr>
								<tr>
									<td>진행기간</td>
									<td><input type="date" id="start" name="projectStart" value="${project.projectStart }"> ~ <input type="date" id="end" name="projectEnd" value="${project.projectEnd }"></td>
								</tr>
								<tr>
									<td  colspan="2"><input type="submit" onclick="return checkValid();" value="등록"></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</main>
		</div>
		<script>
			// 프로젝트 수정
			var modal = document.getElementById("modal");
			var closeBtn = document.getElementsByClassName("close")[0];
			
			function showModal() {
				modal.style.display = "block";
			}
			function hideModal() {
				modal.style.display = "none";
			}
			closeBtn.onclick = function() {
				hideModal();
			}
			window.onclick = function(event) {
				if (event.target == modal) {
					hideModal();
				}
			}
			
			// 프로젝트 삭제
			function removeCheck(projectNo) {
				if (confirm("프로젝트를 삭제하시겠습니까?")) {
			    	location.href="/project/delete/"+projectNo;
				}
			}
			
			// 프로젝트 기간 유효성검사
			var today = new Date().toISOString().split('T')[0];
			var start = document.getElementById("start");
			var end = document.getElementById("end");
			// 시작일, 종료일 최소값 설정
			if(today < $("#start").val()){
				start.min = today
			} else{
				start.min = $("#start").val();
			}
			end.min = today;
			// 시작일 입력값에 따라 종료일 범위 업데이트
			function updateEndDate() {
				var inputDate = new Date(start.value);
				var minEndDate = new Date(inputDate.getTime() + 86400000).toISOString().split('T')[0];
				var maxEndDate = new Date(inputDate.getTime() + 31536000000).toISOString().split('T')[0];
				 // 현재 선택된 종료일이 범위를 벗어나면 재설정
				if (new Date(end.value) < new Date(minEndDate)) {
					end.value = minEndDate;
				} else if (new Date(end.value) > new Date(maxEndDate)) {
					end.value = maxEndDate;
				}
				// 종료일 최소, 최대값 설정
				end.min = today;
				end.max = maxEndDate;
			}
			// 시작일이 입력되면 종료일 범위를 업데이트
			if (start.value) {
				updateEndDate();
			}			
			start.addEventListener("input", function () {
				updateEndDate();
			});
			
			// 등록 유효성 검사
			var ptitle = document.getElementById("ptitle");
			function checkValid() {
				if (ptitle.value === "") {
					alert("프로젝트명을 입력해 주세요");
					return false;
				} else {
					return true;
				}
			}
			
			// 칸반 모달
			function openModal(modalWindow) {
			    $(modalWindow).siblings('.section-modal').css('display', 'flex');
			}
			
			// 칸반보드 추가
			function addBtn(btn) {
				var projectNo = $("#projectNo").val();
				var kanbanStatus = $(btn).val();
				var userName = $("#kUsername"+kanbanStatus).val();
				var kanbanContent = $("#kContent"+kanbanStatus).val();
				$.ajax({
					url : "/project/addKanban",
					type : "post",
					data : {
						"projectNo" : projectNo,
						"userName" : userName,
						"kanbanContent" : kanbanContent,
						"kanbanStatus" : kanbanStatus
					},
					success : function(data) {
						location.reload();
						$(".section-modal").stop().fadeOut(100);
						$("#kContent"+kanbanStatus).val("");
						getBoardList();
					},
					error : function() {
						alert("ajax 실패!");
					}
				});
			}
			
			// 칸반보드 리스트
			function getKanbanList() {
				var pNo = $("#projectNo").val();
				$.ajax({
					url : "/project/showKanban",
					type : "get",
					data : { "projectNo" : pNo },
					dataType : "json",
					async : false,
					success : function(data) {
						var count = data.length;
						var $divZero = $("#btbZero");
						var $divOne = $("#btbOne");
						var $divTwo = $("#btbTwo");
						var $divThree = $("#btbThree");
						var $divFour = $("#btbFour");
						$divZero.html("");
						$divOne.html("");
						$divTwo.html("");
						$divThree.html("");
						$divFour.html("");
						for(var i = 0; i < data.length; i++) {
							var $table = $("<table class='kanban-wrap kanban' data-draggable='item' data-number='"+data[i].kanbanNo+"'>");
							var $trHead = $("<tr class='kanbanHead'>");
							var $trBody = $("<tr class='kanbanBody'>");
							var $userName = $("<td>").text(data[i].userName);
							var $kanbanContent = $("<td colspan='2'>").text(data[i].kanbanContent);
							var $btnArea = $("<td>")
											.append("<button class='kanbanCloseBtn' type='button' onclick='openAlert(this);'></button>"
										                    +"<section class='section-alert'>"
									                        +"<div class='bg-black'></div>"
									                        +"<div class='section-alert_conts'>"
									                            +"<button class='btn-close' type='button'></button>"
									                            +"<p style='color:black;'>"
									                                +"칸반보드를 삭제하시겠습니까?"
									                            +"</p>"
									                            +"<div class='btns-wrap mt-20'>"
									                                +"<button class='point' type='button' onclick='delKanban("+data[i].kanbanNo+");'>확인</button>"
									                                +"<button class='finished closeWindow' type='button'>닫기</button>"
									                            +"</div>"
									                        +"</div>"
									                    +"</section>");
							$trHead.append($userName);
							$trHead.append($btnArea);
							$trBody.append($kanbanContent);
							$table.append($trHead);
							$table.append($trBody);
							if(data[i].kanbanStatus == "0") {
								$divZero.append($table);
							}else if(data[i].kanbanStatus == "1") {
								$divOne.append($table);
							}else if(data[i].kanbanStatus == "2") {
								$divTwo.append($table);
							}else if(data[i].kanbanStatus == "3") {
								$divThree.append($table);
							}else if(data[i].kanbanStatus == "4") {
								$divFour.append($table);
							}
						}
						document.getElementById("noView").innerHTML = "진행사항없음("+$("#btbZero >table").length+"/999)";
						document.getElementById("beforeView").innerHTML = "시작 전("+$("#btbOne >table").length+"/999)";
						document.getElementById("proceedingView").innerHTML = "진행 중("+$("#btbTwo >table").length+"/999)";
						document.getElementById("completeView").innerHTML = "완료("+$("#btbThree >table").length+"/999)";
						document.getElementById("stopView").innerHTML = "중지("+$("#btbFour >table").length+"/999)";
						var projectProgress =
							Math.floor((($("#btbThree >table").length + 0.5) * ($("#btbTwo >table").length)) / (count-($("#btbFour >table").length)) * 100);
						/* document.getElementById("progress").innerHTML = "진행률 <strong>" + projectProgress + "%</strong>";
						document.getElementById("noP").innerHTML = $("#btbZero >table").length;
						document.getElementById("beforeS").innerHTML = $("#btbOne >table").length;
						document.getElementById("proceeding").innerHTML = $("#btbTwo >table").length;
						document.getElementById("complete").innerHTML = $("#btbThree >table").length;
						document.getElementById("stop").innerHTML = $("#btbFour >table").length; */
						document.getElementById("project-progress").style.width = projectProgress + "%";
					},
					error : function() {
						alert("ajax 실패!");
					}
				});
			}
			
			// 칸반보드 삭제
			function delKanban(kanbanNo) {
				$.ajax({
					url : "/project/deleteKanban",
					type : "get",
					data : { "kanbanNo" : kanbanNo },
					success : function(data) {
						if(data == "success") {
							getKanbanList();
						}else {
							alert("칸반보드 삭제 실패!");
						}
					},
					error : function() {
						alert("Ajax 통신 실패!");
					}
				});
			}
		</script>
	</body>
	
</html>