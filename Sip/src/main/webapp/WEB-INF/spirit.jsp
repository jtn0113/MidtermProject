<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select a spirit:</title>
<%@ include file="nav.jsp"%>
</head>
<body>


	<section class="vh-100 gradient-custom">
		<div class="container py-5 h-100">
			<div class="row justify-content-center align-items-center h-100">
				<div class="col-12 col-lg-9 col-xl-7">
					<div class="card shadow-2-strong card-registration"
						style="border-radius: 15px;">
						<div class="card-body p-4 p-md-5">
							
							<h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Select a Spirit</h3>

							<form action="selectSpirit.do" method="POST">

								<div class="row">
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<label for="spiritType">Select Spirit:</label> <select
												name="id" required>

												<c:forEach var="spirit" items="${spirits}">
													<option value="${spirit.id}">${spirit.name}</option>
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
							
							<h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Add a new spirit</h3>
							<form action="spirit.do" method="POST">

										<div class="row">
										<div class="col-md-6 mb-4 pb-2">

									<div class="form-outline">
											<label for="spiritType.id">Spirit Type:</label><br> <select
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
									</div>
									<div class="row">
									<div class="col-md-6 mb-4 pb-2">
										<div class="form-outline">
											<label for="name>">Name:</label><br><input type="text"
												name="name" required>
										</div>

									</div>
								</div>
								<div class="row">
									<div class="col-md-6 mb-4 pb-2">
										<div class="form-outline">
											<label for="proof">Proof:</label> <br><input type="number"
												name="proof" required>


										</div>
</div>
									</div>
																	<div class="row">
									<div class="col-md-6 mb-4 pb-2">
										<div class="form-outline">
											<label for="originCountry">Origin Country:</label> <br><input
												type="text" name="originCountry">
										</div>

									</div>
								</div>

												<div class="row">
									<div class="col-md-6 mb-4 pb-2">
										<div class="form-outline">
											<label for="originStateProvince">Origin State or Province:</label><br> <input
												type="text" name="originStateProvince" required>

										</div>
</div>
									</div>
											<div class="row">
									<div class="col-md-6 mb-4 pb-2">
										<div class="form-outline">
											<label for="description">Description:</label> <br><textarea cols="50"
											rows="6" name="description"
												placeholder="Add your taste description here"></textarea>
											<!--add more creative lingo  -->
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-4 pb-2">
										<div class="form-outline">
											<label for="imageUrl">Image URL:</label><br> <input type="text"
												name="imageUrl">
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