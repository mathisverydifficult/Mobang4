<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/user/css/room_detail.css">
	
<style type="text/css">

.card{
	margin: 20px 1%;
	float:left;
}

</style>	
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a8ded785b631dc1b3efa28d959d4d6d5&libraries=services"></script>

	

<jsp:include page="/WEB-INF/views/user/header.jsp"/>
</head>
<body>
<div class="container">	
	<div class="top">
		<ul class="firstpara">
			<li>
				<p>
					<span>${detail.roomtype_rm }</span>
				</p>
				<div class="myvalue">
					<h2>
						${detail.rent_rm }
						${detail.roomprice_rm }
					</h2>
					<span class="manwon">만원</span>
				</div>
			</li>
			<li>
				<p>전용면적</p>
				<div class="myvalue">
					<h1>
						${detail.roomsize_rm }㎡
					</h1>
				</div>
			</li>
			<li>
				<p>관리비</p>
				<div class="myvalue">
					<h1>
						${detail.expense_rm }
					</h1>
					<span class="manwon">만원</span>
				</div>
			</li>
			<li class="phone" style="display: flex;">
				<div>
					<p>공인중개사이름</p>
					<p>담당자이름</p>
				</div>
				<button>
						연락처보기
				</button>
			</li>
		</ul>
	</div>
	<div class="title">
		<div style="display:inline-block"><h1>${detail.title_rm }</h1></div>
		
		<div style="display:inline-block; float:right;">
			<img class="favorite" id=${detail.no_rm } src="resources/user/img/favorite_1.png" />
		</div>
	</div>
	<div class="detail">
		<div>
			<ul>
				<li>
					<p> · 해당층/건물층</p>
					<div>
						${detail.floor_rm }
						/
						${detail.floor2_rm }
					</div>
				</li>
				<li>
					<p> · 전용/계약면적</p>
					<div>
						${detail.roomsize_rm }
						/
						${detail.roomsize2_rm }
					</div>
				</li>
				<li>
					<p> · 엘리베이터</p>
					<div>
						${detail.elevator_rm }
					</div>
				</li>
				<li>
					<p> · 주차장</p>
					<div>
						${detail.parking_rm }
					</div>
				</li>
				<li>
					<p> · 반려동물</p>
					<div>
						${detail.animal_rm }
					</div>
				</li>
				<li>
					<p> · 베란다/발코니</p>
					<div>
						${detail.veranda_rm }
					</div>
				</li>
				<li>
					<p> · 입주가능일</p>
					<div>
						${detail.roomin_rm }
					</div>
				</li>
				<li>
					<p>  </p>
					<div>
						
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="container">
		<c:choose>
			<c:when test="${empty imagelist }">
				<div>사진이 없습니다.</div>
			</c:when>
			<c:otherwise>
				<div class="row">
				<c:forEach items="${imagelist }" var="image">
					<div class="card" style="width:23%; height: 300px;">
						<img src='${image }' style="width:100%; height:280px;"/>
					</div>
				</c:forEach>
				</div>
			</c:otherwise>		
		</c:choose>
	</div>
	<div class="title">
		<div style="display:inline-block"><h1>옵션</h1></div>
	</div>
	<div class="option">
		<div class="options">
			<c:if test="${not empty detail.aircon_rm}">
				<div class="icon">
					<div class="optionimg">
						<img src='resources/user/img/icon/Aircon.jpg' />
					</div>
					<p>${detail.aircon_rm }</p>
				</div>
			</c:if>
			<c:if test="${not empty detail.washer_rm}">
				<div class="icon">
					<div class="optionimg">
						<img src='resources/user/img/icon/washer.jpg' />
					</div>
					<p>${detail.washer_rm }</p>
				</div>
			</c:if>
			<c:if test="${not empty detail.gasrange_rm}">
				<div class="icon">
					<div class="optionimg">
						<img src='resources/user/img/icon/gasrange.jpg' />
					</div>
					<p>${detail.gasrange_rm }</p>
				</div>
			</c:if>
			<c:if test="${not empty detail.desk_rm}">
				<div class="icon">
					<div class="optionimg">
						<img src='resources/user/img/icon/desk.jpg' />
					</div>
					<p>${detail.desk_rm }</p>
				</div>
			</c:if>
			<c:if test="${not empty detail.tv_rm}">
				<div class="icon">
					<div class="optionimg">
						<img src='resources/user/img/icon/tv.png' />
					</div>
					<p>${detail.tv_rm }</p>
				</div>
			</c:if>
			<c:if test="${not empty detail.ref_rm}">
				<div class="icon">
					<div class="optionimg">
						<img src='resources/user/img/icon/ref.jpg' />
					</div>
					<p>${detail.ref_rm }</p>
				</div>
			</c:if>
			<c:if test="${not empty detail.bed_rm}">
				<div class="icon">
					<div class="optionimg">
						<img src='resources/user/img/icon/bed.jpg' />
					</div>
					<p>${detail.bed_rm }</p>
				</div>
			</c:if>
			<c:if test="${not empty detail.showhouse_rm}">
				<div class="icon">
					<div class="optionimg">
						<img src='resources/user/img/icon/shoes.png' />
					</div>
					<p>${detail.showhouse_rm }</p>
				</div>
			</c:if>
			<c:if test="${not empty detail.microwave_rm}">
				<div class="icon">
					<div class="optionimg">
						<img src='resources/user/img/icon/microwave.jpg' />
					</div>
					<p>${detail.microwave_rm }</p>
				</div>
			</c:if>
			<c:if test="${not empty detail.induction_rm}">
				<div class="icon">
					<div class="optionimg">
						<img src='resources/user/img/icon/induction.jfif' />
					</div>
					<p>${detail.induction_rm }</p>
				</div>
			</c:if>
		</div>
	</div>
	<div class="title">
		<div style="display:inline-block"><h1>위치 및 시설</h1></div>
	</div>
	<div class="location">
		<div id="map" style="height: 500px;"></div>
	</div>
	
	<div class="title">
		<div style="display:inline-block"><h1>취향저격 룸메이트</h1></div>
		<div style="display:inline-block; float:right;"><a href="">룸메이트 추천 페이지></a></div>
	</div>
	<div class="roommate">
		<div class="index"></div>
		<div class="index"></div>
		<div class="index"></div>
		<div class="index"></div>
	</div>
	<div class="title">
		<div style="display:inline-block"><h1>이 공인중개사의 다른 방</h1></div>
	</div>
	<div class="thisagentroom">
	<c:choose>
		<c:when test="${empty agentlist}">
			<div class="p-2 border">중개사가 올린 방이 더 이상 없습니다.</div>
		</c:when>
		<c:otherwise>
			<c:forEach items="${agentlist }" var="dto" varStatus="status">
				<div class="card" style="width:23%; height: 300px; ">
					<a href="room_detail.all?myno=${dto.no_rm }">	
					<div class="picture">
						<c:choose>
							<c:when test="${empty agentimglist[status.index]}">
								<img class="card-img-top" src="resources/user/img/noroom.png" alt="Card image" style="width:100%; height:150px;">
							</c:when>
							<c:otherwise>
								<img class="card-img-top" src="${agentimglist[status.index]}" alt="Card image" style="width:100%; height:150px;">
							</c:otherwise>
						</c:choose>
						 
					</div>
				    <div class="card-body">
					    <h4 class="card-title">${dto.title_rm }</h4>
					    <p class="card-text">${dto.roomtype_rm }</p>
				    	
				    </div>
				    </a>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</div>
</div>

<jsp:include page="/WEB-INF/views/user/footer.jsp" />

<script type="text/javascript">

	//마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	var infowindow = new kakao.maps.InfoWindow({
		zIndex : 1
	});
	
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(37.271, 127.435),
		level : 6
	};	
	
	var map = new kakao.maps.Map(container, options); //지도 생성
	
	var geocoder=new kakao.maps.services.Geocoder(); //주소 - 좌표 변환 객체 생성
	
		geocoder.addressSearch( "${detail.addr_rm}", function(result, status){	//address = "매물의 주소"
		
		//정상적으로 검색이 완료됐을 경우
		if(status===kakao.maps.services.Status.OK){
			var coords=new kakao.maps.LatLng(result[0].y, result[0].x);
			yy = result[0].x;
			xx = result[0].y;
			
			//결과값으로 받은 위치를 마커로 표시
			var marker = new kakao.maps.Marker({
				map : map,
				position: coords
			});
			map.setCenter(coords);
		}
		kakao.maps.event
		.addListener(
			marker,
			'click',
			function() {
				//마커를 클릭하면 장소명이 인포 윈도우에 표출
				infowindow.setContent('<div style="padding:4px; font-size:11px;">'+ '${detail.addr_rm}' + '</div>');
				infowindow.open(map, marker);
			});
		});
	
		// 찜하기 기능
		$(".favorite").click(function(){
		
			var favo = $(this);
			if (favo.attr("src").indexOf("_2") > 0) {						//찜한 방일 경우
				var test = favo.attr("src").replace("_2.png", "_1.png");	//이미지를 빈하트(_1)로 교체 
				favo.attr('src', test);				
				var id = favo.attr('id');									//방 번호 id에저장
// 				favodelete(id);												//찜하기 삭제함수 호출
			} else if (favo.attr("src").indexOf("_1") > 0) {
				var test = favo.attr("src").replace("_1.png", "_2.png");	//빨간하트(_2)로 교체
				favo.attr('src', test);										
				var id = favo.attr('id');
//				favorited(id);												//찜하기 함수 호출
			}

		});

// 		function favodelete(id) {		//찜한방 삭제
// 			$.ajax({
// 				type : "GET", 
// 				url : "dibs_delete.user",
// 				dataType : "json", 
// 				data : {
// 					dibsFv : id
// 				},
// 				success : function(result) {

// 				},
// 				error : function(a, b, c) {
// 					alert("삭제에러 : " + a + b + c);
// 				}
// 			});
// 		}

// 		function favorited(id) {		//찜한방 추가
// 			$.ajax({
// 				type : "GET",
// 				url : "dibs_insert.user",
// 				dataType : "json",
// 				data : {
// 					dibsFv : id

// 				},
// 				success : function(result) {

// 				},
// 				error : function(a, b, c) {
// 					alert("insert에러" + a + b + c);
// 				}
// 			});
// 		}
</script>


</body>
</html>