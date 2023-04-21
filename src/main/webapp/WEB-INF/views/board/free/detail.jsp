<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>상세 조회</title>
		<style>
		#sideBar ul{
			padding: 0 !important;
		}
		</style>
	</head>
	
	<body>
		<div id="container">
			<jsp:include page="../../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
				<h1>자유게시판 상세조회</h1> 
			</div>
			<jsp:include page="../../common/header.jsp"></jsp:include>
			<main>
				<h1>게시글 보기</h1>
				<button id="report">신고</button>
				번호 : ${free.freeNo } / 제목 : ${free.freeTitle } / 작성자 : ${free.userId }
				/ 작성날짜 : ${free.freeWriteDate }
				<br>
				내용 : ${free.freeContent }
				<br>
				첨부파일 : 
				<c:forEach items="${fileList }" var="freeFile">
					${freeFile.fileName }
				</c:forEach>
				<c:url var="fModify" value="/free/modifyView">
					<c:param name="freeNo" value="${free.freeNo }"/>
				</c:url>
				<a href="${fModify }">수정 페이지로 이동</a>
				<a href="javascript:void(0);" onclick="removeCheck(${free.freeNo});">게시판 삭제</a>
				
				<!-- 댓글 영역 -->
    				<!-- 댓글 등록 -->
    				<table align="center" width="500" border="1">
    					<tr>
    						<td>작성자</td>
    						<td><input type="text"id="rWriter" value="${sessionScope.user.userId }" readonly></td>
    					</tr>
    					<tr>
    						<td><textarea rows="3" cols="55" id="rContent"></textarea></td>
    						
    						<td><button id="rSubmit">등록하기</button>
    					</tr>
    				</table>
					<!-- 댓글 목록 -->
    				<table align="center" width="500" border="1" id="replyTable">
    					<thead>
    						<tr>
    					<!--댓굴갯수  -->
    							<td colspan="4"><b id="replyCount"></b></td>
    						</tr>
    					</thead>
    					<tbody>
    						<tr><td width="100"></td></tr>
    					</tbody>
    				</table>
				<script>
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
						 		  const tableBody = $("#replyTable tbody");
						 		  tableBody.html("");
						 		  let tr;
						 		  let rWriter;
						 		  let rContent;
						 		  let rCreateDate;
						 		  let btnArea;
						 		  if(data.length > 0) {
						 			  for(let i in data){
						 				  tr = $("<tr>");
						 				  rWriter = $("<td width='100'>").text(data[i].userId);
						 				  rContent = $("<td>").text(data[i].replyContent);
						 				  rCreateDate = $("<td width='100'>").text(data[i].replyCreateDate);
						 				  tr.append(rWriter);
						 				  tr.append(rContent);
						 				  tr.append(rCreateDate);
						 				  tableBody.append(tr);
						 			  }
						 		  }
						 	  },
							  error : function(){
								  alert("AJAX 처리 실패! ㅠㅠ");
							  }
						  });
					  }
					  
					$("#rSubmit").on("click", function(){
						const freeNo = "${free.freeNo}";
						const freeId = $("#rWriter").val();
						const rContent = $("#rContent").val();
						$.ajax({
							url : "/reply/register",
							data : { 
								"freeNo" : freeNo ,
								"userId" : freeId,
								"replyContent" : rContent},
							type : "post",
							success : function(result){
								if(result == '1'){
									alert("댓글등록 성공");
									$("#rWriter").val("");
									$("#rContents").val("");
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
				</script>
			</main>
		</div>
	</body>
	
</html>