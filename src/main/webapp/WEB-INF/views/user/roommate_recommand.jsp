<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="resources/css/bootstrap.min.css"> 
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">

<link rel="stylesheet" type="text/css" href="resources/user/css/roommate_recommand.css">

<style type="text/css">

.allview {
	float:right;
}
.page-header span {
	
	float: right;
}


/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 15% auto; /* 15% from the top and centered */
  padding: 20px;
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}


</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>




<title>부동산 필수앱 모방</title>
</head>
<jsp:include page="/WEB-INF/views/user/header.jsp" />
<body>

<div class="jumbotron text-center" id="headblock" style="background-color:#33558B;">
  <h1 style="color: white;">룸메이트 추천</h1>
</div>

<div class="container">
  <div class="page-header">
    <h3 class="text-center">취향저격 룸메이트</h3>  
  </div>
  
  
	<div>
	<c:choose>
		<c:when test="${empty list }">
			<div class="p-2 border">최근 본 방이 없습니다</div>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list }" var="dto" varStatus="status">
				<div class="card" style="width:23%">
				    <img class="card-img-top" src="resources/user/img/cat4.png" alt="Card image" style="width:100%">
				    <div class="card-body">
					    <h4 class="card-title">${dto.email }</h4>
					    <p class="card-text">${dto.recentFv }, ${status.index}</p>
				    </div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</div>
  
  	
  	
  	<div class="page-header">
  		<h3 class="text-center">관심있는 방이 같은 룸메이트 </h3>
  			
  		<p class="text-right"><a href="#">모두 보기</a></p>
    	
    </div>
    
    
    <div>
	<c:choose>
		<c:when test="${empty list }">
			<div class="p-2 border">최근 본 방이 없습니다</div>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list }" var="dto" varStatus="status">
				<div class="card" style="width:23%">
				    <img class="card-img-top" src="resources/user/img/cat4.png" alt="Card image" style="width:100%">
				    <div class="card-body">
					    <h4 class="card-title">${dto.email }</h4>
					    <p class="card-text">${dto.recentFv }, ${status.index}</p>
				    </div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</div>
  	
  	
  	
  	
  	<div class="page-header">
    	<h3 class="text-center">신규로 등록한 룸메이트</h3>
    	<p class="text-right"><a href="#">모두 보기</a></p>
    </div>
    
    
    <div>
	<c:choose>
		<c:when test="${empty list }">
			<div class="p-2 border">최근 등록한 룸메가 없습니다</div>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list }" var="dto" varStatus="status">
				<div class="card" style="width:23%">
				    <img class="card-img-top" src="resources/user/img/cat4.png" alt="Card image" style="width:100%">
				    <div class="card-body">
					    <h4 class="card-title">${dto.email }</h4>
					    <p class="card-text">${dto.recentFv }, ${status.index}</p>
				    </div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</div>
  	
  	           
</div>


<br/><br/>
<br/><br/>
<br/><br/>
<br/><br/>



<div class="container">
	<!-- Trigger/Open The Modal -->
	<button id="myBtn">룸메 자세히 보기</button>
	
	<!-- The Modal -->
	<div id="myModal" class="modal">
	
	  <!-- Modal content -->
	  <div class="modal-content">
	    <span class="close">&times;</span>
	    <p>룸메에 관련된 정보를 담을 거다...</p>
	  </div>
	
	</div>

</div>

<!-- 오늘 죽어도 페이징과 썸네일형 게시판 구현한다잉... 화이팅!  -->

<div class="container">
<h2> 값의 개수에 따라 변하는... div 태그의 갯수</h2>




</div>



<script type="text/javascript">


//Get the modal
var modal = document.getElementById("myModal");

//Get the button that opens the modal
var btn = document.getElementById("myBtn");

//Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

//When the user clicks on the button, open the modal
btn.onclick = function() {
modal.style.display = "block";
}

//When the user clicks on <span> (x), close the modal
span.onclick = function() {
modal.style.display = "none";
}

//When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
if (event.target == modal) {
  modal.style.display = "none";
}
}


</script>



<%@ include file="form/user_footer.jsp" %>



</body>
</html>