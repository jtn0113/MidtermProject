<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select a beer:</title>
</head>
<body>

	<form action="beer.do" method="POST">
		<label for="brewType">Beer Type:</label> 
		<select name="brewType.id"
			required>
			<option value=1>Pilsner</option>
			<option value=2>Lager</option>
			<option value=3>IPA</option>
			<option value=4>Pale Ale</option>
			<option value=5>Stout</option>
			<option value=6>Porter</option>
			<option value=7>Bock</option>
		</select> 
		<label for="name>">Name:</label> <input type="text" name="name"
			required> <label for="abv">ABV:</label> <input type="number"
			step="0.01" name="abv" required> <label for="originCity">Origin
			City:</label> <input type="text" name="originCity"> <label
			for="originState">Origin State:</label> <input type="text"
			name="originState" required> <label for="description">Description:</label>
		<input type="text" name="description"
			placeholder="Add your taste description here">
		<!--add more creative lingo  -->

		<label for="imageUrl">Image URL:</label> <input type="text"
			name="imageUrl">

		<div class="mt-4 pt-2">
			<input class="btn btn-primary btn-lg" type="submit" value="Submit" />
		</div>
	</form>

</body>
</html>