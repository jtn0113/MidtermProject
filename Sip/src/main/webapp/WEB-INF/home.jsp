<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<%@ include file="nav.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet" href="main.css">
</head>
<body>
	<nav>

<br>
<br>
<br>



<ul>
			<li><a href="home.do">Home</a></li>
</ul>
			<c:choose>
				<c:when test="${empty sessionScope.loggedInUser }">
		<ul>
					<li><a href="login.do">Log In</a></li>
		</ul>
				</c:when>
				<c:otherwise>
<ul>				
					<li><a href="account.do">Account</a></li>
					<li><a href="logout.do">Log Out</a></li>
					</ul>
					What are you sippin' on?
					<input type="radio" name ="type" value="beer">Beer			
					<input type="radio" name = "type" value="wine">Wine		
					<input type="radio" name ="type" value="spirit">Spirit
	<button type="submit" class="btn btn-outline-primary btn-rounded" data-mdb-ripple-color="dark">Submit</button>
							
				</c:otherwise>
			</c:choose>

	</nav>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>