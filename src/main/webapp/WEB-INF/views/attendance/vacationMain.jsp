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
                    	<form action="/vacation/search" method="get">
	                        검색일 <select name="searchCondition" id="searchCondition">
		                             <option value="2023" <c:if test="${searchVacation.searchCondition == '2023' }">selected</c:if>>2023</option>
		                            <option value="2022" <c:if test="${searchVacation.searchCondition == '2022' }">selected</c:if>>2022</option>
		                            <option value="2021" <c:if test="${searchVacation.searchCondition == '2021' }">selected</c:if>>2021</option>
		                            <option value="2020" <c:if test="${searchVacation.searchCondition == '2020' }">selected</c:if>>2020</option>
		                        </select>
	                        <input type="submit" id="search-btn" name="search-btn"value="검색">
                        </form>
                    </div>
                    <div id="total">
                        <table id="total-table" class="table">
                            <thead class="table-light">
                                <tr>
                                    <th>총연차</th>
                                    <th>사용연차</th>
                                    <th>잔여연차</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:set var="totalVacationUsed" value="0" />
                            <c:set var="vacationCount" value="${vList[0].vacationCount}" />
                            <c:forEach items="${vList}" var="vacation">
							    <c:set var="totalVacationUsed" value="${totalVacationUsed + vacation.vacationUsed}" />
							</c:forEach>
	                                <tr>
	                                    <td>15</td>
	                                    <td><c:out value="${totalVacationUsed}" /></td>
	                                    <td>${vacationCount}</td>
	                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="btn">
                        <h3><span id="selectedYear">${searchVacation.searchCondition}</span>년도 조회</h3>
                        <input type="button" id="vacation-btn" value="연차신청" onclick="location.href='/approval/leaveRequestForm'">
                    </div>
                    <div id="list">
                        <table id="list-table" class="table">
                            <thead class="table-light">
                                <tr>
                                    <th>No</th>
                                    <th>휴가종류</th>
                                    <th>사용일자</th>
                                    <th>사용일수</th>
                                    <th>사유</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${vList }" var="vacation" varStatus="i">
                            		<tr>
                            			<td>${i.count }</td>
                            			<td>${vacation.vacationDivision }</td>
                            			<td>${vacation.vacationStart }~${vacation.vacationEnd }</td>
                            			<td>${vacation.vacationUsed }</td>
                            			<td>${vacation.vacationContent }</td>
                            		</tr>
                            	</c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
			</main>
		</div>
		
		<script>
			const selectedYear = document.getElementById('searchCondition').value;
			document.getElementById('selectedYear').textContent = selectedYear;
		</script>
	</body>
</html>