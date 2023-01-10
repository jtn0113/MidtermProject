<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Confirm Beer</title>
<%@ include file="nav.jsp"%>

</head>
<body>
<h3 id="delete"><Strong>Was this drink that forgettable?</Strong></h3>
<form action="deleteBeer.do">
<input type="hidden" name="id" value="${beerTasting.id}"> 
<button type="submit" class="btn btn-outline-danger">Delete</button>
</form>

<a href="home.do"><button type="button" class="btn btn-outline-warning">NO, I want to keep it</button></a>



</body>
</html>