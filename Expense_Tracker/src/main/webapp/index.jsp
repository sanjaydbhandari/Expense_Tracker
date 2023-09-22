<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expense Tracker</title>
<link rel="stylesheet" href="Component/styles.css">
<%@ include file="../Component/links.jsp"%>
</head>
<body>
	<%@include file="../Component/navbar.jsp"%>
	<!--Message -->
	<div class="msg">
		<c:if test="${not empty msg}">
			<p class="text-center text-success">${msg}</p>
			<c:remove var="msg" />
		</c:if>
	</div>

	<div id="carouselExampleControls" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="Images/Banner/ex1.jpg" class="d-block w-100"
					alt="expense1" height="500px">
			</div>
			<div class="carousel-item">
				<img src="Images/Banner/ex2.jpg" class="d-block w-100"
					alt="expense2" height="500px">
			</div>
			<div class="carousel-item">
				<img src="Images/Banner/ex3.jpg" class="d-block w-100"
					alt="expense3" height="500px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<!-- Card -->
	<div class="row p-2"  style="color:#FAF0E6;">
		<div class="col-sm-6">
			<div class="card" >
				<div class="card-body" style="background-color:#36454F;">
					<h5 class="card-title">Add Expense</h5>
					<p class="card-text">effortlessly store your daily expenses</p>
					<a href="addExpense.jsp" class="btn col-md-12 text-white" style="background-color:#FB8B24;">Add</a>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="card">
				<div class="card-body" style="background-color:#36454F;">
					<h5 class="card-title">View Expense</h5>
					<p class="card-text">comprehensive view of your financial activities</p>
					<a href="viewExpense.jsp" class="btn col-md-12 text-white " style="background-color:#FB8B24;">View</a>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../Component/footer.jsp"%>
</body>
</html>