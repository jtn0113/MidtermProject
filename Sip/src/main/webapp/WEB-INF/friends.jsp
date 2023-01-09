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
<br>

<c:forEach var="friend" items="${friends}">
 ${friend.firstName} ${friend.lastName} 
 </c:forEach>
<%-- <div class="accordion accordion-flush" id="accordionFlushExample">
	<c:forEach var="friend" items="${friends}">
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingOne">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
       
        
        
      </button>
    </h2>
  
    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
    </div>
  </div>
  </c:forEach>
</div>
 --%>
</body>
</html>