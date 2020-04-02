 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="resources/css/bootstrap.min.css"> 
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="resources/user/css/favorite_dibs.css">
  
<style type="text/css">


</style>  

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<jsp:include page="/WEB-INF/views/user/header.jsp" />
<body>

<h1>${count }</h1>
<h2>${list }</h2>


<!-- 댓글다는 페이지 할 때 참고할 페이지 
https://www.w3schools.com/bootstrap/tryit.asp?filename=trybs_temp_blog&stacked=h

 -->
<!-- 펼치면서 디브때매 밀림.. -->
<!-- rgb(51, 85, 139) 모방 메인색깔 -->
<div class="jumbotron text-center" id="headblock" style="background-color:#33558B;">
  <div>
  	<h1 style="color: white;">관심목록</h1>
  </div>
  <div>
  	<a class="styleroomattention" href="" style="font-size: 30px;">최근 본 방</a>
  	<a class="styleroomattention" href="" style="font-size: 30px;">찜한 방</a>
  </div>
</div>

<div class="container">
  <div class="page-header">
    <h3 class="text-left">찜한 방</h3>
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
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
    </div>
  </div>
</div>



<%@ include file="form/user_footer.jsp" %>

</body>
</html>