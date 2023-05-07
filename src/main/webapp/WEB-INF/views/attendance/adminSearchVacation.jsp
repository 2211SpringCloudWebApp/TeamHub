<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>연차관리</title>
		<link rel="stylesheet" href="../../../resources/css/attendance/vacation.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
		<style type="text/css">
			#sideBar li:nth-child(3){
			    background-color: #2653e8ba;
   				
			}
			#sideBar li:nth-child(3) a{
				color: white !important;
			}
		</style>
	</head>
	<body>
		<div id="container">
			<jsp:include page="../common/sideBar.jsp"></jsp:include>
				<div id="subSideBar">
					<h2>근태관리</h2>
					<h4><a href="/attendance/mainView">근태관리</a></h4>
					<h4><a href="/vacation/mainView">연차관리</a></h4>
					<c:if test="${sessionScope.user.userType == 1 }">
						<h4><a href="/attendance/adminView">관리자(근태)</a></h4>
					</c:if>
					<c:if test="${sessionScope.user.userType == 1 }">
						<h4><a href="/attendance/adminVacation">관리자(연차)</a></h4>
					</c:if>
				</div>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
				<div id="main-container">
                    <div id="select">
                    	<form action="/admin/searchVacation" method="get">
	                        이름 : 
			                <input type="text" name="searchValue" value="${keyword }"placeholder="검색">
			                <input type="submit" id="search-btn" name="search-btn"value="검색">
                        </form>
                    </div>
                    <div id="list">
                        <table id="list-table" class="table">
                            <thead class="table-light">
                                <tr>
                                    <th>이름</th>
                                    <th>휴가종류</th>
                                    <th>사용일자</th>
                                    <th>사용일수</th>
                                    <th>사유</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${searchVList }" var="vacation" varStatus="i">
                            		<tr>
                            			<td>${vacation.userName }</td>
                            			<td>${vacation.vacationDivision }</td>
                            			<td>${vacation.vacationStart }~${vacation.vacationEnd }</td>
                            			<td>${vacation.vacationUsed }</td>
                            			<td>${vacation.vacationContent }</td>
                            		</tr>
                            	</c:forEach>
                            </tbody>
                            <tfoot>
                              <tr align="center">
                                  <td colspan="5">
                                      <c:if test="${pi.currentPage > 1 }">
										<a href="/admin/searchVacation?searchValue=${searchValue }&page=1"> &#10094;&#10094; </a>&nbsp;&nbsp;
									</c:if>
									<c:if test="${pi.currentPage > 1 }">
										<a href="/admin/searchVacation?searchValue=${searchValue }&page=${pi.currentPage -1 }"> &#10094; </a>
									</c:if>
									&nbsp;&nbsp;&nbsp;
									<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="page">
										<c:url var="pageUrl" value="/admin/searchVacation">
											<c:param name="page" value="${page }" />
											<c:param name="status" value="${status }" />
											<c:param name="searchValue" value="${searchValue }" />
										</c:url>
										<a href="${pageUrl }">${page }</a>&nbsp;&nbsp;&nbsp;&nbsp;
									</c:forEach>
									<c:if test="${pi.currentPage < pi.maxPage }">
										<a href="/admin/searchVacation?searchValue=${searchValue }&page=${pi.currentPage +1}"> &#10095; </a>&nbsp;&nbsp;
									</c:if>
									<c:if test="${pi.currentPage < pi.maxPage }">
										<a href="/admin/searchVacation?searchValue=${searchValue }&page=${pi.maxPage }"> &#10095;&#10095; </a>
									</c:if>
                                  </td>
                              </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
			</main>
		</div>
		
	</body>
</html>