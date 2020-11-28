<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 신청 조회</title>
<style>
table {
	border: 1px solid black;
	border-collapse: collapse;
}

td {
	text-align: center;
	border: 1px solid black;
	height: 20px;
	width: 100px;
}
a {
	color: black;
	text-decoration: none;
}
a:hover {
	background: #FFFF00;
}
</style>
</head>
<body>
	<h1>수강 신청 조회</h1>
	<table>
		<thead>
			<tr style="background-color: #008000; color:#FFFFFF;">
				<td>년도</td>
				<td>학기</td>
				<td>교과목명</td>
				<td>교과구분</td>
				<td>담당교수</td>
				<td>학점</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="subject" items="${subjects }">
				<tr>
					<td><c:out value="${subject.year }"></c:out></td>
					<td><c:out value="${subject.semester }"></c:out></td>
					<td><c:out value="${subject.subname }"></c:out></td>
					<td><c:out value="${subject.subtype }"></c:out></td>
					<td><c:out value="${subject.professor }"></c:out></td>
					<td><c:out value="${subject.score }"></c:out></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</br></br>
	</hr>
	<h2><a href="${pageContext.request.contextPath}/info">총 학점 조회로 돌아가기</a></h2>
</body>
</html>