<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Info</title>
<%@ include file="nav.jsp"%>

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

							<form action="editInformation.do" method="POST">
								<input type="hidden" name="userId" value="${loggedInUser.id}">

								<div class="row">
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
											<label for="firstName>">First Name:</label><br> <input
												type="text" name="firstName"
												value="${loggedInUser.firstName }">
										</div>

									</div>
								</div>
								<div class="row">
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
											<label for="lastName">Last Name:</label><br> <input
												type="text" name="lastName"
												value="${loggedInUser.lastName }">


										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
											<label for="username">Username:</label><br> <input
												type="text" name="username"
												value="${loggedInUser.username }" required>
										</div>

									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
											<label for="password">Password:</label><br> <input
												type="text" name="password"
												value="${loggedInUser.password }" required>
										</div>

									</div>
								</div>
								<div class="row">
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
											<label for="aboutMe">About Me:</label><br>
											<textarea cols="50" rows="6" name="description"
												value="${loggedInUser.aboutMe}"></textarea>
											<!--add more creative lingo  -->
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 mb-4 pb-2">

										<div class="form-outline">
											<label for="image">Profile Photo:</label><br> <input
												type="text" name="image">
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