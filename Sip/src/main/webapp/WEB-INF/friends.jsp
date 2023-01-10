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
	<br>
	<br>
	<br>
	<br> Profile Page

	<input type="hidden" name="friend" value="${friend.id}">
	<c:forEach var="friend" items=${friends }>
${friends.firstName }
</c:forEach>


	<%-- <section class="h-100 gradient-custom-2">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-lg-9 col-xl-7">
        <div class="card">
          <div class="rounded-top text-white d-flex flex-row" style="background-color: #000; height:200px;">
            <div class="ms-4 mt-5 d-flex flex-column" style="width: 150px;">
              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-profiles/avatar-1.webp"
                alt="Generic placeholder image" class="img-fluid img-thumbnail mt-4 mb-2"
                style="width: 150px; z-index: 1">

            </div>
            <div class="ms-3" style="margin-top: 130px;">
              <h5>${friend.firstName} ${friend.lastName}</h5>
              <!-- <p>New York</p> -->
            </div>
          </div>
          <div class="p-4 text-black" style="background-color: #f8f9fa;">
            <div class="d-flex justify-content-end text-center py-1">
              <div>
                <p class="mb-1 h5">${friend.beerTasting.size() }Testing Size</p>
                <p class="small text-muted mb-0">Beer</p>
              </div>
              <div class="px-3">
                <p class="mb-1 h5">${friend.wineTasting.size() }Testing Size</p>
                <p class="small text-muted mb-0">Wine Journals</p>
              </div>
              <div>
                <p class="mb-1 h5">${friend.spiritTasting.size() } Testing Size</p>
                <p class="small text-muted mb-0">Spirit Journals</p>
              </div>
            </div>
          </div>
          <div class="card-body p-4 text-black">
            <div class="mb-5">
              <p class="lead fw-normal mb-1">About</p>
              <div class="p-4" style="background-color: #f8f9fa;">
             	${friend.aboutMe }
              </div>
            </div>
            <div class="d-flex justify-content-between align-items-center mb-4">
              <p class="lead fw-normal mb-0">Recent Journals</p>
              <!-- <p class="mb-0"><a href="#!" class="text-muted">Show all</a></p> -->
            	<c:forEach var="beer" items="${friend.beerTasting }">
            	</c:forEach>
            	${friend.wineTasting }<br>
            	${friend.spiritTasting }<br>
            </div>
           
   
          </div>
       </div>
     </div>
    </div>
  </div>
</section> --%>









</body>
</html>