<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>프로젝트 관리</title>
		<link rel="stylesheet" href="../../../resources/css/project/list.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
				<button class="createBtn" onclick="showModal();">프로젝트 생성</button>
				<ul>
					<li><a href="/project/list?status=all">전체 프로젝트</a></li>
					<li><a href="/project/list?status=working">진행 중인 프로젝트</a></li>
					<li><a href="/project/list?status=wait">대기 중인 프로젝트</a></li>
					<li><a href="/project/list?status=done">종료된 프로젝트</a></li>
	           </ul>
			</div>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
				<div id="contents-area">
					<h2 class="thProject">검색한 프로젝트</h2>
					<table id="ProjectList" class="table table-hover">
						<colgroup>
						    <col style="width: 10%;">
						    <col style="width: 30%;">
						    <col style="width: 15%;">
						    <col style="width: 15%;">
						    <col style="width: 15%;">
						    <col style="width: 15%;">
						</colgroup>
						<thead>
							<tr class="table-light">
								<th>번호</th>
								<th>프로젝트명</th>
								<th>책임자</th>
								<th>시작일</th>
								<th>종료일</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${sList}" var="project" varStatus="i">
								<tr>
									<td>${i.count }</td>
									<c:url var="pDetail" value="/project/detail">
										<c:param name="projectNo" value="${project.projectNo }"></c:param>
									</c:url>
									<td><a href="/project/detail/${project.projectNo }">${project.projectName }</a></td>
									<td>${project.userName }</td>
									<td>${project.projectStart }</td>
									<td>${project.projectEnd }</td>
									<td class="pstatus">${project.projectStatus }</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr align="center">
								<td colspan="6">
									<c:if test="${pi.currentPage > 1 }">
										<a href="/project/search?condition=${search.condition }&keyword=${search.keyword }&page=1"> &#10094;&#10094; </a>&nbsp;&nbsp;
									</c:if>
									<c:if test="${pi.currentPage > 1 }">
										<a href="/project/search?condition=${search.condition }&keyword=${search.keyword }&page=${pi.currentPage -1 }"> &#10094; </a>
									</c:if>
									&nbsp;&nbsp;&nbsp;
									<c:forEach begin="${pi.startNav }" end="${pi.endNav }" var="page">
										<c:url var="pageUrl" value="/project/search">
											<c:param name="page" value="${page }" />
											<c:param name="condition" value="${search.condition }" />
											<c:param name="keyword" value="${search.keyword }" />
										</c:url>
										<a href="${pageUrl }">${page }</a>&nbsp;&nbsp;&nbsp;&nbsp;
									</c:forEach>
									<c:if test="${pi.currentPage < pi.maxPage }">
										<a href="/project/search?condition=${search.condition }&keyword=${search.keyword }&page=${pi.currentPage +1}"> &#10095; </a>&nbsp;&nbsp;
									</c:if>
									<c:if test="${pi.currentPage < pi.maxPage }">
										<a href="/project/search?condition=${search.condition }&keyword=${search.keyword }&page=${pi.maxPage }"> &#10095;&#10095; </a>
									</c:if>
								</td>
							</tr>
							<tr>
								<td colspan="6" id="search-area">
									<form action="/project/search" method="get">
										<select name="condition" id="">
											<option value="all">전체</option>
											<option value="title">프로젝트명</option>
											<option value="manager">책임자</option>
										</select>
										<input type="text" id="" name="keyword" placeholder="검색어를 입력하세요">
										<input type="submit" value="검색">
									</form>
								</td>			
							</tr>
						</tfoot>
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
									<td><input type="text" id="ptitle" name="projectName"></td>
								</tr>
								<tr>
									<td>책임자</td>
									<td><input type="text"
										value="${user.userName }" readonly></td>
								</tr>
								<tr>
									<td>진행기간</td>
									<td><input type="date" id="start" name="projectStart">
										~ <input type="date" id="end" name="projectEnd"></td>
								</tr>
								<tr>
									<td colspan="2"><input type="submit" onclick="return checkValid();" value="등록"></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</main>
		</div>
		<script>
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
			start.addEventListener("input", function() {
				var inputDate = new Date(start.value);
				// 종료일 최소값을 시작일 +1일, 최대값을 시작일 +364일로
				var minDate = new Date(inputDate.getTime() + 86400000);
				end.min = minDate.toISOString().split('T')[0];
				var maxDate = new Date(inputDate.getTime() + 31536000000);
				end.max = maxDate.toISOString().split('T')[0];
			});
			
			// 등록 유효성 검사
			var ptitle = document.getElementById("ptitle");
			function checkValid() {
				if (ptitle.value === "") {
					alert("프로젝트명을 입력해 주세요");
					return false;
				} else if (start.value === "" || end.value === "") {
					alert("진행기간을 입력해 주세요");
					return false;
				} else {
					return true;
				}
			}
			
			// 페이지 로드 시 상태에 따른 색상 출력
 			window.addEventListener("load", function() {
 				// 클래스 이름이 "pstatus"인 요소들을 모두 선택
				var statusElements = document.querySelectorAll(".pstatus");
				for (var i = 0; i < statusElements.length; i++) {
					var statusElement = statusElements[i];
					if (statusElement.innerHTML === "진행") {
						statusElement.style.color = "#2653e8";
					} else if (statusElement.innerHTML === "종료") {
						statusElement.style.color = "#808080";
					}
				}
 			});
		</script>
	</body>
	
</html>