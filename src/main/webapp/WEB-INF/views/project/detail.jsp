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
		background-color: rgba(0, 0, 0, .3);
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
							</c:if>
							<c:if test="${(project.userName == user.userName && project.projectStatus != '종료') || user.userType == 1}">
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
						<div class="progress" id="project-progress" aria-label="pLabel"></div>
					</div>
				</div>
				
				<div id="btm-area">
					<h4 style="font-weight:bold; padding-left: 25px;">칸반보드</h4>
					<div id="kanban-area">
					<input type="hidden" id="projectNo" name="projectNo" value="${project.projectNo }">
					<input type="hidden" id="projectStatus" name="projectStatus" value="${project.projectStatus }">
						<div class="col" data-order="0">
							<div class="kanban-wrap">
								<div class="kanban-plus">
									<h5 id="beforeView"></h5>
									<c:if test="${project.projectStatus == '진행'}">
										<button class="btn-plus" onclick="showinput('section0');">&#10133;</button>
									</c:if>
								</div>
								<section class="section" id="section0">
									<div id="kanban-input-section0" style="display:none">
										<br>
										<ul>
											<li>
												<label for="">담당자</label><input type="text" id="kUsername0" value="${user.userName }" readonly>
											</li>
											<li>
												<label for="">내용</label><input type="text" id="kContent0">
											</li>
										</ul>
										<div class="btns-wrap">
											<button class="point" onclick="addKanban(this);" value="0">등록</button>
											<button class="finished">닫기</button>
										</div>
									</div>
								</section>
							</div>
							<div class="kanbanCard" id="btbZero" data-draggable="target"></div>
						</div>
						<div class="col" data-order="1">
							<div class="kanban-wrap">
								<div class="kanban-plus">
									<h5 id="planView"></h5>
									<c:if test="${project.projectStatus == '진행'}">
										<button class="btn-plus" onclick="showinput('section1');">&#10133;</button>
									</c:if>
								</div>
								<section class="section" id="section1">
									<div id="kanban-input-section1" style="display:none">
										<br>	
										<ul>
											<li>
												<label for="">담당자</label><input type="text" id="kUsername1" value="${user.userName }" readonly>
											</li>
											<li>
												<label for="">내용</label><input type="text" id="kContent1">
											</li>
										</ul>
										<div class="btns-wrap">
											<button class="point" onclick="addKanban(this);" value="1">등록</button>
											<button class="finished">닫기</button>
										</div>
									</div>
								</section>
							</div>
							<div class="kanbanCard" id="btbOne" data-draggable="target"></div>
						</div>
						<div class="col" data-order="2">
							<div class="kanban-wrap">
								<div class="kanban-plus">
									<h5 id="proceedingView"></h5>
									<c:if test="${project.projectStatus == '진행'}">
										<button class="btn-plus" onclick="showinput('section2');">&#10133;</button>
									</c:if>
								</div>
								<section class="section" id="section2">
									<div id="kanban-input-section2" style="display:none">	
										<br>
										<ul>
											<li>
												<label for="">담당자</label><input type="text" id="kUsername2" value="${user.userName }" readonly>
											</li>
											<li>
												<label for="">내용</label><input type="text" id="kContent2">
											</li>
										</ul>
										<div class="btns-wrap">
											<button class="point" onclick="addKanban(this);" value="2">등록</button>
											<button class="finished">닫기</button>
										</div>
									</div>
								</section>
							</div>
							<div class="kanbanCard" id="btbTwo" data-draggable="target"></div>
						</div>
						<div class="col" data-order="3">
							<div class="kanban-wrap">
								<div class="kanban-plus">
									<h5 id="completeView"></h5>
									<c:if test="${project.projectStatus == '진행'}">
										<button class="btn-plus" onclick="showinput('section3');">&#10133;</button>
									</c:if>
								</div>
								<section class="section" id="section3">
									<div id="kanban-input-section3" style="display:none">
										<br>	
										<ul>
											<li>
												<label for="">담당자</label><input type="text" id="kUsername3" value="${user.userName }" readonly>
											</li>
											<li>
												<label for="">내용</label><input type="text" id="kContent3">
											</li>
										</ul>
										<div class="btns-wrap">
											<button class="point" onclick="addKanban(this);" value="3">등록</button>
											<button class="finished">닫기</button>
										</div>
									</div>
								</section>
							</div>
							<div class="kanbanCard" id="btbThree" data-draggable="target"></div>
						</div>
						<div class="col" data-order="4">
							<div class="kanban-wrap">
								<div class="kanban-plus">
									<h5 id="stopView"></h5>
									<c:if test="${project.projectStatus == '진행'}">
										<button class="btn-plus" onclick="showinput('section4');">&#10133;</button>
									</c:if>
								</div>
								<section class="section" id="section4">
									<div id="kanban-input-section4" style="display:none">
										<br>
										<ul>
											<li>
												<label for="">담당자</label><input type="text" id="kUsername4" value="${user.userName }" readonly>
											</li>
											<li>
												<label for="">내용</label><input type="text" id="kContent4">
											</li>
										</ul>
										<div class="btns-wrap">
											<button class="point" onclick="addKanban(this);" value="4">등록</button>
											<button class="finished">닫기</button>
										</div>
									</div>
								</section>
							</div>
							<div class="kanbanCard" id="btbFour" data-draggable="target"></div>
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
			
			// 칸반보드 등록창 생성
			function showinput(sectionID) {
				var kanbanInput = document.querySelector("#kanban-input-"+sectionID);
				if (kanbanInput) {
					kanbanInput.style.display = "block";
					var closeBtn2 = kanbanInput.querySelector(".finished");
					if (closeBtn2) {
						closeBtn2.onclick = function() {
						kanbanInput.style.display = "none";
				    	}
					}
				}
			}
			
			// 칸반보드 추가
			function addKanban(btn) {
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
		            success: function(data) {
		            	location.reload();
						$("#kContent"+kanbanStatus).val("");
						getKanbanList();
		            },
		            error: function() {
		                alert("ajax 실패");
		            }
		        });
		    }
 			
			// DOM 조작
			$(document).ready(function () {
				getKanbanList();
			});
			
			// 칸반보드 목록 출력
			function getKanbanList() {
				var pNo = $("#projectNo").val();
				$.ajax({
				    url: "/project/showKanban",
				    type: "get",
				    data: { "projectNo": pNo },
				    async: false,
				    success: function (data) {
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
				         for (var i = 0; i < data.length; i++) {
				            var $table = $("<table class='kanban-wrap kanbanCard' data-draggable='item' data-number='" + data[i].kanbanNo + "'>");
				            var $trHead = $("<tr class='kanbanHead'>");
				            var $trBody = $("<tr class='kanbanBody'>");
				            var $userName = $("<td>").text(data[i].userName);
				            var $exitBtn = $("<td id='exit'>").append("<button class='exit' onclick='delKanban("+data[i].kanbanNo+");'>&#10006;</button>");
				            var $kanbanContent = $("<td colspan='2'>").text(data[i].kanbanContent);
				            if (${project.projectStatus == '진행'}) {
						        $trHead.append($userName).append($exitBtn);
						    } else {
						        $trHead.append($userName);
						    }
				            $trBody.append($kanbanContent);
				            $table.append($trHead).append($trBody);
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
				        document.getElementById("beforeView").innerHTML = "시작 전("+$("#btbZero >table").length+"/999)";
						document.getElementById("planView").innerHTML = "기획("+$("#btbOne >table").length+"/999)";
						document.getElementById("proceedingView").innerHTML = "진행 중("+$("#btbTwo >table").length+"/999)";
						document.getElementById("completeView").innerHTML = "완료("+$("#btbThree >table").length+"/999)";
						document.getElementById("stopView").innerHTML = "중지("+$("#btbFour >table").length+"/999)"; 
						var numPlan = $("#btbOne > table").length;
				        var numProceeding = $("#btbTwo > table").length;
				        var numComplete = $("#btbThree > table").length;
				        var countCategories = numPlan + numProceeding + numComplete;
				        var projectProgress = Math.round((numPlan*0.1)+(numProceeding*0.5)+numComplete / countCategories * 100);
						document.getElementById("project-progress").innerHTML = "<p>" + projectProgress + "%</p>";
						document.getElementById("project-progress").style.width = projectProgress + "%";
				    },
				    error: function () {
				      alert("ajax 실패");
				    }
				});
			}
			
			// 칸반보드 삭제
			function delKanban(kanbanNo) {
				if (confirm("칸반보드를 삭제하겠습니까?")) {
				$.ajax({
					url : "/project/deleteKanban",
					type : "get",
					async : "false",
					data : { "kanbanNo" : kanbanNo },
					success : function(data) {
						if(data == "success") {
							getKanbanList();
// 							$(obj).parents(".kanbanCard").load(location.href+".kanbanCard");
						}else {
							alert("칸반보드 삭제 실패");
						}
					},
					error: function (xhr, status, error) {
						alert("ajax 실패");
					}
				});
				}
			}
			
			// 드래그앤드롭
			$(function(){
				getKanbanList();
				if
				(
					!document.querySelectorAll 
					|| 
					!('draggable' in document.createElement('span')) 
					|| 
					window.opera
				) 
				{ return; }
				
				for(var 
					items = document.querySelectorAll('[data-draggable="item"]'), 
					len = items.length, 
					i = 0; i < len; i ++)
				{
					items[i].setAttribute('draggable', 'true');
				}
				
				var item = null;
		
				document.addEventListener('dragstart', function(e)
				{
					item = e.target;
					e.dataTransfer.setData('text', '');
				
				}, false);
		
				document.addEventListener('dragover', function(e)
				{
					if(item)
					{
						e.preventDefault();
					}
				
				}, false);	
		
				document.addEventListener('drop', function(e)
				{
					if(e.target.getAttribute('data-draggable') == 'target')
					{
						e.target.appendChild(item);
						
						e.preventDefault();
						modifyKanban(item);
					}
				}, false);
				
				document.addEventListener('dragend', function(e)
				{
					item = null;
				
				}, false);
			});
			
			// 칸반보드 드래그앤드롭 시 상태값 수정
			function modifyKanban(obj) {
				var kanbanNo = $(obj).attr("data-number");
				var kanbanStatus = $(obj).parent().parent().attr("data-order");
				$.ajax({
					url : "/project/editKanban",
					type : "post",
					data : { "kanbanNo" : kanbanNo, "kanbanStatus" : kanbanStatus},
					success : function(data) {
						location.reload();
					},
					error : function() {
						alert("ajax 실패!");
					}
				});
			}
		</script>
	</body>
	
</html>