<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Friends List</title>
<%@ include file="nav.jsp"%>
</head>
<body>

	<h2>Friends List</h2>

	<form action="friends.do" method="POST">
		<input type="hidden" name="id" value="${loggedInUser.id}"> <input
			type="hidden" name="friendId" value="${friend.id}">
		<div class="accordion accordion-flush"
			id="accordionFlushExample${friend.firstName }${friend.lastName}">
			<c:forEach var="friend" items="${friends}">
				<div class="accordion-item">
					<h2 class="accordion-header"
						id="flush-headingOne${friend.firstName }${friend.lastName}">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#flush-collapseOne${friend.firstName }${friend.lastName}"
							aria-expanded="false" aria-controls="flush-collapseOne">
							${friend.firstName} ${friend.lastName}</button>
					</h2>
					<div id="flush-collapseOne${friend.firstName }${friend.lastName}"
						class="accordion-collapse collapse"
						aria-labelledby="flush-headingOne${friend.firstName }${friend.lastName}"
						data-bs-parent="#accordionFlushExample${friend.firstName }${friend.lastName}">
						<div class="accordion-body">




							<section class="h-100 gradient-custom-2">
								<div class="container py-5 h-100">
									<div
										class="row d-flex justify-content-center align-items-center h-100">
										<div class="col col-lg-9 col-xl-7">
											<div class="card">
												<div class="rounded-top text-white d-flex flex-row"
													style="background-color: #000; height: 200px;">
													<div class="ms-4 mt-5 d-flex flex-column"
														style="width: 150px;">
														<img src="${friend.image }"
															alt="Generic placeholder image"
															class="img-fluid img-thumbnail mt-4 mb-2"
															style="width: 150px; z-index: 1">
													</div>
													<div class="ms-3" style="margin-top: 130px;">
														<h5>${friend.firstName } ${friend.lastName}</h5>
													</div>
												</div>
												<div class="p-4 text-black"
													style="background-color: #f8f9fa;">
													<%-- <div class="d-flex justify-content-end text-center py-1">
													<div>
														<p class="mb-1 h5">${beerTasting.size() }SIZE</p>
														<p class="small text-muted mb-0">Beer Entries</p>
													</div>
													<div class="px-3">
														<p class="mb-1 h5">1026</p>
														<p class="small text-muted mb-0">Followers</p>
													</div>
													<div>
														<p class="mb-1 h5">478</p>
														<p class="small text-muted mb-0">Following</p>
													</div>
												</div> --%>
												</div>
												<div class="card-body p-4 text-black">
													<div class="mb-5">
														<p class="lead fw-normal mb-1">About</p>
														<div class="p-4" style="background-color: #f8f9fa;">
															<p>${friend.aboutMe}</p>
															<p>
														</div>
													</div>
													<div
														class="d-flex justify-content-between align-items-center mb-4">
														<p class="lead fw-normal mb-0">Recent Journals</p>
													</div>
													<h3>Beer:</h3>
													<br>
													<c:forEach var="beerTasting" items="${friend.beerTasting }">
														<br>
														<strong>Name of Drink:</strong> ${beerTasting.beer.name}<br>
														<c:if test="${ not empty beerTasting.formattedDate }">
															<strong>Date Sampled:</strong> 	${beerTasting.formattedDate }<br>
														</c:if>
														<c:if test="${not empty beerTasting.rating }">
															<strong>Rating: ${beerTasting.rating } out of 10</strong>
															<br>
														</c:if>
														<c:if test="${not empty beerTasting.beer.brewType.name }">
															<strong>Type:</strong> ${beerTasting.beer.brewType.name } <br>
														</c:if>

														<c:if test="${not empty beerTasting.beer.originCity }">
															<strong>Origin City:</strong> ${beerTasting.beer.originCity } <br>
														</c:if>
														<c:if test="${not empty beerTasting.beer.originState }">
															<strong>Origin State:</strong> ${beerTasting.beer.originState } <br>
														</c:if>
														<c:if test="${not empty beerTasting.beer.abv }">
															<strong>ABV:</strong> ${beerTasting.beer.abv }% <br>
														</c:if>
														<c:if test="${not empty beerTasting.notes }">
															<strong>Notes:</strong> ${beerTasting.notes } <br>
														</c:if>
														<c:if test="${not empty beerTasting.beer.description }">
															<strong>Beer Description:</strong> ${beerTasting.beer.description }<br>
														</c:if>
														<c:if test="${not empty beerTasting.formattedPrice }">
															<strong>Price Per Glass:</strong> ${beerTasting.formattedPrice }<br>
														</c:if>
														<c:if test="${not empty beerTasting.photo }">
															<img class="drinkImage" src="${beerTasting.photo }">
															<br>

														</c:if>
													</c:forEach>
													<br>
													<h3>Wine:</h3>
													<br>
													<c:forEach var="wineTasting" items="${friend.wineTasting }">
														<strong>Name of Drink:</strong> ${wineTasting.wine.name}<br>
														<c:if test="${ not empty wineTasting.formattedDate }">
															<strong>Date Sampled:</strong> 	${wineTasting.formattedDate }<br>
														</c:if>
														<c:if test="${not empty wineTasting.rating }">
															<strong>Rating: ${wineTasting.rating } out of 10</strong>
															<br>
														</c:if>
														<c:if test="${not empty wineTasting.wine.wineType.name }">
															<strong>Type:</strong> ${wineTasting.wine.wineType.name } <br>
														</c:if>

														<c:if test="${not empty wineTasting.wine.vineyardName }">
															<strong>Vineyard :</strong> ${wineTasting.wine.vineyardName } <br>
														</c:if>
														<c:if
															test="${not empty wineTasting.wine.vineyardLocation }">
															<strong>Vineyard Location:</strong> ${wineTasting.wine.vineyardLocation } <br>
														</c:if>
														<c:if test="${not empty wineTasting.wine.abv }">
															<strong>ABV:</strong> ${wineTasting.wine.abv }% <br>
														</c:if>
														<c:if test="${not empty wineTasting.notes }">
															<strong>Notes:</strong> ${wineTasting.notes } <br>
														</c:if>
														<c:if test="${not empty wineTasting.wine.description }">
															<strong>Wine Description:</strong> ${wineTasting.wine.description }<br>
														</c:if>
														<c:if test="${not empty wineTasting.formattedPrice }">
															<strong>Price Per Glass:</strong> ${wineTasting.formattedPrice }<br>
														</c:if>
														<c:if test="${not empty wineTasting.photo }">
															<img class="drinkImage" src="${wineTasting.photo }">
														</c:if>
														<br>

													</c:forEach>
													<br>
													<h3>Spirit:</h3>
													<br>
													<c:forEach var="spiritTasting"
														items="${friend.spiritTasting }">
														<strong>Name of Drink:</strong> ${spiritTasting.spirit.name}<br>
														<c:if test="${ not empty spiritTasting.formattedDate }">
															<strong>Date Sampled:</strong> 	${spiritTasting.formattedDate }<br>
														</c:if>
														<c:if test="${not empty spiritTasting.rating }">
															<strong>Rating: ${spiritTasting.rating } out of
																10</strong>
															<br>
														</c:if>
														<c:if
															test="${not empty spiritTasting.spirit.spiritType.name }">
															<strong>Type:</strong> ${spiritTasting.spirit.spiritType.name } <br>
														</c:if>

														<c:if
															test="${not empty spiritTasting.spirit.originCountry }">
															<strong>Origin Country:</strong> ${spiritTasting.spirit.originCountry } <br>
														</c:if>
														<c:if
															test="${not empty spiritTasting.spirit.originStateProvince }">
															<strong>Origin State Province:</strong> ${spiritTasting.spirit.originStateProvince } <br>
														</c:if>
														<c:if test="${not empty spiritTasting.spirit.proof }">
															<strong>Proof:</strong> ${spiritTasting.spirit.proof } <br>
														</c:if>
														<c:if test="${not empty spiritTasting.notes }">
															<strong>Notes:</strong> ${spiritTasting.notes } <br>
														</c:if>
														<c:if
															test="${not empty spiritTasting.spirit.description }">
															<strong>Spirit Description:</strong> ${spiritTasting.spirit.description }<br>
														</c:if>
														<c:if test="${not empty spiritTasting.formattedPrice }">
															<strong>Price Per Glass:</strong> ${spiritTasting.formattedPrice }<br>
														</c:if>
														<c:if test="${not empty spiritTasting.photo }">
															<img class="drinkImage" src="${spiritTasting.photo }">
														</c:if>
														<br>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>
						</div>



						<br>

					</div>
				</div>
			</c:forEach>
		</div>

	</form>
</body>
</html>