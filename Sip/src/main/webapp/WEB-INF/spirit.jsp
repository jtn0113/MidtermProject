<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select a spirit:</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet" href="main.css">
</head>
<body>


	<section class="vh-100 gradient-custom">
		<div class="container py-5 h-100">
			<div class="row justify-content-center align-items-center h-100">
				<div class="col-12 col-lg-9 col-xl-7">
					<div class="card shadow-2-strong card-registration"
						style="border-radius: 15px;">
						<div class="card-body p-4 p-md-5">
							<h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Registration Form</h3>
							<form action="spirit.do" method="POST">

								<div class="row">
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<label for="spiritType.id">Spirit Type:</label> <select
												name="spiritType.id" required>
												<option value="1">Whiskey</option>
												<option value="2">Bourbon</option>
												<option value="3">Vodka</option>
												<option value="4">Gin</option>
												<option value="5">Rum</option>
												<option value="6">Tequila</option>
												<option value="7">Scotch</option>
											</select>
										</div>

									</div>
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<label for="name>">Name:</label> <input type="text"
												name="name" required>
										</div>

									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-4 d-flex align-items-center">

										<div class="form-outline datepicker w-100">
											<label for="proof">Proof:</label> <input type="number"
												name="proof" required>


										</div>

									</div>
									<div class="col-md-6 mb-4 d-flex align-items-center">

										<div class="form-outline datepicker w-100">
											<label for="originCountry">Origin Country:</label> <input
												type="text" name="originCountry">
										</div>

									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
											<label for="originStateProvince">Origin State or Province:</label> <input
												type="text" name="originStateProvince" required>

										</div>

									</div>
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
											<label for="description">Description:</label> <input
												type="text" name="description"
												placeholder="Add your taste description here">
											<!--add more creative lingo  -->
										</div>

									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
											<label for="imageUrl">Image URL:</label> <input type="text"
												name="imageUrl">
										</div>

									</div>

									<div class="mt-4 pt-2">
										<input class="btn btn-primary btn-lg" type="submit"
											value="Submit" />
									</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>



</body>
</html>