<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="Component/styles.css">
<%@include file="Component/links.jsp"%>
</head>
<body>
	<%@include file="Component/navbar.jsp"%>
	<div class="container pt-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-white text-center" style="background-color:#36454F;">
						<h4 class="fw-bold pt-2" style="letter-spacing: 2px;">Log In</h4>
					</div>

					<div class="card-body">
						<div class="msg">
							<c:if test="${not empty msg}">
								<p class="text-center text-danger">${msg}</p>
								<c:remove var="msg" />
							</c:if>
						</div>
						<form action="login" method="post">
							<div class="mb-2">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" name="email"
									placeholder="enter your email" class="form-control"
									id="exampleInputEmail1" value="">
							</div>
							<div class="mb-2">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" name="password"
									placeholder="enter your password" class="form-control"
									id="exampleInputPassword1">
							</div>
							<p class="pt-2">
								forgot your password don't worry? <a id="forgotpass"
									href="emailrecovery.jsp">forgot password</a>
							</p>
							<button type="submit" name="login"
								class="btn col-md-12" style="background-color:#36454F; color:#fff;">login</button>
							<p class="text-center m-2">
								don't have an account? <a href="register.jsp">Register</a>
							</p>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>