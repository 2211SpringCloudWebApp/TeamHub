<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>프로젝트 관리</title>
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
					<li><button onclick="showModal();">프로젝트 생성</button></li>
					<li><a href="#" onclick="selectAll();">전체보기</a></li>
					<li><a href="#" onclick="selectIng();">진행 중인 프로젝트</a></li>
					<li><a href="#" onclick="selectFin();">종료된 프로젝트</a></li>
	           </ul>
			</div>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
				<div id="contents-area" style="border : 1px solid #ccc">
					<h2 id="titleTop">전체보기</h2>
					<table id="allProject" class="table" style="display: block;">
						<tr>
							<th>번호</th>
							<th>프로젝트명</th>
							<th>담당자</th>
							<th>진행기간</th>
							<th>상태</th>
						</tr>
						<c:forEach items="${pList}" var="project" varStatus="i">
							<tr>
								<td>${i.count }</td>
								<c:url var="pDetail" value="/project/detail">
									<c:param name="projectNo" value="${project.projectNo }"></c:param>
								</c:url>
								<td><a href="/project/detail/${project.projectNo }">${project.projectName }</a></td>
								<td>${project.userName }</td>
								<td>${project.projectStart } ~ ${project.projectEnd }</td>
								<td>${project.projectStatus }</td>
							</tr>
						</c:forEach>
					</table>
					<table id="ingProject" class="table" style="display: none;">
						<tr>
							<th>번호</th>
							<th>프로젝트명</th>
							<th>담당자</th>
							<th>진행기간</th>
							<th>상태</th>
						</tr>
						<c:forEach items="${pList}" var="project" varStatus="i">
							<c:choose>
      							<c:when test="${project.projectStatus == '진행'}">
      								<c:set var="count" value="${count + 1 }"></c:set>
									<tr>
										<td>${count }</td>
										<c:url var="pDetail" value="/project/detail">
											<c:param name="projectNo" value="${project.projectNo }"></c:param>
										</c:url>
										<td><a href="/project/detail/${project.projectNo }">${project.projectName }</a></td>
										<td>${project.userName }</td>
										<td>${project.projectStart } ~ ${project.projectEnd }</td>
										<td>${project.projectStatus }</td>
									</tr>
								</c:when>
							</c:choose>
						</c:forEach>
					</table>
					<table id="finProject" class="table" style="display: none;">
						<tr>
							<th>번호</th>
							<th>프로젝트명</th>
							<th>담당자</th>
							<th>진행기간</th>
							<th>상태</th>
						</tr>
						<c:forEach items="${pList}" var="project" varStatus="i">
							<c:choose>
      							<c:when test="${project.projectStatus == '종료'}">
									<c:set var="cnt" value="${cnt + 1 }"></c:set>
									<tr>
										<td>${cnt }</td>
										<c:url var="pDetail" value="/project/detail">
											<c:param name="projectNo" value="${project.projectNo }"></c:param>
										</c:url>
										<td><a href="/project/detail/${project.projectNo }">${project.projectName }</a></td>
										<td>${project.userName }</td>
										<td>${project.projectStart } ~ ${project.projectEnd }</td>
										<td>${project.projectStatus }</td>
									</tr>
								</c:when>
							</c:choose>
						</c:forEach>
					</table>
				</div>
					<div id="modal" class="modal">
						<div class="modal-content">
							<span class="close">×</span>
							<p>프로젝트 생성</p>
							<form action="/project/create" method="POST">
								<table>
									<tr>
										<td>프로젝트명</td>
										<td><input type="text" name="projectName"></td>
									</tr>
									<tr>
										<td>담당자</td>
										<td><input type="text" value="${sessionScope.user.userName }" readonly></td>
									</tr>
									<tr>
										<td>진행기간</td>
										<td><input type="date" id="start" name="projectStart"> ~ <input type="date" id="end" name="projectEnd"></td>
									</tr>
									<tr>
										<td>
											<input type="submit" value="등록">
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
			</main>
		</div>
		<script>
			// 사이드바 선택
			var titleTop = document.querySelector("#titleTop");
			var allProject = document.querySelector("#allProject");
			var ingProject = document.querySelector("#ingProject");
			var finProject = document.querySelector("#finProject");
			
			function selectAll() {
				titleTop.textContent = "전체보기"
				allProject.style.display = 'block';
				ingProject.style.display = 'none';
				finProject.style.display = 'none';
            }
			function selectIng() {
				titleTop.textContent = "진행 중인 프로젝트"
				allProject.style.display = 'none';
				ingProject.style.display = 'block';
				finProject.style.display = 'none';
            }
			function selectFin() {
				titleTop.textContent = "종료된 프로젝트"
				allProject.style.display = 'none';
				ingProject.style.display = 'none';
				finProject.style.display = 'block';
            }
			
			// 프로젝트 생성
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
			
			// 프로젝트 기간 유효성검사
			var today = new Date().toISOString().split('T')[0];
			var start = document.getElementById("start");
		    var end = document.getElementById("end");
		    // 시작일 최소값 설정
		    start.min = today;
		    start.addEventListener("input", function () {
		        var inputDate = new Date(start.value);
		        // 종료일 최소값을 시작일 +1일, 최대값을 시작일 +364일로
		        var minDate = new Date(inputDate.getTime() + 86400000);
		        end.min = minDate.toISOString().split('T')[0];
		        var maxDate = new Date(inputDate.getTime() + 31536000000);
		        end.max = maxDate.toISOString().split('T')[0];
		    });
		</script>
	</body>
	
</html>