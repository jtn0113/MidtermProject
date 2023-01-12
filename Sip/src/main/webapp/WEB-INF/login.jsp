
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="login">
<head>
<meta charset="UTF-8">

<title>Login Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet" href="main.css">
</head>
<body>
	<section class="h-100 gradient-form" >
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-xl-10">
					<div class="card rounded-3 text-black">
						<div class="row g-0">
							<div class="col-lg-6">
								<div class="card-body p-md-5 mx-md-4">

									<div class="text-center">
										<img src="https://i.imgur.com/chsxQSO.jpg"
											style="width: 185px;" alt="logo"> 
										<h4 class="mt-1 mb-5 pb-1">Welcome to Sip.</h4>
									</div>

									<form action="login.do" method="POST">
										<p>Please login to your account</p>

										<br>

										<c:if test="${errorMessage != null}">
											<div class="alert alert-danger" role="alert">
												${errorMessage}</div>
										</c:if>

										<div class="form-outline mb-4">
											<input type="text" id="form2Example11" class="form-control"
												placeholder="enter username" name="username" /> <label
												class="form-label" for="form2Example11">Username</label>
										</div>

										<div class="form-outline mb-4">
											<input type="password" id="form2Example22" name="password"
												class="form-control" /> <label class="form-label"
												for="form2Example22">Password</label>
										</div>

										<div class="text-center pt-1 mb-5 pb-1">
											<button
												class="btn btn-primary btn-block fa-lg mb-3" id = "gradient"
												type="submit">Log in</button>
											
										</div>

										<div
											class="d-flex align-items-center justify-content-center pb-4">
											<p class="mb-0 me-2">Don't have an account?</p>
											<a href="register.do"><button type="button"
													class="btn btn-outline-danger">Create new</button></a>
										</div>

									</form>

								</div>
							</div>
							<div class="col-lg-6 d-flex align-items-center gradient-custom-2">
								<div class="
								text-black px-3 py-4 p-md-5 mx-md-4 bio" id="bio">
									<h4 class="mb-4">What you sippin' on?</h4>
									<p class="small mb-0">Discover, explore, and journal all of
										your favorite ‘Sips’ while out and about! Life’s too short to
										forget about that one amazing beer you had, that one time, at
										that one place, with what friends again? You’re better than
										that! With Sip., you can record and save all of the details
										surrounding those great beers, wines, or spirits you’ve tried
										along the way so while your memory may be a little fuzzy, Sip.
										remembers what you were sippin’ on.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>