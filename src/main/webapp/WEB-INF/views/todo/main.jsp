<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>업무관리</title>
		<link rel="stylesheet" href="../../../resources/css/todo/todo.css">
	</head>
	
	<body>
		<div id="container">
			<jsp:include page="../common/sideBar.jsp"></jsp:include>
			<div id="subSideBar">
				<h2>업무관리</h2>
				<h4><a href="#">할일/메모 목록</a></h4>
				<h4><a href="#">완료 목록</a></h4>
			</div>
			<jsp:include page="../common/header.jsp"></jsp:include>
			
			<main>
				<div id="main-container">
                    <div id="main-top">
                        <div id="today">
                            <div id="today-title">
                                <h3>Today</h3> 
                                <h4>+</h4>
                            </div>
                            <div id="today-list">
                                <table id="list-table">
                                    <tr>
                                        <td>ㅇㅇ</td>
                                    </tr>
                                    <tr>
                                        <td>ㅇㅇ</td>
                                    </tr>
                                    <tr>
                                        <td>ㅇㅇ</td>
                                    </tr>
                                    <tr>
                                        <td>ㅇㅇ</td>
                                    </tr>
                                    <tr>
                                        <td>ㅇㅇ</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div id="month">
                                <h3>Month</h3>
                            <div id="calendar">
                                여기는 달력
                            </div>
                        </div>
                    </div>
                    <div id="main-bottom">
                        <div id="memo-title">
                            <h3>Memo</h3>
                            <h4>+</h4>
                        </div>
                        
                        <div id="memo">
                            여기는 메모장
                        </div>
                    </div>
                
                </div>
			</main>
		</div>
	</body>
	
</html>