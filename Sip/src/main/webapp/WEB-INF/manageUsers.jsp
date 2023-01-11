<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="nav.jsp"%>
</head>
<body id="admin">


	<c:forEach var="activeUser" items="${activeUsers}">
		<form action="deactivate.do">
		<input type="hidden" name="id" value="${activeUser.id}">
			${activeUser.firstName} ${activeUser.lastName}
			 <br>
		
		
			<button type="submit" class="btn btn-danger">Deactivate User</button>
		
		</form>
	</c:forEach>
	
	<c:forEach var="deactivatedUser" items="${deactivatedUsers}">
		<form action="activate.do">
		<input type="hidden" name="id" value="${deactivatedUser.id}">
			${deactivatedUser.firstName} ${deactivatedUser.lastName}
			 <br>
		
		
			<button type="submit" class="btn btn-success">Activate User</button>
		
		</form>
	</c:forEach>


</body>
</html>