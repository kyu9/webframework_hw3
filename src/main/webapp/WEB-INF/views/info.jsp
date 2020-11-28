<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>총 수강 정보</title>
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
	<h1>현재까지의 학년/학기별 이수 총 학점</h1>
	<table>
		<thead>
			<tr style="background-color: #008000; color: #FFFFFF">
				<td>년도</td>
				<td>학기</td>
				<td>취득 학점</td>
				<td>상세보기</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>2016</td>
				<td>1</td>
				<td><c:out value="${s1 }" /></td>
				<td><a href="${pageContext.request.contextPath}/info/s1">링크</a></td>
			</tr>
			<tr>
				<td>2016</td>
				<td>2</td>
				<td><c:out value="${s2 }" /></td>
				<td><a href="${pageContext.request.contextPath}/info/s2">링크</a></td>
			</tr>
			<tr>
				<td>2017</td>
				<td>1</td>
				<td><c:out value="${s3 }" /></td>
				<td><a href="${pageContext.request.contextPath}/info/s3">링크</a></td>
			</tr>
			<tr>
				<td>2017</td>
				<td>2</td>
				<td><c:out value="${s4 }" /></td>
				<td><a href="${pageContext.request.contextPath}/info/s4">링크</a></td>
			</tr>
			<tr>
				<td>2020</td>
				<td>1</td>
				<td><c:out value="${s5 }" /></td>
				<td><a href="${pageContext.request.contextPath}/info/s5">링크</a></td>
			</tr>
			<tr>
				<td>2020</td>
				<td>2</td>
				<td><c:out value="${s6 }" /></td>
				<td><a href="${pageContext.request.contextPath}/info/s6">링크</a></td>
			</tr>
		</tbody>
		<tfoot>
			<tr style="background-color: #FFFF00">
				<td>총계</td>
				<td></td>
				<td><c:out value="${s1+s2+s3+s4+s5+s6}" /></td>
				<td></td>
			</tr>
		</tfoot>
	</table>
	<hr>
	<h2><a href="${pageContext.request.contextPath}/assign">수강 신청하기</a></h2>
	<h2><a href="${pageContext.request.contextPath}/detail">다음 학기 신청 조회</a></h2>
	<h2><a href="${pageContext.request.contextPath}/">메인으로 돌아가기...</a></h2>
	
</body>
</html>