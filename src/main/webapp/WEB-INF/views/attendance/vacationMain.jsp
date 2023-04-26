<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<h4><a href="#">연차관리</a></h4>
				</div>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
				<div id="main-container">
                    <div id="select">
                        검색일 <select name="searchYear" id="searchYear">
                            <option value="">2023</option>
                            <option value="">2022</option>
                            <option value="">2021</option>
                            <option value="">2020</option>
                        </select>
                        <input type="submit" id="search-btn" name="search-btn"value="검색">
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
                                <tr>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>1</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="btn">
                        <h3>2020년도 조회</h3>
                        <input type="button" id="vacation-btn" value="연차신청">
                    </div>
                    <div id="list">
                        <table id="list-table" class="table">
                            <thead class="table-light">
                                <tr>
                                    <th>No</th>
                                    <th>휴가종류</th>
                                    <th>사용일자</th>
                                    <th>사용일수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>연차</td>
                                    <td>2023-04-20~2023-04-20</td>
                                    <td>1.0</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
			</main>
		</div>
	</body>
</html>