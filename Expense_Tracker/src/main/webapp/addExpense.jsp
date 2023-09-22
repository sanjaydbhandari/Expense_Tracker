<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Expense</title>
<link rel="stylesheet" href="Component/styles.css">
<%@ include file="../Component/links.jsp"%>
<link rel="stylesheet" href="../Component/styles.css">
</head>
<body>

	<c:if test="${empty loginUser}">
		<p class="text-center text-success">${msg}</p>
		<c:redirect url="login.jsp" />
	</c:if>


	<%@include file="../Component/navbar.jsp"%>

	<div class="container pt-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-white text-center" style="background-color:#36454F;">
						<h4 class="fw-bold pt-2" style="letter-spacing: 2px;">Add
							Expense</h4>
					</div>

					<div class="card-body">
						<!--Message -->
						<div class="msg">
							<c:if test="${not empty msg}">
								<p class="text-center text-success">${msg}</p>
								<c:remove var="msg" />
							</c:if>
						</div>
						<form action="addExpense" method="post">
							<div class="mb-2">
								<label for="exampleInputTitle1" class="form-label">Title
								</label> <input type="text" name="title" placeholder="enter your title"
									class="form-control" id="exampleInputTitle1" value="">
							</div>
							<div class="mb-2">
								<label for="exampleInputTime1" class="form-label">Date</label> <input
									type="date" name="date" class="form-control"
									id="exampleInputTime1">
								<div class="mb-2">
									<label for="exampleInputTime1" class="form-label">Time</label>
									<input type="time" name="time" class="form-control"
										id="exampleInputTime1">
								</div>
							</div>
							<div class="mb-2">
								<label for="exampleInputDescription1" class="form-label">Description</label>
								<input type="text" name="description" class="form-control"
									id="exampleInputDescription1">
							</div>
							<div class="mb-2">
								<label for="exampleInputPrice1" class="form-label">Price</label>
								<input type="text" name="price" class="form-control"
									id="exampleInputPrice1">
							</div>
							<button type="submit" name="Add"
								class="btn col-md-12" style="background-color:#36454F; color:#fff;">Add</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>