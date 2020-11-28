<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
	<title>웹프레임워크 과제3</title>
	<style>
		#toInfo {
			color: black;
			font-size: 3.0em;
			text-decoration: none;	
			background: #FFFF00;
		}
		#alogout {
			color: red;
			font-size: 1.0em;
			font-weight: bold;
			text-decoration: none;
			background: #efefef;		
		}
	</style>
</head>
<body>
	<h1 style="text-align: center;">웹 프레임워크 과제3</h1>
	<h2 style="text-align: center;"> 1692116 심규도</h2>
	</br></br></br>
	</hr>
	<div style="text-align:center;">
		<p> <a id="toInfo" href="${pageContext.request.contextPath}/info"> 학점 조회 사이트로 이동 </a> </p>
	</div>
	
		<!-- loginform  / html의 form태그를 사용할때는 토큰 값을 꼭 넣어줘야한다.-->
	<div style="text-align:center;">
		<c:if test="${pageContext.request.userPrincipal.name != null}">
		<a id="alogout" href="javascript:document.getElementById('logout').submit()">Logout</a>
	</c:if>
	</div>
	
	<form id="logout" action="<c:url value="/logout" />" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
</body>
</html>
