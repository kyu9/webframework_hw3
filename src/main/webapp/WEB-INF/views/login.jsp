<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link id="bootstrap-css"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<title>Login required</title>
</head>
<body>
	<div class="container">
		<div class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2"
			id="loginbox" style="margin-top: 50px;">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">Sign In</div>
				</div>
				<div class="panel-body" style="padding-top: 30px">
					<div class="alert alert-danger col-sm-12" id="login-alert"
						style="display: none"></div>
					<form class="form-horizontal" id="loginform" role="form"
						method="post" action="<c:url value="login"/>">
						<c:if test="${not empty errorMsg}">
							<div style="color: #ff0000">
								<h4>${errorMsg }</h4>
							</div>
						</c:if>
						<c:if test="${not empty logoutMsg}">
							<div style="color: #0000ff">
								<h4>${logoutMsg }</h4>
							</div>
						</c:if>
						<div class="input-group" style="margin-bottom: 25px">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span><input class="form-control"
								id="username" type="text" name="username" placeholder="userName" />
						</div>
						<div class="input-group" style="margin-bottom: 25px">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span><input class="form-control"
								id="password" type="password" name="password"
								placeholder="password" />
						</div>
						<div class="form-group" style="margin-top: 10px">
							<div class="col-sm-12 controls">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="submit"
									class="btn btn-success login" id="byn-login" value="로그인"
									readonly="readonly" style="float: right" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12 control"></div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>