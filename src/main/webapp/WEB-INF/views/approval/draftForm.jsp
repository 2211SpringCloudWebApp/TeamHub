<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>기안서</title>
		<link rel="stylesheet" href="../../../resources/css/approval/approvalDocuments.css">
		<link rel="stylesheet" href="../../../resources/css/approval/documentModal.css">
		<link rel="stylesheet" href="../../../resources/css/approval/requisitionForm.css">
		
 		<style type="text/css">
		#sideBar li:nth-child(8){
		    background-color: #2653e8ba;
  				
		}
		#sideBar li:nth-child(8) a{
			color: white !important;
		}
		#sideBar span{
				vertical-align: text-top !important;
		}
		#alram-count{
			left: 1079px !important;
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
				    <li><a href="/approval/tempDocuments">임시 저장함</a></li>
				</ul> 
			</div>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
				<form action="/approval/draftDocuments" method="GET">
				    <div class="cash-form-section">
				        <div class="cash-disbursement">
				            <table border=2>
				                <tr class="tr1">
				                    <td rowspan="2" colspan="4" class="formTitle">기 안 서</td>
				                    <td rowspan="2" style="width: 70px;">
				                        <span>결 재</span>
				                    </td>
				                    <td>최초승인자</td>
				                    <td>중간승인자</td>
				                    <td>최종승인자</td>
				                </tr>
				                <tr class="tr2">
				                   <td>
				                      <input type="text" value="" id="firstApprover" name="firstApprover" class="nameView" readonly>
				                      <input type="button" value="검색" class="searchMember" id="firstBtn" name="firstApprover" onclick="openApprovalModal('결재자');">
				                   </td>
				                   <td>
				                      <input type="text" value="" id="interimName" name="interimApprover" class="nameView" readonly>
				                      <input type="button" value="검색" class="searchMember" id="secondBtn" name="interimApprover" onclick="openApprovalModal('결재자');">
				                   </td>
				                   <td>
				                      <input type="text" value="" id="finalApprover" name="finalApprover" class="nameView" readonly>
				                      <input type="button" value="검색" class="searchMember" id="thirdBtn" name="finalApprover" onclick="openApprovalModal('결재자');">
				                   </td>
				                </tr>
				                <tr class="tr3">
				                    <td colspan="2">
				                        <button class="send-open" type="button" onclick="openApprovalModal('참조자');">수신참조자 +</button>
				                    </td>
				                    <td colspan="6">
				                       <textArea readonly name="referList" id="referList"></textArea>
				                    </td>   
				                </tr>
				                <tr class="tr4">
				                    <td>성 명</td>
				                    <td><input type="text" name="writerName" value="${user.userName}" readonly></td>
				                    <td>부 서</td>
				                    <td colspan="2"><input type="text" value="${user.deptName}" readonly></td>
				                    <td>직 급</td>
				                    <td colspan="2"><input type="text" value="${user.positionName}" readonly></td>
				                </tr>
				                <tr class="tr5">
				                    <td>제 목</td>
				                    <td colspan="8"><input type="text" name="loaTitle" id="loaTitle"></td>
				                </tr>
				                <tr class="tr6">
				                    <td colspan="8">상세내용</td>
				                </tr>
				                <tr class="tr7">
				                    <td colspan="8">
				                        <textarea name="loaContent" id="loaContent" cols="151px" rows="11px"></textarea>
				                    </td>
				                </tr>
				                <tr class="tr8">
				                    <td colspan="8">위와 같은 사유로, 검토 후 결재 바랍니다.</td>
				                </tr>
				                <tr class="tr9">
				                    <td colspan="8">
				                        <input type="text" id="today" readonly>
				                    </td>
				                </tr>
				                <tr class="tr10">
				                    <td colspan="8">
				                        <input type="button" name="proposer" id="proposer" value="서명" />
				                        신청자 : 
				                        <textArea name="proposerText" id="proposerText" readonly></textArea>
				                        (인)
				                    </td>
				                </tr>
				            </table>
				        </div>
				        <div id="button" style="display: flex; justify-content: space-around; margin-bottom: 50px;">
				           <input type="hidden" name="appKinds" value="품의서">
				           <button type="submit" class="goToLeave" style="width: 200px; height: 96px; font-size: 29px;">상신</button>
				           <input type="text" style="border: none; width: 40px;" disabled>
				           <button type="reset" class="resetLeave" style="width: 200px; height: 96px; font-size: 29px;" onclick="">취소</button>
				        </div>
				    </div>
				</form>
			</main>
			
			<!-- 결재 상신 버튼 클릭시 모달창 -->
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
		    <!-- 결재자 검색 버튼 클릭시 모달창 -->
		    <div id="modalApproval" class="modal-overlay">
		        <div class="modal-window">
					<div class="title">
		                <h2 id="title-h2"></h2>
		            </div>
					<div id="inner">
						<div id="searchUser">
							<form action="" method="">
								<select name="searchCondition" style="height: 30px;">
									<option value="all"     <c:if test="${searchCondition == 'all' }">selected</c:if>>전체</option>
									<option value="dept"    <c:if test="${searchCondition == 'dept' }">selected</c:if>>부서</option>
									<option value="position"   <c:if test="${searchCondition == 'position' }">selected</c:if>>직급</option>
									<option value="name" <c:if test="${searchCondition == 'name' }">selected</c:if>>이름</option>
								</select>
								<div>
									<input type="text" name="searchKeyword" value="${searchKeyword }" >
									<input type="submit" value="검색" style="width: 60px;">
								</div>
								<input type="hidden" name="userId" value="${sessionScope.user.userId }">
							</form>
						</div>
						
						<div id="selectUser" onclick="approvalUser();" style="cursor: pointer;">
							<table>
							 	<tr>
							 		<td>경영팀</td>
							 		<td>민봉식 회장</td>
							 	</tr>
							 	<tr>
							 		<td>경영팀</td>
							 		<td>박수정 부회장</td>
							 	</tr>
							 	<tr>
							 		<td>인사팀</td>
							 		<td>정기진 사장</td>
							 	</tr>
							 	<tr>
							 		<td>개발팀</td>
							 		<td>서정민 사장</td>
							 	</tr>
							 	<tr>
							 		<td>회계팀</td>
							 		<td>이유정 사장</td>
							 	</tr>
							 	<tr>
							 		<td>인사팀</td>
							 		<td>유현주 전무</td>
							 	</tr>
							 	<tr>
							 		<td>회계팀</td>
							 		<td>양민경 전무</td>
							 	</tr>
							 	<tr>
							 		<td>개발팀</td>
							 		<td>박상은 전무</td>
							 	</tr>
							 	<tr>
							 		<td>디자인팀</td>
							 		<td>김하얀 상무</td>
							 	</tr>
							 	<tr>
							 		<td>경영팀</td>
							 		<td>구기효 상무</td>
							 	</tr>
							 	<tr>
							 		<td>인사팀</td>
							 		<td>허민아 이사</td>
							 	</tr>
							 	<tr>
							 		<td>회계팀</td>
							 		<td>설석현 이사</td>
							 	</tr>
							 	<tr>
							 		<td>개발팀</td>
							 		<td>김진하 이사</td>
							 	</tr>
							 	<tr>
							 		<td>디자인팀</td>
							 		<td>김승현 부장</td>
							 	</tr>
							 	<tr>
							 		<td>경영팀</td>
							 		<td>전효성 부장</td>
							 	</tr>
							 	<tr>
							 		<td>인사팀</td>
							 		<td>이지환 부장</td>
							 	</tr>
							 	<tr>
							 		<td>회계팀</td>
							 		<td>박소현 부장</td>
							 	</tr>
							 	<tr>
							 		<td>개발팀</td>
							 		<td>황세원 부장</td>
							 	</tr>
							 	<tr>
							 		<td>경영팀</td>
							 		<td>김은지 부장</td>
							 	</tr>
							 	<tr>
							 		<td>인사팀</td>
							 		<td>김은지 부장</td>
							 	</tr>
							 	<tr>
							 		<td>회계팀</td>
							 		<td>김은지 부장</td>
							 	</tr>
							 	<tr>
							 		<td>개발팀</td>
							 		<td>박은서 차장</td>
							 	</tr>
							 	<tr>
							 		<td>디자인팀</td>
							 		<td>이수민 차장</td>
							 	</tr> 
							 	<tr>
							 		<td>경영팀</td>
							 		<td>박주혜 과장</td>
							 	</tr>
							 	<tr>
							 		<td>인사팀</td>
							 		<td>유현주 과장</td>
							 	</tr>
							 	<tr>
							 		<td>회계팀</td>
							 		<td>최민준 사원</td>
							 	</tr>
							 	<tr>
							 		<td>개발팀</td>
							 		<td>윤지연 사원</td>
							 	</tr>
							 	<tr>
							 		<td>디자인팀</td>
							 		<td>박세정 사원</td>
							 	</tr>
							 	<tr>
							 		<td>경영팀</td>
							 		<td>이정훈 사원</td>
							 	</tr>
							</table>
						</div>
						<div id="selectUserList" onclick="removeApproval();">
							
						
						</div>
						
						<div id="input-btn">
							<button type="button" onclick="closeApprovalModal();" style="background-color: #ffdea0;">
								<span>취소</span>
							</button>
							<button type="button" onclick="approvalUserAdd();" style="margin-left: 85px; background-color: #d2e8ff;">
								<span>확인</span>
							</button>
						</div>
					</div>
				</div>
		    </div>
		    <!-- ------------------------------------------------>
		    
		    
		</div>
	<script type="text/javascript">
	///////////////////// 모달창 ///////////////
	var modal = document.querySelector("#modal");
	var modalApproval = document.querySelector("#modalApproval");
    modal.style.display = "none";
    modalApproval.style.display ="none";
    
	function openModal(){
		  document.querySelector("body").style.overflow="hidden";
		  window.scrollTo(0,0);
	      modal.style.display = "flex";
	}
	function closeModal(){
		  document.querySelector("body").style.overflow="visible";
	      modal.style.display = "none";
	}
	function openApprovalModal(title){
		  $("#title-h2").html(title);
		  document.querySelector("body").style.overflow="hidden";
		  window.scrollTo(0,0);
		  modalApproval.style.display = "flex";
	}
	function closeApprovalModal(){
		  document.querySelector("body").style.overflow="visible";
		  modalApproval.style.display = "none";
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
	function approvalUserAdd(){
		$("#firstApprover").val("박수정");
		$("#interimName").val("정기진");
		$("#finalApprover").val("이유정");
		closeApprovalModal();
		$("#selectUserList").html("");
	}
	
    var checkNum = 0;
    function approvalUser(){
	   	var selectUserList = "";
    	if(checkNum == 0){
    		selectUserList += "박수정 부회장<br>";
			$("#selectUserList").html(selectUserList);
    	} else if(checkNum == 1){
    		selectUserList += "박수정 부회장<br>정기진 사장<br>";
			$("#selectUserList").html(selectUserList);
    	} else if(checkNum == 2){
    		selectUserList += "박수정 부회장<br>정기진 사장<br>서정민 사장<br>";
			$("#selectUserList").html(selectUserList);
    	} else if(checkNum == 3){
    		alert("3명만 선택하실 수 있습니다.")
    		checkNum--;
    	} 
    	checkNum++;
    }
    
    var checkNum2 = 0;
    function removeApproval(){
    	var selectUserList = "";
    	if(checkNum2 == 0){
    		selectUserList += "박수정 부회장<br>정기진 사장<br>";
			$("#selectUserList").html(selectUserList);
    	} else if(checkNum2 == 1){
    		selectUserList += "박수정 부회장<br>";
			$("#selectUserList").html(selectUserList);
    	} else if(checkNum2 == 2){
    		selectUserList += "";
			$("#selectUserList").html(selectUserList);
    	} 
    	checkNum2++;
    }
    </script>
    
    <!-- 오늘 날짜 스크립트 -->
	<script>
		const today = new Date();
		const year = today.getFullYear();
		const month = String(today.getMonth() + 1).padStart(2, '0');
		const day = String(today.getDate()).padStart(2, '0');
		var todayString = year + "-" + month + "-" + day;
		$("#today").val(todayString);
	</script>
    
	<!-- 서명 클릭 스크립트  -->
    <script>
       $("#proposer").one("click",function(){
           var proposerValue = $("input[name='writerName']").val();
        
           $("#proposerText").append(proposerValue);
       });
    </script>
    
	</body>
</html>