<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="resources/css/bootstrap.min.css"> 
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="resources/user/css/favorite_recent.css">
<style type="text/css">

.card{
	margin: 20px 1%;
	float:left;
}

.inform{
	
}
<!-- 관심 목록 	밑에 있는 tag 꾸미기 -->

.styleroomattention{
	color : white;
	margin: 20px 20px;
}
.styleroomattention:link{
	color : white;
}
.styleroomattention:visited{
	color : white;
}


<!-- 사진 위 간이 제목 css -->

.menutitle {
	font-size: 24px;
}
.menucontent {
	display:inline-block;
	margin-top: 35px;
	
}

.favorite{
	width: 36px;
    height: 36px;
    position: absolute;
    top: 3px;
    z-index: 1;
    cursor: pointer;
}

.favorite>img{
	width:36px;
	height:36px;
	margin-left:210px;
}

</style>
  
<style type="text/css">


</style>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$(".favorite").click(function(){									//클릭 시 찜하기 기능 
		var favo = $(this).children();									//img태그 하트
			if(favo.attr('src').indexOf('_2') > 0){						//이미지 마지막 index가 _2일 경우
				var test = favo.attr("src").replace('_2.png','_1.png');		//_1로 교체
				favo.attr('src', test);						
				var id = favo.attr('id');								//하트img의 id(방번호) 저장
				favodelete(id);											//찜하기 삭제함수 호출
			} else if(favo.attr('src').indexOf('_1') > 0){				
				var test = favo.attr('src').replace('_1.png','_2.png');
				favo.attr('src', test);
				var id = favo.attr('id');
				favorited(id);											//찜하기 함수 호출
			}
			
   	});
			
	function favodelete(id){		//찜한 방 취소
		$.ajax({
			type: "GET", 
			url:"dibs_delete.user",
			dataType:"json", 
			data: {
				dibsFv : id			// dibsFv - 방번호 보냄
			},
			success : function(result){
				
			},
			error : function(a, b, c){
				alert("삭제에러 : "+a + b + c);
			}
		});
	};
			
	function favorited(id){			//찜한 방 insert
		$.ajax({
			type: "GET", 
			url:"dibs_insert.user",
			dataType:"json", 
			data: {
				dibsFv : id			// dibsFv - 방번호 보냄
			
			},
			success : function(result){
				
			},
			error : function(a, b, c){
				alert("insert에러"+a + b + c);
			}
		});
	};
		
	
	
});

</script>


<title>Insert title here</title>
</head>
<jsp:include page="/WEB-INF/views/user/header.jsp" />
<body>
<!-- rgb(51, 85, 139) 모방 메인색깔 -->
<div class="jumbotron text-center" id="headblock" style="background-color:#33558B;">
  <div>
  	<h1 style="color: white;">관심목록</h1>
  </div>
  <div class="row">
  	<div class="col-sm-3"></div>
  	<div class="col-sm-3 text-left" ><a class="styleroomattention" href="favorite_recent.user" style="font-size: 30px; text-decoration: underline">최근 본 방</a></div>
  	<div class="col-sm-3 text-right"><a class="styleroomattention" href="favorite_dibs.user" style="font-size: 30px;">찜한 방</a></div>
  	<div class="col-sm-3"></div>
  </div>
</div>

<div class="container">

	<div class="page-header">
		<div class="row">
		  <div class="col-sm-4">
		  	<c:choose>
				<c:when test="${count ge 30}">
					<div class="p-2"><span class="menucontent">총 30개의 최근 본 방이 있습니다.</span></div>
				</c:when>
				<c:otherwise>
					<div class="p-2"><span class="menucontent">총 ${count }개의 최근 본 방이 있습니다.</span></div>
				</c:otherwise>
			</c:choose>	
		  </div>
		  <div class="col-sm-4 text-center"><h3>최근 본 방</h3></div>
		  <div class="col-sm-4 text-right"><span class="menucontent">최근 본 방은 최대 30개까지 보여집니다.</span></div>
		</div>
    </div>
    
	
	
	<div>
	<c:choose>
		<c:when test="${empty list }">
			<div class="p-2 border">최근 본 방이 없습니다</div>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list }" var="dto" varStatus="status">
				<div class="card" style="width:23%; height: 300px;">
					<div class="favorite">
						<img id="${dto.no_rm }" src='resources/user/img/favorite_${dto.checkdib}.png' />
					</div>	
					<a href="room_detail.all?myno=${dto.no_rm }">	
					<div class="picture">
						<c:choose>
							<c:when test="${empty imagelist}">
								<img class="card-img-top" src="resources/user/img/noroom.png" alt="Card image" style="width:100%; height:150px;">
							</c:when>
							<c:otherwise>
								<img class="card-img-top" src="${imagelist[status.index]}" alt="Card image" style="width:100%; height:150px;">
							</c:otherwise>
						</c:choose>
						 
					</div>
				    <div class="card-body">
					    <h4 class="card-title">${dto.title_rm }</h4>
					    <p class="card-text">${dto.content_rm }</p>
				    	
				    </div>
				    </a>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</div>
	
	
	
	
	
	
</div>

<div class="container">
	<div class="page-header">
		<div class="row">
		  <div class="col-sm-4"></div>
		  <div class="col-sm-4 text-center"><h3>관심있는 방이 같은 룸메이트</h3></div>
		  <div class="col-sm-4 text-right"><a class="menucontent" href="">더보기</a></div>
		</div>
    </div>
    <div>
    	<div class="card" style="width:23%">
		    <img class="card-img-top" src="resources/user/img/noroom.png" alt="Card image" style="width:100%">
		    <div class="card-body">
		    	
		    
			    <h4 class="card-title">방제목</h4>
			    <p class="card-text">${dto.recentFv }, ${status.index}</p>
			    <a href="#" class="btn btn-primary">프로필보기</a>
		    </div>
		</div>
    </div>  
</div>



<div class="container">
	<div class="page-header">
    	<h3 class="text-center">신규로 등록한 룸메이트</h3>
    </div>
    <div>
    	<div class="card" style="width:23%">
		    <img class="card-img-top" src="resources/user/img/noroom.png" alt="Card image" style="width:100%">
		    <div class="card-body">
			    <h4 class="card-title">${dto.email }</h4>
			    <p class="card-text">${dto.recentFv }, ${status.index}</p>
		    </div>
		</div>
    </div>  
</div>



<%@ include file="form/user_footer.jsp" %>
</body>
</html>