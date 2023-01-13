<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select a wine</title>
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


							<h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Select a Wine</h3>

							<form action="selectWine.do" method="POST">

								<div class="row">
									<div class="col-md-6 mb-4">

										<div class="form-outline">
											<label for="wineType">Select Wine:</label> <select name="id"
												required>

												<c:forEach var="wine" items="${wines}">
													<option value="${wine.id}">${wine.name}</option>
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


							<h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Add a new wine</h3>

							<form action="wine.do" method="POST">

										<div class="row">
									<div class="col-md-6 mb-4">

									<div class="form-outline">
											<label for="wineType">Wine Type:</label><br> <select
												name="wineType.id" required>
												<option value=1>Pinot Noir</option>
												<option value=2>Merlot</option>
												<option value=3>Cabernet Sauvignon</option>
												<option value=4>Chardonnay</option>
												<option value=5>Pinot Grigio</option>
												<option value=6>Moscato</option>
												<option value=7>Rosé</option>
											</select>
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
													<label for="vineyardName">Vineyard Name:</label><br>
													<input type="text" name="vineyardName">
												</div>

											</div>
										</div>

								<div class="row">
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
													<label for="vineyardLocation">Vineyard Location:</label><br>
													<input type="text" name="vineyardLocation" required>
												</div>

											</div>
										</div>
										<div class="row">
											<div class="col-md-6 mb-4 pb-2">

												<div class="form-outline">
													<label for="description">Description:</label><br>
													<textarea cols="50" rows="6" name="description"
														placeholder="Add taste description here"></textarea>
													<!--add more creative lingo  -->
												</div>

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