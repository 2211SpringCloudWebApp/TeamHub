<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
if (session.getAttribute("user") == null) {
	response.sendRedirect("/");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 조회</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<style type="text/css">


#sideBar li:nth-child(9) {
	background-color: #2653e8ba;
}

#sideBar li:nth-child(9) a {
	color: white !important;
}

#sideBar ul {
	padding: 0 !important;
}

.rereply-box {
	display: none;
}

/* 모달 스타일 */
.modal {
	display: none;
	position: fixed;
	z-index: 100;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: white;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid black;
	width: 500px;
}

.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}



#limit{
	width: 70px;
	height: 30px;
	 border-radius: 4px;
	back-ground: orange;
}
#container{
	float: left;
	width: 100%;
}
.rerepl{
	text-align:center;
	margin-top: 25px;
}
#rContent{
	width: 1100px;
}


</style>
</head>

<body>
	<div id="container">
		<jsp:include page="../../common/sideBar.jsp"></jsp:include>
		<div id="subSideBar">
			<h1>자유게시판</h1>
			<ul id="search">
				<li style="color: #275ab5"><a href="/free/list"><h5>자유게시판</h5></a></li>
				<li><a href="/notice/list"><h5>공지사항</h5></a></li>
				<c:if test="${sessionScope.user.userType eq 1}">
					<li><a href="/report/list"><h5>신고게시판</h5></a></li>
					<li><a href="/free/blacklist"><h5>정지 리스트</h5></a></li>
				</c:if>

			</ul>
		</div>
		<jsp:include page="../../common/header.jsp"></jsp:include>
		<main>
			<h1 data-freeno='${free.freeNo }' id="freeNo">상세 보기</h1>

			<!--모달창 안 버튼  -->
			<!-- 모달 버튼 -->
			<c:if test="${sessionScope.user.userId != free.userId}">
				<button class="btn btn-danger" onclick="openModal()">신고하기</button>
			</c:if>

			<!-- 모달 창 -->
			<div id="myModal" class="modal">
				<div class="modal-content">
					<span class="close" onclick="closeModal()">&times;</span> <select
						id="reportTitle">
						<option value="욕설">욕설</option>
						<option value="혐오발언">혐오발언</option>
						<option value="부적절 발언">부적절 발언</option>
						<option value="기타">기타</option>
					</select> <br> <br>
					<textarea id="reportContent" name="reportContent" rows="4"
						cols="50"></textarea>
					<br>
					<br>
					<button id="report" class="btn btn-danger" onclick="sendReport2()">신고완료</button>
				</div>
			</div>
			<div class="container">
					<table class="table table-hover">
						<tbody>
							<tr>
								<th>번호</th>
								<td>${free.freeNo }</td>
								<th>작성자</th>
								<td>${free.userId }
									<c:if
										test="${sessionScope.user.userType eq 1}">
										<button onclick="limit()" class="btn btn-danger">제한하기</button>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>첨부파일</th>
									<td><c:forEach items="${fileList }" var="freeFile">
									${freeFile.fileName }
									</c:forEach></td>
								<th>작성날짜</th>
								<td>${free.freeWriteDate }</td>
							</tr>
							<tr>
								<th>제목</th>
								<td>${free.freeTitle }</td>
								<th></th>
								<td></td>
							</tr>
							<tr>
								<td>${free.freeContent }</td>
								<th></th>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
					<!-- 댓글 등록 -->
					<table align="center" width="500" border="1" class="table table-hover">
						<tr>
							<td>${sessionScope.user.userId }</td>
						</tr>
						<tr>
							<td><textarea rows="3" cols="55" id="rContent"></textarea></td>
		
							<td><button id="rSubmit" class="btn btn-primary">등록하기</button>
						</tr>
					</table>
					<!-- 댓글 목록 -->
					<table class="table table-hover" align="center" border="1" id="replyTable">
						<thead>
<!-- 							<tr> -->
<!-- 								댓굴갯수  -->
<!-- 								<td colspan="4"></td> -->
<!-- 							</tr> -->
							<tr>
								<th width="50">댓글</th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td width="100"></td>
							</tr>
						</tbody>
		
						<tfoot id="tfoot">
							<tr class="rereply-box" id="rereplyBox">
								<td colspan='4'><input type="hidden"><span
									id="rereplyWriter">${sessionScope.user.userId }</span></td>
								<td colspan="4" ><input type="text"
									placeholder="내용 입력" id="rereplyContent"></td>
								<td><a href="#" id="rereply" class="btn btn-primary">등록</a></td>
							</tr>
							<!-- 대댓글 영역 -->
						</tfoot>
		
					</table>
			</div>
			<%-- 번호 : ${free.freeNo } <br> 제목 : ${free.freeTitle } <br> 작성자
			: ${free.userId }
			<c:if
				test="${sessionScope.user.userType eq 1}">
				<button id="limit" onclick="limit()" class="btn btn-warning">제한하기</button>
			</c:if>
			<br> 작성날짜 : ${free.freeWriteDate } <br> <br> 내용 :
			${free.freeContent } <br> 첨부파일 :
			<c:forEach items="${fileList }" var="freeFile">
					${freeFile.fileName }
				</c:forEach> --%>
			<div class="rerepl">
			<c:url var="fModify" value="/free/modifyView">
				<c:param name="freeNo" value="${free.freeNo }" />
			</c:url>
			<c:if test="${sessionScope.user.userId eq free.userId}">
				<a href="${fModify }"><button class="btn btn-primary">수정</button></a>
			</c:if>
			<c:if
				test="${sessionScope.user.userId eq free.userId or sessionScope.user.userType eq 1}">
				<a href="javascript:void(0);" onclick="removeCheck(${free.freeNo});"><button
						class="btn btn-warning">게시판 삭제</button></a>
			</c:if>
			</div>
			<!-- 댓글 영역 -->
			
			<script>
			
				// 사용자 게시판 제한
				function limit(){
					var userId = "${free.userId }";
					$.ajax({
					      type: 'POST',
					      url: '/free/limit',
					      data: { 
					        "userId" : userId
					      },
					      success: function(response) {
					       alert('제한 완료');
					      },
					      error: function(xhr, status, error) {
					        // 에러 발생 시 처리
					        alert('에러가 발생하였습니다.');
					      }
					    }); 
					
				}
			
				// 모달 열기
				function openModal() {
				  document.getElementById("myModal").style.display = "block";
				}
				// 모달 닫기
				function closeModal() {
				  document.getElementById("myModal").style.display = "none";
				}
				// 신고 보내기
				function sendReport() {
				  const category = document.getElementById("select").value;
				  const comment = document.getElementById("select2").value;
				  // TODO: 서버로 신고 내용 전송하는 코드 작성
				  closeModal(); // 신고 완료 후 모달 창 닫기
				}
			
					
				
					//신고
					  function sendReport2() {
						    // "내용", "id", "번호" 정보 가져오기
						    var number = "${free.freeNo }";
						    var id = "${sessionScope.user.userId }";
						    var title = $("#reportTitle").val();
						     var content = $("#reportContent").val();
						    // 서버로 데이터 전송하기
						    $.ajax({
						      type: 'POST',
						      url: '/report/send',
						      data: { 
						    	"reportTitle" : title,
						        "reportContent" : content,
						        "reportId" : id,
						        "boardNo": number
						      },
						      success: function(response) {
						        // 서버로부터 응답을 받았을 때 처리
						        alert('신고가 완료되었습니다.');
						        document.getElementById("myModal").style.display = "none";
						      },
						      error: function(xhr, status, error) {
						        // 에러 발생 시 처리
						        alert('에러가 발생하였습니다.');
						      }
						    }); 
						   
						    
						  }
					
				
					function removeCheck(freeNo){
						if(confirm("정말 삭제하시겠습니까?"))
						location.href="/free/remove?freeNo="+freeNo;
					}
					
					 const report = document.getElementById("report");
					  report.addEventListener("click", function() {
					    // TODO: 신고 게시판으로 이동하는 코드 작성
					  });
					  
					  //댓글
					  getReplyList();
					  function getReplyList(){
						  const freeNo = "${free.freeNo}";
						  $.ajax({
							  url : "/reply/list",
						 	  data : { "freeNo" : freeNo },
						 	  type : "get",
						 	  success : function(data){
						 		  $("#replyContent").text("댓글 (" + data.length +")");
						 		  const tableBody = $("#replyTable tbody");
						 		  tableBody.html("");
						 		  let tr;
						 		  let rWriter;
						 		  let rContent;
						 		  let rCreateDate;
						 		  let btnArea;
						 		  let reBtn;//대댓글 bt
						 		  if(data.length > 0) {
						 			  for(let i in data){
						 				  if(data[i].replyDepth == 0){
								 				  tr = $("<tr data-replyno = '"+data[i].replyNo+"'>");
								 				  rWriter = $("<td colspan='2'>").text(data[i].userId);
								 				  rContent = $("<td>").text(data[i].replyContent);
								 				  rCreateDate = $("<td>").text(data[i].replyCreateDate);
								 				  btnArea = $("<td>");
								 				  reBtn = $("<td>");
								 				  reBtn.append("<a href='#' class='btn btn-primary' onclick ='insertRereply()'>답글</a>");
								 				  if (data[i].userId === "${sessionScope.user.userId}") {
								 				      btnArea.append("<a href='javascript:void(0)' class='btn btn-primary' onclick='modifyReply(this, \""+data[i].replyContent+"\","+data[i].replyNo+");'>수정</a>")
								 				          .append("<a href='javascript:void(0)' class='btn btn-primary' onclick='removeReply("+data[i].replyNo+");'>삭제</a>");
								 				  }
								 				

								 				  tr.append(rWriter);
								 				  tr.append(rContent);
								 				  tr.append(rCreateDate); // tr 밑에 td 3개가 들어간 상태
								 				  tr.append(btnArea);
								 				  tr.append(reBtn);
								 				  tableBody.append(tr);
						 			  }else{
						 				 tr = $("<tr data-replyno = '"+data[i].replyNo+"'>");
						 				  rWriter = $("<td>").text(data[i].userId);
						 				  rContent = $("<td>").text(data[i].replyContent);
						 				  rCreateDate = $("<td>").text(data[i].replyCreateDate);
						 				  btnArea = $("<td>");
						 				  reBtn = $("<td>");
						 				  if (data[i].userId === "${sessionScope.user.userId}") {
						 				      btnArea.append("<a href='javascript:void(0)' class='btn btn-primary' onclick='modifyReply(this, \""+data[i].replyContent+"\","+data[i].replyNo+");'>수정</a>")
						 				          .append("<a href='javascript:void(0)' class='btn btn-primary' onclick='removeReply("+data[i].replyNo+");'>삭제</a>");
						 				  }
						 				
										  tr.append($("<tr>"));
						 				  tr.append(rWriter);
						 				  tr.append(rContent);
						 				  tr.append(rCreateDate); // tr 밑에 td 3개가 들어간 상태
						 				  tr.append(btnArea);
						 				  tr.append(reBtn);
						 				  tableBody.append(tr);
						 			  }
						 			  }
						 		  }
						 	  },
							  error : function(){
								  alert("AJAX 처리 실패! ㅠㅠ");
							  }
						  });
					  }
					  
					  function removeReply(replyNo){
						  $.ajax({
							  url : "/reply/delete",
							  data : { "replyNo" : replyNo},
							  type : "get",
							  success : function(data){
								  if(data == "1"){
									  alert("댓글 삭제 성공");
									  getReplyList();
								  }
							  },
							  error : function(){
								  alert("AJAX 처리 실패!!");
							  }
						  })
					  }
					  
					  function modifyReply(obj, replyContent, replyNo) {
						  if(document.getElementById('mBox') != null){
							  document.getElementById('mBox').remove();
						  }
						  let trModify = $("<tr id='mBox'>");
						  trModify.append("<td colspan='3'><input type='text' size='50' value='"+replyContent+"'></td>");
						  trModify.append("<td><button class='btn btn-primary' onclick='modifyReplyContent("+replyNo+", this);'>수정완료</button></td>");
						  if(document.getElementById('mBox') != null){
							  if(document.getElementById('mBox') != obj.parentElement.parentElement.nextElementSibling){
								  $(obj).parent().parent().after(trModify);							  							  
							  }							  
						  }else{
							  $(obj).parent().parent().after(trModify);
						  }
						  
					  }
					  
					  function modifyReplyContent(replyNo, obj){
						  const modifiedContent = $(obj).parent().prev().children().val();
						  $.ajax({
							  url : "/reply/modify",
							  data : { "replyNo" : replyNo, "replyContent" : modifiedContent },
							  type : "post",
							  success : function(data){
								 if(data == "1"){
									 alert("댓글 수정 성공");
									 getReplyList();
								 }else{
									 alert("실패 로그확인좀여 ㅜㅜ");
									 console.log(data);
								 }
							  },
							  error : function(){
								  alert("아약스 처리 실패!");
								  
							  }
						  });
					  }
					  
					$("#rSubmit").on("click", function(){
						const freeNo = "${free.freeNo}";
						const freeId = $("#rWriter").val();
						const rContent = $("#rContent").val();
						var id = "${sessionScope.user.userId}";
						$.ajax({
							url : "/reply/register",
							data : { 
								"freeNo" : freeNo ,
								"userId" : id,
								"replyContent" : rContent},
							type : "post",
							success : function(result){
								if(result == '1'){
									alert("댓글등록 성공");
								//	$("#rWriter").val("");
									$("#rContent").val("");
									getReplyList();
								}else{
									alert("[에러 발생] 로그 확인 필요")
									console.log(result);
								}
							},
							error : function(){
								alert("Ajax 실패! 관리자한테 문의ㄱㄱ");
							}
						})
					})
					
					//대댓글 아약스,자바스크립트
					function insertRereply(){
						let event = window.event;
						event.preventDefault();
						let rereplyWriteBtn = event.target;
						let replyBox = rereplyWriteBtn.parentElement.parentElement;
						let rereplyBox = document.getElementById('rereplyBox');
						if(replyBox.nextElementSibling == rereplyBox){
							rereplyBox.style.display = 'none';
							document.getElementById('tfoot').append(rereplyBox)
						}else{
							replyBox.after(rereplyBox);
							rereplyBox.style.display = 'block';							
						}
					}
					
					document.getElementById('rereply').addEventListener('click',function(e){
						e.preventDefault();
						let rereplyBox = e.target.parentElement.parentElement;
						let replyBox = rereplyBox.previousElementSibling; 
						let replyNum = replyBox.dataset.replyno;
						let rereplyWriter = document.getElementById('rereplyWriter').innerHTML;
						let rereplyContent = document.getElementById('rereplyContent').value;
						let freeNo = document.getElementById('freeNo').dataset.freeno;
						$.ajax({
							url : "/rereply/register",
							data : { 
								"freeNo" : freeNo ,
								"userId" : rereplyWriter,
								"replyContent" : rereplyContent,
								"replyParentNo" : replyNum},
							type : "post",
							success : function(result){
								if(result == '1'){
									alert("댓글등록 성공");
									$("#rWriter").val("");
									$("#rContents").val(""); 
									rereplyBox.style.display = 'none'
									document.getElementById('tfoot').append(rereplyBox);
									getReplyList();
								}else{
									alert("[에러 발생] 로그 확인 필요")
									console.log(result);
								}
							},
							error : function(){
								alert("Ajax 실패! 관리자한테 문의ㄱㄱ");
							}
						})
					});
				</script>
		</main>
	</div>
</body>

</html>