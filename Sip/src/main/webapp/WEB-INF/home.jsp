<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<%@ include file="nav.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet" href="main.css">
</head>
<body>
	<div id="beer">
		<h1>Beer</h1>
	</div>


		<c:forEach var="beerTasting" items="${loggedInUser.beerTasting }">
			<div class="accordion" id="accordionExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingOne${beerTasting.id}">
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#panelsStayOpen-collapseOne${beerTasting.id}" aria-expanded="false"
							aria-controls="panelsStayOpen-collapseOne${beerTasting.id}">
							${beerTasting.beer.name } ${beerTasting.dateSampled } <br>

						</button>
					</h2>
					<div id="panelsStayOpen-collapseOne${beerTasting.id}"
						class="accordion-collapse collapse"
						aria-labelledby="panelsStayOpen-headingOne${beerTasting.id}">
						<div class="accordion-body">
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
							<c:if test="${not empty beerTasting.price }">
							<strong>Price Per Glass:</strong> ${beerTasting.price }
							</c:if>
							<c:if test="${not empty beerTasting.photo }">
								<img src="${beerTasting.photo }">
							</c:if>
						</div>
					</div>
				</div>

			</div>
		</c:forEach>

		<h1>Wine</h1>
		<div class="accordion" id="accordionPanelsStayOpenExample">
			<div class="accordion-item">
				<h2 class="accordion-header" id="panelsStayOpen-headingTwo">
					<button class="accordion-button" type="button"
						data-bs-toggle="collapse"
						data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="true"
						aria-controls="panelsStayOpen-collapseTwo">Accordion Item
						#1</button>
				</h2>
				<div id="panelsStayOpen-collapseTwo"
					class="accordion-collapse collapse show"
					aria-labelledby="panelsStayOpen-headingTwo">
					<div class="accordion-body">
						<strong>This is the first item's accordion body.</strong> It is
						shown by default, until the collapse plugin adds the appropriate
						classes that we use to style each element. These classes control
						the overall appearance, as well as the showing and hiding via CSS
						transitions. You can modify any of this with custom CSS or
						overriding our default variables. It's also worth noting that just
						about any HTML can go within the
						<code>.accordion-body</code>
						, though the transition does limit overflow.
					</div>
				</div>
			</div>


		</div>
		<h1>Spirit</h1>
		<c:forEach var="spiritTasting" items="${loggedInUser.spiritTasting }">
			<div class="accordion" id="accordionExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingOne${spiritTasting.id}">
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#panelsStayOpen-collapseOne${spiritTasting.id}" aria-expanded="false"
							aria-controls="panelsStayOpen-collapseOne${spiritTasting.id}">
							${spiritTasting.spirit.name } ${spiritTasting.dateSampled } <br>

						</button>
					</h2>
					<div id="panelsStayOpen-collapseOne${spiritTasting.id}"
						class="accordion-collapse collapse"
						aria-labelledby="panelsStayOpen-headingOne${spiritTasting.id}">
						<div class="accordion-body">
							<c:if test="${not empty spiritTasting.rating }">
								<strong>Rating: ${spiritTasting.rating } out of 10</strong>
								<br>
							</c:if>
							<c:if test="${not empty spiritTasting.spirit.spiritType.name }">
							<strong>Type:</strong> ${spiritTasting.spirit.spiritType.name } <br> 
							</c:if>

							<c:if test="${not empty spiritTasting.spirit.originCountry }">
							<strong>Origin Country:</strong> ${spiritTasting.spirit.originCountry } <br> 
							</c:if>
							<c:if test="${not empty spiritTasting.spirit.originStateProvince }">
							<strong>Origin State Province:</strong> ${spiritTasting.spirit.originStateProvince } <br> 
							</c:if>
							<c:if test="${not empty spiritTasting.spirit.proof }">
							<strong>Proof:</strong> ${spiritTasting.spirit.proof }% <br> 
							</c:if>
							<c:if test="${not empty spiritTasting.notes }">
							<strong>Notes:</strong> ${spiritTasting.notes } <br>
							</c:if>
							<c:if test="${not empty spiritTasting.spirit.description }">
							 <strong>Spirit Description:</strong> ${spiritTasting.spirit.description }<br>
							</c:if>										
							<c:if test="${not empty spiritTasting.price }">
							<strong>Price Per Glass:</strong> ${spiritTasting.price }
							</c:if>
							<c:if test="${not empty spiritTasting.photo }">
								<img src="${spiritTasting.photo }">
							</c:if>
						</div>
					</div>
				</div>

			</div>
		</c:forEach>

		</div>

</body>
</html>