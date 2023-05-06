<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>휴가 신청서</title>
		<link rel="stylesheet" href="../../../resources/css/approval/approvalDocuments.css">
		<link rel="stylesheet" href="../../../resources/css/approval/documentModal.css">
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
		input{
			border: 0px;
			font-size: 20px;
   			text-align: center;
		}
		#radioType input{
			margin-right: 10px;
		}
		#radioType span{
			margin-right: 10px;
		}
		.tr10 td{
			text-align: right; 
			height: 100px; 
			padding-right: 50px;
		}
		.tr10 input{
			font-size:15px; 
			width:70px; 
			height:30px; 
			border: none; 
			text-align: center; 
			border-radius:20px; 
			margin-right:10px;
		}
		.tr10 textarea{
			width:130px; 
			border: none; 
			text-align: center; 
			resize: none; 
			font-size:24px; 
			margin-bottom:-42px;
		}
		.tr2 input{
			font-size: 15px;
		    width: 70px;
		    height: 25px;
		    text-align: center;
		    border: 1px solid gray;
		    background-color: #f0f0f0;
		    cursor: pointer;
		    margin: 11px;
		}
		.tr3 td:nth-child(1), .tr3 td:nth-child(2){
			height: 70px;
		}
		.tr3 td:nth-child(1) button{
			width: 200px;
		    height: 52px;
		    background-color: #f0f0f0;
		    border: 1px solid gray;
		    font-size: 22px;
		    cursor: pointer;
		}
		
		.tr3 td:nth-child(2) textArea{
			border:none;
			margin-bottom:-12px; 
			font-size:19px;
			width:600px; 
			height:60px; 
			resize: none;
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
				 <form action="${path}/approval/leaveApplication" method="post">
			       <div class="cash-form-section" style="height: 100%; width:68%; margin: 0 300px 0 300px;">
			           <div class="cash-disbursement" style="text-align: center; margin: 80px 200px 80px 0px; border: 2px solid black;">
			               <table border="2px" style="width: 100%; font-size: 20px; border-collapse: collapse;">
			                   <tr>
			                       <td rowspan="3" colspan="4" style="width: 300px; height: 140px; font-size: 40px; font-weight: 600;">휴 가 신 청 서</td>
			                       <td rowspan="3" style="width: 20px; padding-top: 30px; font-size: 25px;">결 재</td>
			                       <td style="height: 30px; width: 100px;">최초승인자</td>
			                       <td style="width: 100px;">중간승인자</td>
			                       <td style="width: 100px;">최종승인자</td>
			                   </tr>
			                   <tr class="tr1">
		                         <td id="firstA"> </td> 
		                         <td id="interimA"> </td>
		                         <td id="finalA"> </td>
			                   </tr>
			                   <tr class="tr2" style="height: 30px;">
		                            <td><input type="button" value="검색" class="searchMember" id="thirdBtn" name="finalApprover" onclick="openApprovalModal('결재자');"></td>
			                        <td><input type="button" value="검색" class="searchMember" id="thirdBtn" name="finalApprover" onclick="openApprovalModal('결재자');"></td>
			                        <td><input type="button" value="검색" class="searchMember" id="thirdBtn" name="finalApprover" onclick="openApprovalModal('결재자');"></td>
			                   </tr>
			                   <tr class="tr3">
				                    <td colspan="2">
				                        <button class="send-open" type="button" onclick="openApprovalModal();">수신참조자 +</button>
				                    </td>
				                    <td colspan="6">
				                       <textArea readonly name="referList" id="referList"></textArea>
				                    </td>   
				                </tr>
			                   <tr>
			                       <td style="height: 70px; width: 80px;">성 명</td>
			                       <td><input type="text" name="writerName"  value="${user.userName}" readonly></td>
			                       <td style="width: 80px;">부 서</td>
			                       <td><input type="text"  value="${user.deptName}" readonly></td>
			                       <td style="width: 80px;">직 급</td>
			                       <td colspan="3"><input type="text"  value="${user.positionName}" readonly></td>
			                   </tr>
			                   <tr>
			                       <td colspan="3" style="height: 70px; width: 80px;">비 상 연 락 망</td>
			                       <td colspan="5"><input type="text" id="userPhone" style="font-size: 20px; font-weight: 300;" readonly></td>
			                   </tr>
			                   <tr>
			                       <td colspan="3" style="height: 70px; width: 80px; font-size: 20px; font-weight: 300;">기 간</td>
			                       <td colspan="5">
			                         <input type="text">
			                       </td>
			                   </tr>
			                   <tr>
			                      <td style="width: 80px; height: 70px; font-family: 'InfinitySans-RegularA1'; font-size: 16px; font-weight: 600;">휴가 구분</td>
			                      <td colspan="8" id="radioType">
			                      	<input type="radio" name="vacation" checked="checked"><span>연차 </span>
			                      	<input type="radio" name="vacation"><span>반차 </span>
			                      	<input type="radio" name="vacation"><span>병가 </span> 
			                      	<input type="radio" name="vacation"><span>기타 </span> 
			                      </td>
			                   </tr>
			                   <tr>
			                       <td style="width: 80px;">세부사항</td>
			                       <td colspan="8">
			                           <input style="height: 300px;" type="text" value="">
			                       </td>
			                   </tr>
			                   <tr>
			                       <td colspan="8" style="text-align: center; height: 100px; border-bottom: none;">위와 같이 휴가를 신청하오니 허락하여 주시기 바랍니다.</td>
			                   </tr>
			                   <tr class="tr9" style="border: white;">
				                    <td colspan="8" style="text-align: center; height: 100px; border-left: 1px solid black; border-right: 1px solid black;">
				                        <input type="text" id="today" readonly style="text-align:center; font-size: 30px;">
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
									<input type="text" name="searchKeyword" value="${searchKeyword }" style="width: 150px;">
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
	var userPhone = "${user.userPhone}";
	const formattedPhoneNumber = userPhone.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
	$("#userPhone").val(formattedPhoneNumber);
	
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
		$("#firstA").html("박수정");
		$("#interimA").html("정기진");
		$("#finalA").html("이유정");
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