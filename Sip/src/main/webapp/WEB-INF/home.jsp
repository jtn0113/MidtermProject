<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet" href="main.css">
</head>
<body>
	<c:if test="${empty sessionScope.loggedInUser }">
				<li><a href="login.do">Log In</a></li>
			</c:if>
<nav>
	<ul>

		<li><a href="home.do">Home</a></li>
		<c:choose>
			<c:when test="${empty sessionScope.loggedInUser }">
				<li><a href="login.do">Log In</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="account.do">Account</a></li>
				<li><a href="logout.do">Log Out</a></li>
			</c:otherwise>
		</c:choose>

	</ul>
</nav>
</body>
</html>