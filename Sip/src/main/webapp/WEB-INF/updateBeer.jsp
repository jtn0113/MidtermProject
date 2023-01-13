<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateBeer</title>
<%@ include file="nav.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet" href="main.css">
</head>
<body>
<h1>Update Your Profile Information:</h1>
	<section class="gradient-custom">
		<div class="container py-5 h-100">
			<div class="row justify-content-center align-items-center h-100">
				<div class="col-12 col-lg-9 col-xl-7">
					<div class="card shadow-2-strong card-registration"
						style="border-radius: 15px;">
						<div class="card-body p-4 p-md-5">

							<h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Account Information</h3>

							<form action="editBeer.do" method="POST">
								<input type="hidden" name="beerId" value="${beerTasting.id}">

								<div class="row">
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
											<label for="notes>">Notes:</label><br> <input
												type="text" name="notes"
												value="${beerTasting.notes }">
										</div>

									</div>
								</div>
								<div class="row">
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
											<label for="price">Price:</label><br> <input
												type="number" name="price" step="0.01"
												value="${beerTasting.price }" required>


										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
											<label for="rating">Rating:</label><br> <input
												type="number" name="rating" min = 0  max = 10
												value="${beerTasting.rating }">
										</div>

									</div>
								</div>

 								<div class="row">
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
											<label for="dateSampled">Date Sampled:</label><br> <input
												type="date" name="dateSampled"
												value="${beerTasting.dateSampled }" required>
										</div>

									</div>
								</div> 
				
								<div class="row">
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
												<textarea cols="50" rows="6" name="photo"
												> ${beerTasting.photo} </textarea>
										</div>

									</div>
								</div>

								<div class="mt-4 pt-2">
									<input class="btn btn-primary btn-lg" type="submit"
										value="Update" />
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