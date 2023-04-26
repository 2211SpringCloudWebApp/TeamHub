<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>프로젝트 상세</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"> -->
		<style>
		#sideBar li:nth-child(7){
		    background-color: #2653e8ba;
   				
		}
		#sideBar li:nth-child(7) a{
			color: white !important;
		}
		.modal {
		  display: none;
		  position: fixed;
		  z-index: 1;
		  left: 0;
		  top: 0;
		  width: 100%;
		  height: 100%;
		  overflow: auto;
		  background-color: rgba(0,0,0,0.3);
		}
		
		.modal-content {
		  background-color: #fefefe;
		  margin: 15% auto;
		  padding: 20px;
		  border: 1px solid #888;
		  border-radius:10px;
		  width: 30%;
		  height: 30%;
		}
		
		.modal-content p{
			font-size:25px;
			font-weight:bolder;
			text-align: center;
		}
		
		.close {
		  color: #aaa;
		  float: right;
		  font-size: 28px;
		  font-weight: bold;
		}
		
		.close:hover, .close:focus {
		  color: black;
		  text-decoration: none;
		  cursor: pointer;
		}
		</style>
	</head>
		
	<body>
		<div id="container">
			<jsp:include page="../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
				<h2>프로젝트 관리</h2>
				<ul>
					<li><a href="/project/main">전체보기</a></li>
					<li>프로젝트 상세</li>
	           </ul>
			</div>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
				<div id="contents-area" style="height : 300px; border : 1px solid #ccc;">
					<h2 id="titleTop">프로젝트 정보</h2>
					<c:if test="${project.userName == user.userName && project.projectStatus != '종료'}">
					<button onclick="showModal();">수정</button>
					<button onclick="removeCheck('${project.projectNo}');">삭제</button>
					</c:if>
					<table id="projectInfo" class="table">
						<tr>
							<td>프로젝트명</td>
							<td>${project.projectName }</td>
						</tr>
						<tr>
							<td>담당자</td>
							<td>${project.userName }</td>
						</tr>
						<tr>
							<td>진행기간</td>
							<td>${project.projectStart } ~ ${project.projectEnd }</td>
						</tr>
					</table>
				</div>
				<div id="kanban-area" style="height : 300px; border : 1px solid #ccc;">
					<p>칸반보드</p>
				</div>
				<div id="progress-area" style="height : 400px; border : 1px solid #ccc;">
					<p>진행률</p>
				</div>
				<div id="modal" class="modal">
						<div class="modal-content">
							<span class="close">×</span>
							<p>프로젝트 수정</p>
							<form action="/project/modify" method="POST">
								<input type="hidden" name="projectNo" value="${project.projectNo }">
								<table>
									<tr>
										<td>프로젝트명</td>
										<td><input type="text" name="projectName" value="${project.projectName }"></td>
									</tr>
									<tr>
										<td>담당자</td>
										<td><input type="text" value="${project.userName }" readonly></td>
									</tr>
									<tr>
										<td>진행기간</td>
										<td><input type="date" id="start" name="projectStart" value="${project.projectStart }"> ~ <input type="date" id="end" name="projectEnd" value="${project.projectEnd }"></td>
									</tr>
									<tr>
										<td>
											<input type="submit" value="수정">
										</td>
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
		</script>
	</body>
	
</html>