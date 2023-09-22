<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel="stylesheet" href="Component/styles.css">
<%@include file="Component/links.jsp"%>
</head>
<body>
	<%@include file="Component/navbar.jsp"%>
	<div class="container pt-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header bg-grey text-center" style="background-color:#36454F;">
						<h4 class="fw-bold pt-2" style="letter-spacing: 2px; color: #fff;">Registration</h4>
					</div>
					<div class="card-body">
						<div class="msg">
							<c:if test="${not empty msg}">
								<p class="text-center text-success">${msg}</p>
								<c:remove var="msg" />
							</c:if>
						</div>
						<form action="userRegister" method="post">
							<div class="mb-2">
								<label class="form-label">FullName</label> <input type="text"
									name="full_name" class="form-control"
									placeholder="enter your fullname" class="box" value="">
							</div>
							<div class="mb-2">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="text" name="email"
									placeholder="enter your email" class="form-control"
									id="exampleInputEmail1" value="">
							</div>
							<div class="mb-2">
								<label class="form-label">Phone Number</label> <input
									type="text" name="phone_no" class="form-control"
									placeholder="enter your PhoneNumber" value="">
							</div>
							<div class="mb-2">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" name="password"
									placeholder="enter your password" class="form-control"
									id="exampleInputPassword1">
							</div>
							<div class="mb-2">
								<label class="form-label">Confirm Password</label> <input
									type="password" name="cpassword"
									placeholder="confirm your password" class="form-control">
							</div>
							<button type="submit" name="register"
								class="btn col-md-12 mt-4" style="background-color:#36454F; color:#fff;">Register</button>
							<p class="text-center m-3">
								already have an account? <a href="login.jsp">login now</a>!
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>