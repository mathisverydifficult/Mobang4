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
<link rel="stylesheet" href="resources/user/css/favorite_recent.css">
  
<style type="text/css">

#headblock{
	margin-top: 186px;
}


</style>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>




<title>Insert title here</title>
<%@ include file="form/user_header.jsp" %>
</head>
<body>

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
	    	<h3 class="text-left">최근 본 방</h3>
	    </div>
</div>
           
<div class="container">
		<p>총 34개의 최근 본 방이 있습니다.</p>
		<p style="">최근 본 방은 최대 50개까지 저장됩니다.</p>
</div>

<div class="container">
  <div class="row">
    <div class="col-sm-3"> <!--  style="border: 1px solid black;" -->
      <img src="resources/user/img/cat4.png" class="img-thumbnail" alt="cat1" style= "margin-bottom: 20px;">
      <div>
      	<p>아파트</p>
      	<p style="font-size: 20px; font-weight: bold;">월세 300/30</p>
		<p>5층 42.7제곱</p>
		<p>내용 ....</p>
      </div>  
    </div>
    
    <div class="col-sm-3"> <!--  style="border: 1px solid black;" -->
      <img src="resources/user/img/cat4.png" class="img-thumbnail" alt="cat1" style= "margin-bottom: 20px;">
      <div>
      	<p>아파트</p>
      	<p style="font-size: 20px; font-weight: bold;">월세 300/30</p>
		<p>5층 42.7제곱</p>
		<p>내용 ....</p>
      </div>  
    </div>
    <div class="col-sm-3"> <!--  style="border: 1px solid black;" -->
      <img src="resources/user/img/cat4.png" class="img-thumbnail" alt="cat1" style= "margin-bottom: 20px;">
      <div>
      	<p>아파트</p>
      	<p style="font-size: 20px; font-weight: bold;">월세 300/30</p>
		<p>5층 42.7제곱</p>
		<p>내용 ....</p>
      </div>  
    </div>
    <div class="col-sm-3"> <!--  style="border: 1px solid black;" -->
      <img src="resources/user/img/cat4.png" class="img-thumbnail" alt="cat1" style= "margin-bottom: 20px;">
      <div>
      	<p>아파트</p>
      	<p style="font-size: 20px; font-weight: bold;">월세 300/30</p>
		<p>5층 42.7제곱</p>
		<p>내용 ....</p>
      </div>  
    </div>
  </div>
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