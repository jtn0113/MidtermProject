<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add a Spirit Journal Entry</title>
</head>
<body>
	Spirit Journal entry:

	<form action="spiritCreation" method="POST">
<!-- 		<label for="spiritType">Spirit Type:</label> <select name="spiritType"
			required>
			<option value="1">Whiskey</option>
			<option value="2">Bourbon</option>
			<option value="3">Vodka</option>
			<option value="4">Gin</option>
			<option value="5">Rum</option>
			<option value="6">Tequila</option>
			<option value="7">Scotch</option>
		</select> -->
	
		
		<label for="beverageType">What are you are sippin' on? </label>
		<input type="radio" name="beverageType" value="beer"> 
		<input type="radio" name="beverageType" value="wine"> 
		<input type="radio" name="beverageType" value="spirit"> 
		
		
	</form>

</body>
</html>