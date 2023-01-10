<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Confirm Spirit</title>
<%@ include file="nav.jsp"%>

</head>
<body>
<div class="deleteConfirm">
<h3 id="delete"><Strong>Was this drink that forgettable?</Strong></h3>
<form action="deleteSpirit.do">
<input type="hidden" name="id" value="${spiritTasting.id}"> 
<button type="submit" class="btn btn-outline-danger">Delete</button>
</form>

<a href="home.do"><button type="button" class="btn btn-outline-warning">NO, I want to keep it</button></a>

</div>
</body>
</html>