<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="resources/css/bootstrap.min.css"> 
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">

<link rel="stylesheet" type="text/css" href="resources/user/css/reset.css">
<link rel="stylesheet" type="text/css" href="resources/user/css/roommate_recommand.css">

<style type="text/css">

ul {
 margin-bottom: 0;
}


#headblock{
	margin-top: 186px;
}

.container{
	padding-top: 20px;
}

.jumbotron {
    padding: 6rem 2rem;
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
<%@ include file="form/user_header.jsp" %>
</head>
<body>



<!-- rgb(51, 85, 139) 모방 메인색깔 -->


<div class="jumbotron text-center" id="headblock" style="background-color:#33558B;">
  <h1 style="color: white;">룸메이트 추천</h1>
</div>

<div class="container">
  <div class="page-header">
    <h3 class="text-center">취향저격 룸메이트</h3>  
  </div>           
</div>

<div class="container">
  <div class="row">
    <div class="col-sm-3"> <!--  style="border: 1px solid black;" -->
      <img src="resources/user/img/cat4.png" class="img-thumbnail" alt="cat1">
      <div class="row">
      	<div class="col-sm-9">
      		<p>같이살면 피곤할 수 있겠지만 재밌을거야...^^ 잘 지내보자 우리 후후</p>
      	</div>
      	<div class="col-sm-3" style=" position :relative; padding-right: 20px;">
      		<button type="button" class="btn btn-info" style="position: relative; padding-right: -20px;">Info</button>
      	</div>

      </div>
      
    </div>
    <div class="col-sm-3">
      <img src="resources/user/img/cat4.png" class="img-thumbnail" alt="cat1">
      <h3>Column 2</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
    </div>
    <div class="col-sm-3">
      <img src="resources/user/img/cat4.png" class="img-thumbnail" alt="cat1">
      <h3>Column 3</h3>        
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
    </div>
    <div class="col-sm-3">
      <img src="resources/user/img/cat4.png" class="img-thumbnail" alt="cat1">
      <h3>Column 3</h3>        
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
    </div>
  </div>
  <ul class="pager">
    <li><a href="#">Previous</a></li>
    <li><a href="#">Next</a></li>
  </ul>
</div>

<div class="container">
	<div class="page-header">
    	<h3 class="text-center">관심있는 방이 같은 룸메이트</h3>
    </div>  
</div>

<div class="container">
  <div class="row">
    <div class="col-sm-3">
      <img src="resources/user/img/cat4.png" class="img-thumbnail" alt="cat1">
      <h3>Column 1</h3>
      <div class="row">
      	<div class="col-sm-9">
      		<p>같이살면 피곤할 수 있겠지만 재밌을거야...^^ 잘 지내보자 우리 후후</p>
      	</div>
      	<div class="col-sm-3">
      		<button type="button" class="btn btn-info">Info</button>
      	</div>    
      </div>
      
    </div>
    <div class="col-sm-3">
      <img src="resources/user/img/cat4.png" class="img-thumbnail" alt="cat1">
      <h3>Column 2</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
    </div>
    <div class="col-sm-3">
      <img src="resources/user/img/cat4.png" class="img-thumbnail" alt="cat1">
      <h3>Column 3</h3>        
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
    </div>
    <div class="col-sm-3">
      <img src="resources/user/img/cat4.png" class="img-thumbnail" alt="cat1">
      <h3>Column 3</h3>        
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
    </div>
  </div>
</div>

<div class="container">
	<div class="page-header">
    	<h3 class="text-center">신규로 등록한 룸메이트</h3>
    </div>  
</div>


<div class="container" style="padding-bottom: 70px;">
  <div class="row">
    <div class="col-sm-3">
      <img src="resources/user/img/cat4.png" class="img-thumbnail" alt="cat1">
      <h3>Column 1</h3>
      <div class="row">
      	<div class="col-sm-9">
      		<p>같이살면 피곤할 수 있겠지만 재밌을거야...^^ 잘 지내보자 우리 후후</p>
      	</div>
      	<div class="col-sm-3">
      		<button type="button" class="btn btn-info">Info</button>
      	</div>    
      </div>
      
    </div>
    <div class="col-sm-3">
      <img src="resources/user/img/cat4.png" class="img-thumbnail" alt="cat1">
      <h3>Column 2</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
    </div>
    <div class="col-sm-3">
      <img src="resources/user/img/cat4.png" class="img-thumbnail" alt="cat1">
      <h3>Column 3</h3>        
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
    </div>
    <div class="col-sm-3">
      <img src="resources/user/img/cat4.png" class="img-thumbnail" alt="cat1">
      <h3>Column 3</h3>        
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit..뭐라도 바꾸자</p>
    </div>
  </div>
</div>

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