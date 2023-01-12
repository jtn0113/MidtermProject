<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet" href="main.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<nav class="navbar navbar-dark bg-dark fixed-top">
		<div class="container-fluid">
		<a href="home.do"><img class="logo" src="https://i.imgur.com/chsxQSO.jpg" style="width: 40px;" style="height: 60px;" alt="logo">
			</a><a class="navbar-brand" href="home.do">Sip.</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar"
				aria-controls="offcanvasDarkNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1"
				id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
				<div class="offcanvas-header">
					<h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">Welcome, ${loggedInUser.firstName}!
						</h5>
					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="offcanvas" aria-label="Close"></button>
				</div>
				<div class="offcanvas-body">
					<img src="${loggedInUser.image }" alt="Profile Picture"
														class="img-fluid img-thumbnail mt-4 mb-2"
														style="width: 150px; z-index: 1">
					<form action="search.do" class="d-flex mt-3" role="search">
						<input type="hidden" name="userId" value="${loggedInUser.id}">
						<input class="form-control me-2" type="search"
							placeholder="Search Beverage By Name" aria-label="Search" name="searchTerm">
						<button class="btn btn-success" type="submit">Search</button>
					</form>
					
					<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="home.do">Home</a></li>
						<li class="nav-item"><a class="nav-link active" href="account.do">Account</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> New Tasting
						</a>
							<ul class="dropdown-menu dropdown-menu-dark">
								<li><a class="dropdown-item" href="findAllBeers.do">Beer</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="findAllSpirits.do">Spirit</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="findAllWines.do">Wine</a></li>
								
							</ul></li>
							
							<li class="nav-item"><a class="nav-link active" href="friends.do">Friends</a></li>
							
							<c:if test="${loggedInUser.role == 'ADMIN'}">
							<li class="nav-item"><a class="nav-link active" href="manageUsers.do">Manage Users</a></li>
							
							</c:if>
							
							<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="logout.do">Logout</a></li>
					</ul>
					
					
				
				</div>
			</div>
		</div>
	</nav>

<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>