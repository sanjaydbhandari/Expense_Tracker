<nav class="navbar navbar-expand-lg navbar-dark" style="background-color:#FB8B24;">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-wallet"></i> Expense Tracker</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp"><i class="fa-solid fa-home"></i> Home</a></li>

				<c:if test="${not empty loginUser}">
					<li class="nav-item active"><a class="nav-link active"
						href="addExpense.jsp"><i class="fa-solid fa-plus"></i> Add
							Expense</a></li>
					<li class="nav-item active"><a class="nav-link active"
						href="viewExpense.jsp"><i class="fa-solid fa-list"></i> View
							Expense</a></li>
				</c:if>
				
			</ul>
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0 ">

				<c:if test="${not empty loginUser}">
					<li class="nav-item active"><a class="nav-link active"
						href="#"><i class="fa-solid fa-circle-user"></i>
							${loginUser.fullName}</a></li>
					<li class="nav-item active"><a class="nav-link active"
						href="logout"><i class="fa-solid fa-right-to-bracket"></i>
							LogOut</a></li>
				</c:if>
				<c:if test="${empty loginUser}">
					<li class="nav-item active"><a class="nav-link active"
						href="login.jsp"><i class="fa-solid fa-right-to-bracket"></i>
							LogIn</a></li>
					<li class="nav-item active"><a class="nav-link active"
						href="register.jsp"><i class="fa-solid fa-circle-user"></i>Register</a></li>
				</c:if>

			</ul>
		</div>
	</div>
</nav>
