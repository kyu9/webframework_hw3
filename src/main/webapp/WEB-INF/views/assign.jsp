<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 신청</title>
<style>
.formtable{
	border: 1px solid black;
}
.label{
	text-align: center;
}
.error {
	font-size: small;
	color: red;
	margin-left: 10px;
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
	<sf:form method="post"
		action="${pageContext.request.contextPath }/docreate"
		modelAttribute="subject">
		<table class="formtable">
			<tr>
				<td class="label">연도:</td>
				<td><sf:input type="text" path="year" placeholder="4자리숫자"/> <br />
					<sf:errors path="year" class="error" /></td>
			</tr>
			<tr>
				<td class="label">학기:</td>
				<td><sf:input type="text" path="semester" placeholder="1자리숫자"/> <br />
					<sf:errors path="semester" class="error" /></td>
			</tr>
			<tr>
				<td class="label">과목명:</td>
				<td><sf:input type="text" path="subname" /> <br />
					<sf:errors path="subname" class="error" /></td>
			</tr>
			<tr>
				<td class="label">과목구분:</td>
				<td><sf:input type="text" path="subtype" /> <br />
					<sf:errors path="subtype" class="error" /></td>
			</tr>
			<tr>
				<td class="label">담당교수:</td>
				<td><sf:input type="text" path="professor" /> <br />
					<sf:errors path="professor" class="error" /></td>
			</tr>
			<tr>
				<td class="label">학점:</td>
				<td><sf:input type="text" path="score" placeholder="1자리숫자" /> <br />
					<sf:errors path="score" class="error" /></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="수강신청하기"></td>
			</tr>
		</table>
	</sf:form>
	</br></br>
	</hr>
	<h2><a href="${pageContext.request.contextPath}/info">총 학점 조회로 돌아가기</a></h2>
</body>
</html>