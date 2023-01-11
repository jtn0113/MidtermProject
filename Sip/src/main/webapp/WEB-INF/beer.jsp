<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select a beer:</title>
<%@ include file="nav.jsp"%>
</head>
<body>

	<section class="gradient-custom">
		<div class="container py-5 h-100">
			<div class="row justify-content-center align-items-center h-100">
				<div class="col-12 col-lg-9 col-xl-7">
					<div class="card shadow-2-strong card-registration"
						style="border-radius: 15px;">
						<div class="card-body p-4 p-md-5">

							<h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Select a beer</h3>
							<%-- <div class="dropdown">
								<button class="btn btn-secondary dropdown-toggle" type="button"
									data-bs-toggle="dropdown" aria-expanded="false">
									Choose a beer</button>
								<ul class="dropdown-menu">
									<c:forEach var="beer" items="${beers}">
										<li><a class="dropdown-item" href="#">${beer.name}</a></li>
									</c:forEach>
								
								</ul>
							</div> --%>

							<form action="selectBeer.do" method="POST">

								<div class="row">
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<label for="brewType">Select Beer:</label> <select name="id"
												required>

												<c:forEach var="beer" items="${beers}">
													<option value="${beer.id}">${beer.name}</option>
												</c:forEach>
											</select>
										</div>

									</div>
								</div>
								<div class="row">
									<div class="col-md-6 mb-4 pb-2">

										<div class="mt-4 pt-2">
											<input class="btn btn-primary btn-lg" type="submit"
												value="Submit" />
										</div>
									</div>
								</div>
							</form>

							<h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Add a new beer</h3>
							<form action="beer.do" method="POST">

										<div class="row">
										<div class="col-md-6 mb-4 pb-2">

									<div class="form-outline">
											<label for="brewType">Beer Type:</label> <br><select
												name="brewType.id" required>
												<option value=1>Pilsner</option>
												<option value=2>Lager</option>
												<option value=3>IPA</option>
												<option value=4>Pale Ale</option>
												<option value=5>Stout</option>
												<option value=6>Porter</option>
												<option value=7>Bock</option>
											</select>
										</div>
								</div>

									</div>
									<div class="row">
										<div class="col-md-6 mb-4 pb-2">
											<div class="form-outline">
												<label for="abv">Brewing Company:</label> <input type="text"
													name="brewingCompany" required>


											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6 mb-4 pb-2">
											<div class="form-outline">
												<label for="name>">Name:</label><br> <input type="text"
													name="name" required>
											</div>

										</div>
									</div>

									<div class="row">
										<div class="col-md-6 mb-4 pb-2">
											<div class="form-outline">
												<label for="abv">ABV:</label><br> <input type="number"
													step="0.01" name="abv" required>


											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6 mb-4 pb-2">
											<div class="form-outline">
												<label for="originCity">Origin City:</label><br> <input
													type="text" name="originCity">
											</div>

										</div>
									</div>

									<div class="row">
										<div class="col-md-6 mb-4 pb-2">

											<div class="form-outline">
												<label for="originState">Origin State:</label><br> <input
													type="text" name="originState" required>

											</div>

										</div>
									</div>
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
											<label for="description">Description:</label>
											<textarea cols="50" rows="6" name="description"
												placeholder="Add your taste description here"></textarea>
											<!--add more creative lingo  -->
										</div>

									</div>


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