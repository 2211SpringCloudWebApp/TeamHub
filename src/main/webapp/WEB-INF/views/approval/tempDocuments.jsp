<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>임시 저장함</title>
		<link rel="stylesheet" href="../../../resources/css/approval/approvalDocuments.css">
		<link rel="stylesheet" href="../../../resources/css/approval/documentModal.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		<style type="text/css">
		#sideBar li:nth-child(8){
		    background-color: #2653e8ba;
  				
		}
		#sideBar li:nth-child(8) a{
			color: white !important;
		}
		</style>
	</head>
	
	<body>
		<div id="container">
			<!-- 일정 등록시 모달창 띄우기 -->
		    <div id="modal" class="modal-overlay">
		        <div class="modal-window">
					<div class="title">
		                <h2>문서양식</h2>
		            </div>
					<div id="inner">
						<div id="input-main">
							<select name="document" id="document">                     <!-- name : 키-->
				                <option value="requisition">품의서</option>
				                <option value="leaveRequest">휴가신청서</option>
				                <option value="expenseResolution">지출결의서</option>
				                <option value="draft">기안서</option>         <!-- value : 값-->
				            </select>
						</div>
						
						<div id="input-btn">
							<button type="button" onclick="closeModal();" style="background-color: #ffdea0;">
								<span>취소</span>
							</button>
							<button type="button" onclick="approvalAdd();" style="margin-left: 17px; background-color: #d2e8ff;">
								<span>확인</span>
							</button>
						</div>
					</div>
				</div>
		    </div>
		    <!-- ------------------------------------------------>
		    
			<jsp:include page="../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
				<h1>전자결재</h1>
				<button class="approvalAddBtn" onclick="openModal();">결재상신</button>
				<ul>
				    <li><a href="/approval/draftDocuments">기안 문서함</a></li>
				    <li><a href="/approval/approvalDocuments">결재 문서함</a></li>
				    <li><a href="/approval/referenceDocuments">참조 문서함</a></li>
				    <li style="color: #275ab5;"><a href="/approval/tempDocuments">임시 저장함</a></li>
				</ul> 
			</div>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
				<div class="mainDiv">
				  <h2>기안 문서함</h2>
				  
				  <table class="table table-hover">
				  	<colgroup>
					    <col style="width: 15%;">
					    <col style="width: 15%;">
					    <col style="width: 60%;">
					    <col style="width: 10%;">
					</colgroup>
					<thead>
				      <tr>
				        <th>생성일</th>
				        <th>문서양식</th>
				        <th>제목</th>
				        <th>결재상태</th>
				      </tr>
				    </thead>
				    
				    <tbody>
						<tr>
							<td>2023-04-22</td>
							<td>품의서</td>
							<td>품의서_테스트</td>
							<td>임시</td>
						</tr>
						<tr>
							<td>2023-04-22</td>
							<td>지출결의서</td>
							<td>지출결의서입니다_수정</td>
							<td>임시</td>
						</tr>
						
						<tr>
							<td>2023-04-25</td>
							<td>휴가신청서</td>
							<td>휴가신청서입니다!!!!</td>
							<td>임시</td>
						</tr>
						<tr>
							<td>2023-04-27</td>
							<td>지출결의서</td>
							<td>지출결의서입니다_수정</td>
							<td>임시</td>
						</tr>
						<tr>
							<td>2023-05-01</td>
							<td>기안서</td>
							<td>기안서..</td>
							<td>임시</td>
						</tr>
						<tr>
							<td>2023-05-03</td>
							<td>품의서</td>
							<td>품의서_최종2</td>
							<td>임시</td>
						</tr>
				    </tbody>
				    
				    <tfoot>
		 				<tr align="center">
							<td colspan="4">
								<!--'<' 누르면 현재페이지 -1 한 페이지를 보여주기 -->
								<c:if test="${pi.currentPage - 1 != 0}">
									<a href="/approval/draftDocuments?page=${pi.currentPage - 1 }" class="naviBtn"> ◀️ </a>
								</c:if>
								<c:if test="${pi.currentPage - 1 == 0}">
									<a href="javascript:void(0)" class="naviBtn"> ◀️ </a> 
								</c:if>
								&nbsp;&nbsp;&nbsp;
								<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p" >
									<c:url var="pageUrl" value="/approval/draftDocuments">
										<c:param name="page" value="${p }"></c:param>
										<c:param name="searchKeyword" value="${progressMap.searchKeyword }"></c:param>
										<c:param name="searchCondition" value="${progressMap.searchCondition }"></c:param>
										<c:param name="progress" value="${progressMap.apprStatus}"></c:param> 
									</c:url>
									<a href="${pageUrl}">1&nbsp;&nbsp;&nbsp;</a>
								</c:forEach> 
								&nbsp;
								<!-- 현재페이지 + 1 이 최대페이지랑 똑같을때까지 '>' 이걸 보여주겠다 -->
								<c:if test="${pi.currentPage + 1 <= pi.maxPage}">
									<a href="/approval/draftDocuments?page=${pi.currentPage + 1 }" class="naviBtn"> ▶️ </a> &nbsp;&nbsp;
								</c:if>
								<!-- 근데 현재페이지가 최대페이지랑 같다면 a링크는 동작하지 x -->
								<c:if test="${pi.currentPage == pi.maxPage}">
									<a href="javascript:void(0)" class="naviBtn"> ▶️ </a>
								</c:if>
							</td>
						</tr> 
						<tr>
							<td colspan="4">
								<form action="/approval/draftDocuments" method="get">
									<select name="searchCondition" style="height: 30px;">
										<option value="all"     <c:if test="${progressMap.searchCondition == 'all' }">selected</c:if>>전체</option>
										<option value="form"    <c:if test="${progressMap.searchCondition == 'form' }">selected</c:if>>문서양식</option>
										<option value="title"   <c:if test="${progressMap.searchCondition == 'title' }">selected</c:if>>제목</option>
										<option value="content" <c:if test="${progressMap.searchCondition == 'content' }">selected</c:if>>내용</option>
									</select>
									<input type="text" name="searchKeyword" value="${progressMap.searchKeyword }" placeholder="검색어를 입력해주세요">
									<input type="submit" value="검색" style="width: 60px;">
									<input type="hidden" name="userId" value="${sessionScope.user.userId }">
									<input type="hidden" name="progress" value="${progressMap.apprStatus}">
								</form>
							</td>
						</tr>
					</tfoot>
				  </table>
				</div>
				
			</main>
		</div>
		
		
	<script type="text/javascript">
	///////////////////// 모달창 ///////////////
	var modal = document.querySelector("#modal");
    modal.style.display = "none";
    
	function openModal(){
		  document.querySelector("body").style.overflow="hidden";
		  window.scrollTo(0,0);
	      modal.style.display = "flex"
	}
	function closeModal(){
		  document.querySelector("body").style.overflow="visible";
	      modal.style.display = "none"
	}
    /////////////////////////////////////////////
    
	// 결재상신 - 문서 양식 선택 
	function approvalAdd(){
		var documentOptionValue = $("#document").find("option:selected").val();
		if(documentOptionValue == 'draft'){                     // 기안서
			location.href="/approval/draftForm";
		} else if(documentOptionValue == 'requisition'){        // 품의서
			location.href="/approval/requisitionForm"; 
		} else if(documentOptionValue == 'leaveRequest'){       // 휴가신청서
			location.href="/approval/leaveRequestForm";
		} else if(documentOptionValue == 'expenseResolution'){  // 지출결의서
			location.href="/approval/expenseResolutionForm";
		}
		
	}
	
	</script>	
	</body>
</html>