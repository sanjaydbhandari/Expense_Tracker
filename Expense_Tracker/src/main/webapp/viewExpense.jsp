<%@page import="com.sanjaybhandari.expensetracker.model.Expense"%>
<%@page import="java.util.List"%>
<%@page import="com.sanjaybhandari.expensetracker.util.HibernateUtil"%>
<%@page import="in.sanjaybhandari.expensetracker.dao.ExpenseDao"%>
<%@page import="com.sanjaybhandari.expensetracker.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--<%@ page isELIgnored="false"%>-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Expense</title>
<link rel="stylesheet" href="Component/styles.css">
<%@ include file="../Component/links.jsp"%>
</head>
<body>

	<c:if test="${empty loginUser}">
		<p class="text-center text-success">${msg}</p>
		<c:redirect url="login.jsp" />
	</c:if>

	<%@include file="../Component/navbar.jsp"%>
	<div class="container pt-5">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header text-white text-center" style="background-color:#36454F;">
						<h4 class="fw-bold pt-2" style="letter-spacing: 2px;">All Expense</h4>
					</div>
					
					<!--Message -->
						<div class="msg">
							<c:if test="${not empty msg}">
								<p class="text-center text-success">${msg}</p>
								<c:remove var="msg" />
							</c:if>
						</div>

					<table class="table">
						<thead>
							<tr>
								<th scope="col">Title</th>
								<th scope="col">Date</th>
								<th scope="col">Time</th>
								<th scope="col">Description</th>
								<th scope="col">Price</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
						<%
							User user = (User) session.getAttribute("loginUser");
							ExpenseDao expenseDao = new ExpenseDao(HibernateUtil.getSessionFactory());
							List<Expense> list= expenseDao.getAllExpenseByUser(user);
						 	System.out.println(list);
							
							for(Expense e:list)
							{
						%>
							<tr>
								<th scope="row"><%=e.getTitle()%></th>
								<td><%=e.getDate() %></td>
								<td><%=e.getTime()%></td>
								<td><%=e.getDescription() %></td>
								<td><%=e.getPrice()%></td>
								<td>
								<a href="editExpense.jsp?id=<%=e.getId() %>" class="btn btn-sm btn-success me-1">Edit</a>
								<a href="deleteExpense?id=<%=e.getId() %>" class="btn btn-sm btn-danger me-1">delete</a>
								</td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>




</body>
</html>